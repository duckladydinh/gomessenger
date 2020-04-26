///
//  Generated code. Do not modify.
//  source: chat_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Empty$json = const {
  '1': 'Empty',
};

const RegisterUserRequest$json = const {
  '1': 'RegisterUserRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

const RegisterUserResponse$json = const {
  '1': 'RegisterUserResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

const AddChatMessageRequest$json = const {
  '1': 'AddChatMessageRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

const GetChatMessageStreamRequest$json = const {
  '1': 'GetChatMessageStreamRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

const ChatMessage$json = const {
  '1': 'ChatMessage',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
};

