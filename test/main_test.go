package test

import (
	"fmt"
	"github.com/duckladydinh/gochat/api/message"
	"github.com/duckladydinh/gochat/api/model"
	"github.com/duckladydinh/gochat/store"
	"github.com/google/uuid"
	"github.com/stretchr/testify/assert"
	"testing"
	"time"
)

func TestMessageCryptography(t *testing.T) {
	payload := model.ChatMessage{
		Id:      "1",
		Time:    time.Now().UnixNano(),
		UserId:  "1",
		Content: "Hello, Kitty!",
	}

	msg := message.NewMessage(message.AddMessage, payload)
	b := msg.ToJsonBytes()
	decodedMsg := message.ReadMessage(b)

	var decodedPayload model.ChatMessage
	decodedMsg.ParsePayload(&decodedPayload)

	assert.Equal(t, payload, decodedPayload)
}

func TestMessageStore(t *testing.T) {
	const NumberOfMessages int = 100
	const NumberOfUsers int = 20
	msgStore := store.NewMessageStore()
	usrStore := store.NewUserStore()
	messages := make(chan model.ChatMessage)

	go func() {
		after := int64(0)

		retries := 5
		for retries > 0 {
			if msgStore.LastTime() == after {
				retries -= 1
			} else {
				cur := msgStore.GetMessages(after)
				assert.Greater(t, len(cur), 0)
				retries = 5
				for _, msg := range cur {
					messages <- msg
					after = msg.Time
				}
			}
			time.Sleep(10 * time.Millisecond)
		}
		close(messages)
	}()

	go func() {
		for i := 0; i < NumberOfUsers; i++ {
			user := model.ChatUser{
				Id:   fmt.Sprintf("User-%v", i),
				Name: fmt.Sprintf("User-%v", i),
			}
			usrStore.AddUser(user)
		}

		for i := 1; i <= NumberOfMessages; i++ {
			userId := fmt.Sprintf("User-%v", i%NumberOfUsers)
			user, err := usrStore.GetUser(userId)
			assert.Nil(t, err)

			chatMsg := model.ChatMessage{
				Id:      uuid.New().String(),
				Time:    time.Now().UnixNano(),
				UserId:  userId,
				Content: fmt.Sprintf("Message %v by %v", i, user.Name),
			}
			msgStore.AddMessage(chatMsg)

			time.Sleep(15 * time.Millisecond)
		}
	}()

	cnt := 0
	for msg := range messages {
		assert.Contains(t, msg.Content, msg.UserId)
		cnt += 1
	}
	assert.Equal(t, NumberOfMessages, cnt)
}
