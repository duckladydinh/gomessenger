package store

import (
	"errors"
	"fmt"
	"github.com/duckladydinh/gochat/api/model"
)

func NewUserStore() *UserStore {
	s := new(UserStore)
	s.data = map[string]model.ChatUser{}
	return s
}

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
