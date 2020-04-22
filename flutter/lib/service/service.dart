import 'package:fixnum/fixnum.dart';
import 'package:frontend/api/chat_service.pb.dart' as model;
import 'package:frontend/api/chat_service.pbgrpc.dart' as api;
import 'package:grpc/grpc_web.dart';

class Service {
  static api.ChatServiceClient client = _getClient();

  static Future<model.Response> addChatMessage(String msg) async {
    model.AddChatMessageRequest req = model.AddChatMessageRequest();
    req.userId = "usr01";
    req.channelId = "public";
    req.timestamp = Int64(DateTime.now().microsecondsSinceEpoch);
    req.message = msg;
    return await client.addChatMessage(req);
  }

  static Stream<model.ChatMessage> getChatChannel() {
    model.GetChatChannelRequest req = model.GetChatChannelRequest();
    req.userId = "usr01";
    req.channelId = "public";
    return client.getChatChannel(req);
  }

  static api.ChatServiceClient _getClient() {
    final channel = GrpcWebClientChannel.xhr(Uri(host: "0.0.0.0", port: 9090));
    return api.ChatServiceClient(channel);
  }
}
