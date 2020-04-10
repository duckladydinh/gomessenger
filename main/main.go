package main

import (
	"github.com/duckladydinh/gochat/api/message"
	"github.com/duckladydinh/gochat/api/model"
	"github.com/duckladydinh/gochat/api/query"
	"github.com/gorilla/websocket"
	"log"
	"net/http"
	"time"
)

func main() {
	upgrader := websocket.Upgrader{
		ReadBufferSize:  1 << 16,
		WriteBufferSize: 1 << 16,
	}
	//register and listen
	mux := http.NewServeMux()

	// connect ui (a full yarn/parcel/react project)
	ui := http.FileServer(http.Dir("./ui/dist"))
	mux.Handle("/", ui)

	// websocket
	mux.HandleFunc("/ws", handleWebsocket(upgrader))

	err := http.ListenAndServe(":4000", mux)
	log.Fatal(err)
}

func handleWebsocket(upgrader websocket.Upgrader) func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		conn, err := upgrader.Upgrade(w, r, nil)
		if err != nil {
			log.Println(err)
			return
		}

		for {
			var msg message.Message
			if err := conn.ReadJSON(&msg); err != nil {
				log.Println(err)
				return
			}
			log.Printf("Message Received: %v\n", msg)

			switch msg.Type {
			case message.AddUser:
				var user model.ChatUser
				msg.ParsePayload(&user)
				log.Printf("Payload: %v", user)
			case message.QueryUser:
				var userQuery query.ChatUserQuery
				msg.ParsePayload(&userQuery)
				log.Printf("Payload: %v", userQuery)
			case message.AddMessage:
				var chatMsg model.ChatMessage
				msg.ParsePayload(&chatMsg)
				log.Printf("Payload: %v", chatMsg)
			case message.QueryMessage:
				var msgQuery query.ChatMessageQuery
				msg.ParsePayload(&msgQuery)
				log.Printf("Payload: %v", msgQuery)
			default:
				log.Printf("Unrecognized Message Type: %v\n", msg.Type)
			}

			time.Sleep(1 * time.Second)
		}
	}
}
