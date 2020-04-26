import 'package:flutter/material.dart';
import 'package:gms/widgets/chat_widget.dart';
import 'package:gms/widgets/login_widget.dart';

void main() {
  runApp(HomeWidget());
}

class HomeWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginWidget(),
    );
  }
}
