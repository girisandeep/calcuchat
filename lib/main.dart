import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ChatScreen.dart';
import 'package:flutter_app/util/Themes.dart';

void main() => runApp(new FlutterChatApp());

class FlutterChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Chat App",
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? Themes.kIOSTheme
          : Themes.kDefaultTheme,
      home: new ChatScreen(),
    );
  }
}

//https://github.com/rohan20/flutter-chat-app
