import 'package:flutter/material.dart';
import 'package:frontend/service/service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Go Messenger'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final messageInputController = TextEditingController();
  final messages = <String>[];

  Future<void> addItemToList() async {
    await Service.addChatMessage(messageInputController.text);
    setState(() {
      messages.add(messageInputController.text);
      messageInputController.clear();
    });
  }

  @override
  void initState() {
    super.initState();

    var chatChannel = Service.getChatChannel();
    chatChannel.listen((msg) {
      print(msg.content);
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
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Message $index\n${messages[index]}",
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
