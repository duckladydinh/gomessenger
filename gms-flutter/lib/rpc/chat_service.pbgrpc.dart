///
//  Generated code. Do not modify.
//  source: chat_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat_service.pb.dart' as $0;
export 'chat_service.pb.dart';

class ChatServiceClient extends $grpc.Client {
  static final _$addChatMessage =
      $grpc.ClientMethod<$0.AddChatMessageRequest, $0.Response>(
          '/ChatService/AddChatMessage',
          ($0.AddChatMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$getChatChannel =
      $grpc.ClientMethod<$0.GetChatChannelRequest, $0.ChatMessage>(
          '/ChatService/GetChatChannel',
          ($0.GetChatChannelRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Response> addChatMessage(
      $0.AddChatMessageRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$addChatMessage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.ChatMessage> getChatChannel(
      $0.GetChatChannelRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getChatChannel, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddChatMessageRequest, $0.Response>(
        'AddChatMessage',
        addChatMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AddChatMessageRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetChatChannelRequest, $0.ChatMessage>(
        'GetChatChannel',
        getChatChannel_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.GetChatChannelRequest.fromBuffer(value),
        ($0.ChatMessage value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> addChatMessage_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddChatMessageRequest> request) async {
    return addChatMessage(call, await request);
  }

  $async.Stream<$0.ChatMessage> getChatChannel_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetChatChannelRequest> request) async* {
    yield* getChatChannel(call, await request);
  }

  $async.Future<$0.Response> addChatMessage(
      $grpc.ServiceCall call, $0.AddChatMessageRequest request);
  $async.Stream<$0.ChatMessage> getChatChannel(
      $grpc.ServiceCall call, $0.GetChatChannelRequest request);
}
