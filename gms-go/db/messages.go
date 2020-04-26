package db

import (
	"github.com/duckladydinh/gomessenger/api"
	"sync"
)

type MessageDB struct {
	data          []*api.ChatMessage
	lastTimestamp int64
	mux           sync.Mutex
}

func NewMessageDB() *MessageDB {
	return &MessageDB{
		data:          make([]*api.ChatMessage, 0),
		lastTimestamp: 0,
	}
}

func (s *MessageDB) AddMessage(msg *api.ChatMessage) {
	s.mux.Lock()
	defer s.mux.Unlock()

	s.lastTimestamp = msg.Timestamp
	s.data = append(s.data, msg)
	n := len(s.data)
	for i := n - 1; i > 0 && s.data[i].Timestamp < s.data[i-1].Timestamp; i-- {
		s.data[i-1], s.data[i] = s.data[i], s.data[i-1]
	}
}

func (s *MessageDB) GetMessages(after int64) []*api.ChatMessage {
	s.mux.Lock()
	defer s.mux.Unlock()

	n := len(s.data)
	from := n

	for i := n - 1; i >= 0 && s.data[i].Timestamp > after; i-- {
		from = i
	}

	res := make([]*api.ChatMessage, n-from)
	for i := from; i < n; i++ {
		res[i-from] = s.data[i]
	}
	return res
}

func (s *MessageDB) LastTimestamp() int64 {
	s.mux.Lock()
	defer s.mux.Unlock()

	return s.lastTimestamp
}
