import 'package:flutter/material.dart';
import 'package:gms/service/chat_service.dart';
import 'package:gms/widgets/chat_widget.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _publicNameController = TextEditingController();

  @override
  void dispose() {
    _publicNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _publicNameController,
          decoration: InputDecoration(hintText: "Your Public Name"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = _publicNameController.text;
          String userId;
          await ChatService.registerUser(name).then((id) {
            userId = id;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatWidget(
              title: "Go Messenger for $name",
              userId: userId,
            );
          }));
        },
        tooltip: "Register new user",
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
