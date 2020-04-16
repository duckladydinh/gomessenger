package main

import (
	"github.com/duckladydinh/gochat/api"
	"github.com/duckladydinh/gochat/service"
	"github.com/improbable-eng/grpc-web/go/grpcweb"
	"google.golang.org/grpc"
	"log"
	"net/http"
)

func main() {
	server := grpc.NewServer()
	webServer := grpcweb.WrapServer(server, grpcweb.WithOriginFunc(func(_ string) bool {
		return true
	}))

	chatServiceServer := service.NewChatServiceServer()
	api.RegisterChatServiceServer(server, chatServiceServer)

	httpServer := http.Server{
		Addr: ":9090",
		Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			webServer.ServeHTTP(w, r)
		}),
	}

	if err := httpServer.ListenAndServe(); err != nil {
		log.Fatal(err)
	}
}
