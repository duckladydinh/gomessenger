package store

import (
	"github.com/duckladydinh/gochat/api/model"
)

func NewMessageStore() *MessageStore {
	s := new(MessageStore)
	s.data = make([]model.ChatMessage, 0)
	return s
}

func (s *MessageStore) AddMessage(msg model.ChatMessage) {
	s.mux.Lock()
	s.data = append(s.data, msg)
	for i := len(s.data) - 1; i > 0 && s.data[i].Time < s.data[i-1].Time; i-- {
		s.data[i-1], s.data[i] = s.data[i], s.data[i-1]
	}
	s.mux.Unlock()
}

func (s MessageStore) GetMessages(after int64) []model.ChatMessage {
	n := len(s.data)
	from := n

	for i := n - 1; i >= 0 && s.data[i].Time > after; i-- {
		from = i
	}

	res := make([]model.ChatMessage, n-from)
	for i := from; i < n; i++ {
		res[i-from] = s.data[i]
	}

	return res
}

func (s MessageStore) LastTime() int64 {
	n := len(s.data)
	if n == 0 {
		return 0
	}
	return s.data[n-1].Time
}
