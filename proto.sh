protoc -Iproto proto/chat_service.proto \
  --go_out=plugins=grpc:backend/api \
  --dart_out=grpc:frontend/lib/api
