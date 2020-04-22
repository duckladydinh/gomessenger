package service

import (
	"context"
	"github.com/duckladydinh/gochat/api"
	"github.com/duckladydinh/gochat/model"
	"github.com/duckladydinh/gochat/store"
	"github.com/google/uuid"
	"log"
)

type ChatServiceServer struct {
	messageStore       *store.MessageStore
	userStore          *store.UserStore
	channelStreamStore *store.ChannelStreamStore
}

func NewChatServiceServer() *ChatServiceServer {
	return &ChatServiceServer{
		messageStore:       store.NewMessageStore(),
		userStore:          store.NewUserStore(),
		channelStreamStore: store.NewChannelStreamStore("public"),
	}
}

func (server *ChatServiceServer) AddChatMessage(_ context.Context, r *api.AddChatMessageRequest) (*api.Response, error) {
	log.Println(".AddChatMessage", r.Message)
	msg := &model.ChatMessage{
		Id:      uuid.New().String(),
		Time:    r.Timestamp,
		UserId:  r.UserId,
		Content: r.Message,
	}
	server.messageStore.AddMessage(msg)
	server.channelStreamStore.Broadcast(msg)

	res := &api.Response{
		Code:    200,
		Message: "Message Successfully Added",
	}
	return res, nil
}

func (server *ChatServiceServer) GetChatChannel(r *api.GetChatChannelRequest, s api.ChatService_GetChatChannelServer) error {
	log.Println(".GetChatChannel", r.UserId, r.ChannelId)
	server.channelStreamStore.AddStream(r.UserId, &s)
	_ = s.Send(&api.ChatMessage{
		MessageId: "000",
		UserId:    "usr01",
		ChannelId: "public",
		Timestamp: 1234,
		Content:   "Hallo, I am Server!",
	})
	log.Println("Original Address:", &s)
	return nil
}
