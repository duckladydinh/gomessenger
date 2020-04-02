package main

import (
	"net/http"
)

func main() {
	// connect ui (a full yarn/parcel/react project)
	ui := http.FileServer(http.Dir("./ui/dist"))

	// register and listen
	mux := http.NewServeMux()
	mux.Handle("/", ui)
	http.ListenAndServe(":4000", mux)
}
