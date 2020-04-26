package api

type ChatMessage struct {
	Id        string
	UserId    string
	Timestamp int64
	Message   string
}

type ChatUser struct {
	Id   string
	Name string
}
