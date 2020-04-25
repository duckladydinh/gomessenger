protoc -Iproto proto/chat_service.proto \
  --go_out=plugins=grpc:go/rpc \
  --dart_out=grpc:flutter/lib/rpc
#  --js_out=import_style=commonjs:web/src/rpc/ \
#  --grpc-web_out=import_style=commonjs,mode=grpcwebtext:web/src/rpc/ \
