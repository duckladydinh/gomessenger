///
//  Generated code. Do not modify.
//  source: chat_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Empty clone() => Empty()..mergeFromMessage(this);
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty _defaultInstance;
}

class RegisterUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RegisterUserRequest', createEmptyInstance: create)
    ..aOS(1, 'name')
    ..hasRequiredFields = false
  ;

  RegisterUserRequest._() : super();
  factory RegisterUserRequest() => create();
  factory RegisterUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RegisterUserRequest clone() => RegisterUserRequest()..mergeFromMessage(this);
  RegisterUserRequest copyWith(void Function(RegisterUserRequest) updates) => super.copyWith((message) => updates(message as RegisterUserRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterUserRequest create() => RegisterUserRequest._();
  RegisterUserRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterUserRequest> createRepeated() => $pb.PbList<RegisterUserRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterUserRequest>(create);
  static RegisterUserRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class RegisterUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RegisterUserResponse', createEmptyInstance: create)
    ..aOS(1, 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  RegisterUserResponse._() : super();
  factory RegisterUserResponse() => create();
  factory RegisterUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RegisterUserResponse clone() => RegisterUserResponse()..mergeFromMessage(this);
  RegisterUserResponse copyWith(void Function(RegisterUserResponse) updates) => super.copyWith((message) => updates(message as RegisterUserResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterUserResponse create() => RegisterUserResponse._();
  RegisterUserResponse createEmptyInstance() => create();
  static $pb.PbList<RegisterUserResponse> createRepeated() => $pb.PbList<RegisterUserResponse>();
  @$core.pragma('dart2js:noInline')
  static RegisterUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterUserResponse>(create);
  static RegisterUserResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class AddChatMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddChatMessageRequest', createEmptyInstance: create)
    ..aOS(1, 'userId', protoName: 'userId')
    ..aInt64(2, 'timestamp')
    ..aOS(3, 'message')
    ..hasRequiredFields = false
  ;

  AddChatMessageRequest._() : super();
  factory AddChatMessageRequest() => create();
  factory AddChatMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddChatMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddChatMessageRequest clone() => AddChatMessageRequest()..mergeFromMessage(this);
  AddChatMessageRequest copyWith(void Function(AddChatMessageRequest) updates) => super.copyWith((message) => updates(message as AddChatMessageRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddChatMessageRequest create() => AddChatMessageRequest._();
  AddChatMessageRequest createEmptyInstance() => create();
  static $pb.PbList<AddChatMessageRequest> createRepeated() => $pb.PbList<AddChatMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static AddChatMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddChatMessageRequest>(create);
  static AddChatMessageRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}

class GetChatMessageStreamRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetChatMessageStreamRequest', createEmptyInstance: create)
    ..aOS(1, 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  GetChatMessageStreamRequest._() : super();
  factory GetChatMessageStreamRequest() => create();
  factory GetChatMessageStreamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatMessageStreamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetChatMessageStreamRequest clone() => GetChatMessageStreamRequest()..mergeFromMessage(this);
  GetChatMessageStreamRequest copyWith(void Function(GetChatMessageStreamRequest) updates) => super.copyWith((message) => updates(message as GetChatMessageStreamRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetChatMessageStreamRequest create() => GetChatMessageStreamRequest._();
  GetChatMessageStreamRequest createEmptyInstance() => create();
  static $pb.PbList<GetChatMessageStreamRequest> createRepeated() => $pb.PbList<GetChatMessageStreamRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChatMessageStreamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatMessageStreamRequest>(create);
  static GetChatMessageStreamRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class ChatMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChatMessage', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'userId', protoName: 'userId')
    ..aInt64(3, 'timestamp')
    ..aOS(4, 'message')
    ..hasRequiredFields = false
  ;

  ChatMessage._() : super();
  factory ChatMessage() => create();
  factory ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChatMessage clone() => ChatMessage()..mergeFromMessage(this);
  ChatMessage copyWith(void Function(ChatMessage) updates) => super.copyWith((message) => updates(message as ChatMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatMessage create() => ChatMessage._();
  ChatMessage createEmptyInstance() => create();
  static $pb.PbList<ChatMessage> createRepeated() => $pb.PbList<ChatMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessage>(create);
  static ChatMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);
}

