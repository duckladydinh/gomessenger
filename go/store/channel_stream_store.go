package store

import (
	"github.com/duckladydinh/gochat/api"
	"github.com/duckladydinh/gochat/model"
	"log"
	"sync"
)

type ChannelStreamStore struct {
	data      map[string]*api.ChatService_GetChatChannelServer
	mux       sync.Mutex
	channelId string
}

func NewChannelStreamStore(channelId string) *ChannelStreamStore {
	return &ChannelStreamStore{
		data:      make(map[string]*api.ChatService_GetChatChannelServer),
		channelId: channelId,
	}
}

func (s *ChannelStreamStore) AddStream(userId string, stream *api.ChatService_GetChatChannelServer) {
	s.data[userId] = stream
}

func (s *ChannelStreamStore) Broadcast(msg *model.ChatMessage) {
	sendMsg := api.ChatMessage{
		MessageId: msg.Id,
		UserId:    msg.UserId,
		ChannelId: s.channelId,
		Timestamp: msg.Time,
		Content:   msg.Content,
	}

	rm := make([]string, 0)
	s.mux.Lock()
	for userId, stream := range s.data {
		e := (*stream).Send(&sendMsg)
		log.Println(".Broadcast", userId, stream, e)
		if e != nil {
			rm = append(rm, userId)
		}
	}
	s.mux.Unlock()

	for _, userId := range rm {
		delete(s.data, userId)
	}
}
