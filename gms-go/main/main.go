package main

import (
	"github.com/duckladydinh/gomessenger/constants"
	"github.com/duckladydinh/gomessenger/rpc"
	"github.com/duckladydinh/gomessenger/service"
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
	rpc.RegisterChatServiceServer(server, chatServiceServer)

	httpServer := http.Server{
		Addr: constants.ServerAddress,
		Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			webServer.ServeHTTP(w, r)
		}),
	}

	log.Println("Starting server at", httpServer.Addr)
	if err := httpServer.ListenAndServe(); err != nil {
		log.Fatal(err)
	}
}
