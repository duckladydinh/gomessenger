package query

type ChatMessageQuery struct {
	UserId string
	After  int64
}

type ChatUserQuery struct {
	UserId string
}
