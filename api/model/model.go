package model

type ChatMessage struct {
	Id      string
	Time    int64
	UserId  string
	Content string
}

type ChatUser struct {
	Id   string
	Name string
}
