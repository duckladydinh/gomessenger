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
  static final _$registerUser =
      $grpc.ClientMethod<$0.RegisterUserRequest, $0.RegisterUserResponse>(
          '/ChatService/RegisterUser',
          ($0.RegisterUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegisterUserResponse.fromBuffer(value));
  static final _$addChatMessage =
      $grpc.ClientMethod<$0.AddChatMessageRequest, $0.Empty>(
          '/ChatService/AddChatMessage',
          ($0.AddChatMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getChatMessageStream =
      $grpc.ClientMethod<$0.GetChatMessageStreamRequest, $0.ChatMessage>(
          '/ChatService/GetChatMessageStream',
          ($0.GetChatMessageStreamRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.RegisterUserResponse> registerUser(
      $0.RegisterUserRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$registerUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> addChatMessage(
      $0.AddChatMessageRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$addChatMessage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.ChatMessage> getChatMessageStream(
      $0.GetChatMessageStreamRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getChatMessageStream, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'ChatService';

  ChatServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.RegisterUserRequest, $0.RegisterUserResponse>(
            'RegisterUser',
            registerUser_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.RegisterUserRequest.fromBuffer(value),
            ($0.RegisterUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddChatMessageRequest, $0.Empty>(
        'AddChatMessage',
        addChatMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AddChatMessageRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetChatMessageStreamRequest, $0.ChatMessage>(
            'GetChatMessageStream',
            getChatMessageStream_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.GetChatMessageStreamRequest.fromBuffer(value),
            ($0.ChatMessage value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterUserResponse> registerUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RegisterUserRequest> request) async {
    return registerUser(call, await request);
  }

  $async.Future<$0.Empty> addChatMessage_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddChatMessageRequest> request) async {
    return addChatMessage(call, await request);
  }

  $async.Stream<$0.ChatMessage> getChatMessageStream_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetChatMessageStreamRequest> request) async* {
    yield* getChatMessageStream(call, await request);
  }

  $async.Future<$0.RegisterUserResponse> registerUser(
      $grpc.ServiceCall call, $0.RegisterUserRequest request);
  $async.Future<$0.Empty> addChatMessage(
      $grpc.ServiceCall call, $0.AddChatMessageRequest request);
  $async.Stream<$0.ChatMessage> getChatMessageStream(
      $grpc.ServiceCall call, $0.GetChatMessageStreamRequest request);
}
