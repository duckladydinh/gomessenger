protoc -Iproto proto/chat_service.proto \
  --go_out=plugins=grpc:go/api \
  --dart_out=grpc:flutter/lib/api \
  --js_out=import_style=commonjs:web/src/api/ \
  --grpc-web_out=import_style=commonjs,mode=grpcwebtext:web/src/api/
