/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_chat/conreality_chat.dart';

////////////////////////////////////////////////////////////////////////////////

class ChatScreen extends StatefulWidget {
  static const route = "/widgets/chat";

  ChatScreen({Key key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatState();
}

////////////////////////////////////////////////////////////////////////////////

class _ChatState extends State<ChatScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Text("TODO")), // TODO
    );
  }
}
