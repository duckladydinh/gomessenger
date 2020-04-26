import 'package:flutter/material.dart';
import 'package:gms/rpc/chat_service.pbgrpc.dart' as rpc;
import 'package:gms/service/chat_service.dart';

class ChatWidget extends StatefulWidget {
  ChatWidget({Key key, this.title, this.userId}) : super(key: key);

  final String title;
  final String userId;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final messageInputController = TextEditingController();
  final messages = <rpc.ChatMessage>[];

  Future<void> addItemToList() async {
    print("AddChatMessage ${messageInputController.text}");
    await ChatService.addChatMessage(
        widget.userId, messageInputController.text);
    messageInputController.clear();
  }

  @override
  void initState() {
    super.initState();

    print("userId = ${widget.userId}");
    var chatChannel = ChatService.getChatChannel(widget.userId);
    chatChannel.listen((res) {
      setState(() {
        messages.add(res);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: this.messages.length,
                itemBuilder: (context, index) => Container(
                  alignment: messages[index].userId != widget.userId
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Message $index\n${messages[index].message}",
                        textScaleFactor: 2,
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(
                      (index % 2 == 0 ? 75.0 : 15.0),
                      15.0,
                      (index % 2 == 0 ? 15.0 : 75.0),
                      15.0,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Starts typing ..."),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    controller: this.messageInputController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () async => addItemToList(),
                    iconSize: 50.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
