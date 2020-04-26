import 'package:fixnum/fixnum.dart';
import 'package:gms/rpc/chat_service.pbgrpc.dart' as rpc;
import 'package:grpc/grpc_web.dart';

class ChatService {
  static final client = _getClient();

  static Future<String> registerUser(String name) async {
    final req = rpc.RegisterUserRequest()..name = name;

    String id;
    await client.registerUser(req).then((res) {
      id = res.userId;
    });
    return id;
  }

  static Future<void> addChatMessage(String userId, String msg) async {
    final req = rpc.AddChatMessageRequest()
      ..userId = userId
      ..timestamp = Int64(DateTime.now().microsecondsSinceEpoch)
      ..message = msg;
    await client.addChatMessage(req);
  }

  static Stream<rpc.ChatMessage> getChatChannel(String userId) {
    final req = rpc.GetChatMessageStreamRequest()..userId = userId;
    return client.getChatMessageStream(req);
  }

  static rpc.ChatServiceClient _getClient() {
    final channel = GrpcWebClientChannel.xhr(Uri(host: "0.0.0.0", port: 9090));
    return rpc.ChatServiceClient(channel);
  }
}
