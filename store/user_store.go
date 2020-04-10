package store

import (
	"errors"
	"fmt"
	"github.com/duckladydinh/gochat/api/model"
)

func (s *UserStore) AddUser(user model.ChatUser) {
	s.mux.Lock()
	s.data[user.Id] = user
	s.mux.Unlock()
}

func (s UserStore) GetUser(userId string) (model.ChatUser, error) {
	if v, ok := s.data[userId]; ok {
		return v, nil
	}
	return model.ChatUser{}, errors.New(fmt.Sprintf("User (id = %v) not found", userId))
}
