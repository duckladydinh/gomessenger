protoc -Iproto proto/chat_service.proto \
  --go_out=plugins=grpc:gms-go/rpc \
  --dart_out=grpc:gms-flutter/lib/rpc
#  --js_out=import_style=commonjs:gms-web/src/rpc/ \
#  --grpc-web_out=import_style=commonjs,mode=grpcwebtext:gms-web/src/rpc/ \
