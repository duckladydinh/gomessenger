package store

import (
	"github.com/duckladydinh/gomessenger/api"
	"github.com/duckladydinh/gomessenger/model"
	"sync"
)

type ChannelStreamStore struct {
	data      map[string]chan *api.ChatMessage
	mux       sync.Mutex
	channelId string
}

func NewChannelStreamStore(channelId string) *ChannelStreamStore {
	return &ChannelStreamStore{
		data:      make(map[string]chan *api.ChatMessage),
		channelId: channelId,
	}
}

func (s *ChannelStreamStore) AddStream(userId string, stream chan *api.ChatMessage) {
	s.data[userId] = stream
}

func (s *ChannelStreamStore) Broadcast(msg *model.ChatMessage) {
	sendMsg := &api.ChatMessage{
		MessageId: msg.Id,
		UserId:    msg.UserId,
		ChannelId: s.channelId,
		Timestamp: msg.Time,
		Content:   msg.Content,
	}

	s.mux.Lock()
	for _, stream := range s.data {
		stream <- sendMsg
	}
	s.mux.Unlock()
}
