package main

import (
	"log"
	"net/http"
)

func main() {
	// register and listen
	mux := http.NewServeMux()

	// connect ui (a full yarn/parcel/react project)
	ui := http.FileServer(http.Dir("./ui/dist"))
	mux.Handle("/", ui)

	err := http.ListenAndServe(":4000", mux)
	log.Fatal(err)
}
