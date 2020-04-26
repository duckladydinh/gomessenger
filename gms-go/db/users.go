package db

import (
	"github.com/duckladydinh/gomessenger/api"
	"sync"
)

type UserDB struct {
	data map[string]*api.ChatUser
	mux  sync.Mutex
}

func NewUserDB() *UserDB {
	return &UserDB{
		data: map[string]*api.ChatUser{},
	}
}

func (s *UserDB) AddUser(user *api.ChatUser) {
	s.mux.Lock()
	defer s.mux.Unlock()

	s.data[user.Id] = user
}

func (s *UserDB) GetUser(userId string) *api.ChatUser {
	s.mux.Lock()
	defer s.mux.Unlock()

	if v, ok := s.data[userId]; ok {
		return v
	}
	return nil
}
