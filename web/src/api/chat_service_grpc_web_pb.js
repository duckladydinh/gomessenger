/**
 * @fileoverview gRPC-Web generated client stub for 
 * @enhanceable
 * @public
 */

// GENERATED CODE -- DO NOT EDIT!



const grpc = {};
grpc.web = require('grpc-web');

const proto = require('./chat_service_pb.js');

/**
 * @param {string} hostname
 * @param {?Object} credentials
 * @param {?Object} options
 * @constructor
 * @struct
 * @final
 */
proto.ChatServiceClient =
    function(hostname, credentials, options) {
  if (!options) options = {};
  options['format'] = 'text';

  /**
   * @private @const {!grpc.web.GrpcWebClientBase} The client
   */
  this.client_ = new grpc.web.GrpcWebClientBase(options);

  /**
   * @private @const {string} The hostname
   */
  this.hostname_ = hostname;

};


/**
 * @param {string} hostname
 * @param {?Object} credentials
 * @param {?Object} options
 * @constructor
 * @struct
 * @final
 */
proto.ChatServicePromiseClient =
    function(hostname, credentials, options) {
  if (!options) options = {};
  options['format'] = 'text';

  /**
   * @private @const {!grpc.web.GrpcWebClientBase} The client
   */
  this.client_ = new grpc.web.GrpcWebClientBase(options);

  /**
   * @private @const {string} The hostname
   */
  this.hostname_ = hostname;

};


/**
 * @const
 * @type {!grpc.web.MethodDescriptor<
 *   !proto.AddChatMessageRequest,
 *   !proto.Response>}
 */
const methodDescriptor_ChatService_AddChatMessage = new grpc.web.MethodDescriptor(
  '/ChatService/AddChatMessage',
  grpc.web.MethodType.UNARY,
  proto.AddChatMessageRequest,
  proto.Response,
  /**
   * @param {!proto.AddChatMessageRequest} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.Response.deserializeBinary
);


/**
 * @const
 * @type {!grpc.web.AbstractClientBase.MethodInfo<
 *   !proto.AddChatMessageRequest,
 *   !proto.Response>}
 */
const methodInfo_ChatService_AddChatMessage = new grpc.web.AbstractClientBase.MethodInfo(
  proto.Response,
  /**
   * @param {!proto.AddChatMessageRequest} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.Response.deserializeBinary
);


/**
 * @param {!proto.AddChatMessageRequest} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @param {function(?grpc.web.Error, ?proto.Response)}
 *     callback The callback function(error, response)
 * @return {!grpc.web.ClientReadableStream<!proto.Response>|undefined}
 *     The XHR Node Readable Stream
 */
proto.ChatServiceClient.prototype.addChatMessage =
    function(request, metadata, callback) {
  return this.client_.rpcCall(this.hostname_ +
      '/ChatService/AddChatMessage',
      request,
      metadata || {},
      methodDescriptor_ChatService_AddChatMessage,
      callback);
};


/**
 * @param {!proto.AddChatMessageRequest} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @return {!Promise<!proto.Response>}
 *     A native promise that resolves to the response
 */
proto.ChatServicePromiseClient.prototype.addChatMessage =
    function(request, metadata) {
  return this.client_.unaryCall(this.hostname_ +
      '/ChatService/AddChatMessage',
      request,
      metadata || {},
      methodDescriptor_ChatService_AddChatMessage);
};


/**
 * @const
 * @type {!grpc.web.MethodDescriptor<
 *   !proto.GetChatChannelRequest,
 *   !proto.ChatMessage>}
 */
const methodDescriptor_ChatService_GetChatChannel = new grpc.web.MethodDescriptor(
  '/ChatService/GetChatChannel',
  grpc.web.MethodType.SERVER_STREAMING,
  proto.GetChatChannelRequest,
  proto.ChatMessage,
  /**
   * @param {!proto.GetChatChannelRequest} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.ChatMessage.deserializeBinary
);


/**
 * @const
 * @type {!grpc.web.AbstractClientBase.MethodInfo<
 *   !proto.GetChatChannelRequest,
 *   !proto.ChatMessage>}
 */
const methodInfo_ChatService_GetChatChannel = new grpc.web.AbstractClientBase.MethodInfo(
  proto.ChatMessage,
  /**
   * @param {!proto.GetChatChannelRequest} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.ChatMessage.deserializeBinary
);


/**
 * @param {!proto.GetChatChannelRequest} request The request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @return {!grpc.web.ClientReadableStream<!proto.ChatMessage>}
 *     The XHR Node Readable Stream
 */
proto.ChatServiceClient.prototype.getChatChannel =
    function(request, metadata) {
  return this.client_.serverStreaming(this.hostname_ +
      '/ChatService/GetChatChannel',
      request,
      metadata || {},
      methodDescriptor_ChatService_GetChatChannel);
};


/**
 * @param {!proto.GetChatChannelRequest} request The request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @return {!grpc.web.ClientReadableStream<!proto.ChatMessage>}
 *     The XHR Node Readable Stream
 */
proto.ChatServicePromiseClient.prototype.getChatChannel =
    function(request, metadata) {
  return this.client_.serverStreaming(this.hostname_ +
      '/ChatService/GetChatChannel',
      request,
      metadata || {},
      methodDescriptor_ChatService_GetChatChannel);
};


module.exports = proto;

