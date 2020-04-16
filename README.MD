# Go + gRPC + Flutter = Awesome Chap App

## Goals
I want to learn **GO** by building a small chat app with Go backend, Websocket or gRPC (*in consideration*) and React + Material UI or Flutter (*in cosideration*) frontend.

Why? My research suggested that Go is best for web application backend and microservices. The frontend is hence needed and a good way to transfer data is also very important.

## Current Problems
 - [x] GRPC doesn't work well for WEB -> gRPC-Web (server streaming not working).

## Tasks
 - [x] Auto-generate models in Go and JS -> the pain of rewriting the same stuff in the client-side -> gRPC + protobuf 3.
 - [x] Play with Flutter Web -> incredible but some problems with releaseing.
 - [x] Test if Go can publish a web UI -> by http.FileServer.
 - [x] ~~Test websocket communication -> by gorilla/websocket.~~ (outdated)
 - [ ] Build a non-compromised chat UI.
 - [ ] Implement all key features.
 - [ ] Deploy to a docker image.
 - [ ] Deploy to Google Cloud.
