package service

import (
	"context"
	"github.com/duckladydinh/gomessenger/model"
	"github.com/duckladydinh/gomessenger/rpc"
	"github.com/duckladydinh/gomessenger/store"
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

func (server *ChatServiceServer) AddChatMessage(_ context.Context, r *rpc.AddChatMessageRequest) (*rpc.Response, error) {
	log.Println(".AddChatMessage", r.Message)
	msg := &model.ChatMessage{
		Id:      uuid.New().String(),
		Time:    r.Timestamp,
		UserId:  r.UserId,
		Content: r.Message,
	}
	server.messageStore.AddMessage(msg)
	server.channelStreamStore.Broadcast(msg)

	res := &rpc.Response{
		Code:    200,
		Message: "Message Successfully Added",
	}
	return res, nil
}

func (server *ChatServiceServer) GetChatChannel(r *rpc.GetChatChannelRequest, s rpc.ChatService_GetChatChannelServer) error {
	log.Println(".GetChatChannel", r.UserId, r.ChannelId)
	ch := make(chan *rpc.ChatMessage)
	server.channelStreamStore.AddStream(r.UserId, ch)

	for msg := range ch {
		_ = s.Send(msg)
	}
	return nil
}
