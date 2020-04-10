package message

import (
	"encoding/json"
)

type Type string

const (
	AddMessage   Type = "message.add"
	QueryMessage      = "message.query"
	AddUser           = "user.add"
	QueryUser         = "user.query"
)

type Message struct {
	Type    Type
	Payload []byte
}

func (msg Message) ParsePayload(x interface{}) error {
	return json.Unmarshal(msg.Payload, x)
}

func (msg Message) ToJsonBytes() []byte {
	b, _ := json.Marshal(msg)
	return b
}

func NewMessage(t Type, p interface{}) *Message {
	msg := new(Message)
	msg.Type = t
	msg.Payload, _ = json.Marshal(p)
	return msg
}

func ReadMessage(b []byte) *Message {
	msg := new(Message)
	json.Unmarshal(b, &msg)
	return msg
}
