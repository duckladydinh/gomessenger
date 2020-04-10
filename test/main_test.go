package test

import (
	"fmt"
	"github.com/duckladydinh/gochat/api/message"
	"github.com/duckladydinh/gochat/api/model"
	"github.com/duckladydinh/gochat/store"
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
	db := store.NewMessageStore()
	c := make(chan int)

	go func() {
		after := int64(0)
		res := make([]model.ChatMessage, 0)

		retries := 5
		for retries > 0 {
			cur := db.GetMessages(after)
			if len(cur) == 0 {
				retries -= 1
			} else {
				retries = 5
				for _, msg := range cur {
					res = append(res, msg)
					after = msg.Time
				}
			}

			time.Sleep(10 * time.Millisecond)
		}

		c <- len(res)
		close(c)
	}()

	go func() {
		for i := 1; i <= NumberOfMessages; i++ {
			chatMsg := model.ChatMessage{
				Id:      fmt.Sprintf("Id-%v", i),
				Time:    time.Now().UnixNano(),
				UserId:  fmt.Sprintf("User-%v", i),
				Content: fmt.Sprintf("I am message %v", i),
			}

			db.AddMessage(chatMsg)

			time.Sleep(10 * time.Millisecond)
		}
	}()

	assert.Equal(t, NumberOfMessages, <-c)
}
