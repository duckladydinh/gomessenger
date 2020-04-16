///
//  Generated code. Do not modify.
//  source: chat_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

const AddChatMessageRequest$json = const {
  '1': 'AddChatMessageRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'channelId', '3': 2, '4': 1, '5': 9, '10': 'channelId'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
};

const GetChatChannelRequest$json = const {
  '1': 'GetChatChannelRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'channelId', '3': 2, '4': 1, '5': 9, '10': 'channelId'},
  ],
};

const GetChatMessageResponse$json = const {
  '1': 'GetChatMessageResponse',
  '2': const [
    const {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.ChatMessage', '10': 'messages'},
  ],
};

const ChatMessage$json = const {
  '1': 'ChatMessage',
  '2': const [
    const {'1': 'messageId', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'channelId', '3': 3, '4': 1, '5': 9, '10': 'channelId'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'content', '3': 5, '4': 1, '5': 9, '10': 'content'},
  ],
};

