package store

import (
	"github.com/duckladydinh/gomessenger/model"
	"github.com/duckladydinh/gomessenger/rpc"
	"sync"
)

type ChannelStreamStore struct {
	data      map[string]chan *rpc.ChatMessage
	mux       sync.Mutex
	channelId string
}

func NewChannelStreamStore(channelId string) *ChannelStreamStore {
	return &ChannelStreamStore{
		data:      make(map[string]chan *rpc.ChatMessage),
		channelId: channelId,
	}
}

func (s *ChannelStreamStore) AddStream(userId string, stream chan *rpc.ChatMessage) {
	s.data[userId] = stream
}

func (s *ChannelStreamStore) Broadcast(msg *model.ChatMessage) {
	sendMsg := &rpc.ChatMessage{
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
