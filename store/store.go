package store

import (
	"github.com/duckladydinh/gochat/api/model"
	"sync"
)

type MessageStore struct {
	data []model.ChatMessage
	mux  sync.Mutex
}

type UserStore struct {
	data map[string]model.ChatUser
	mux  sync.Mutex
}
