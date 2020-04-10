package query

type ChatMessageQuery struct {
	UserId  string
	MinTime int64
	MaxTime int64
}

type ChatUserQuery struct {
	UserId string
}
