package util

import (
	"fmt"
	"github.com/google/uuid"
	"time"
)

// many languages won't have nano or micro supported
// so a util for milliseconds will come in handy
func UnixMilli() int64 {
	return time.Now().UnixNano() / 1000000
}

func NewTimedId() string {
	id := uuid.New().String()
	now := UnixMilli()
	return fmt.Sprintf("%v@%v", id, now)
}

func NewUserId() string {
	id := NewTimedId()
	return fmt.Sprintf("%v$%v", id, "user")
}

func NewMessageId() string {
	id := NewTimedId()
	return fmt.Sprintf("%v$%v", id, "msg")
}
