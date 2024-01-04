import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Extract Widget"),
        ),
        body: ListView(
          children: [
            ChatItem(),
            ChatItem(),
            ChatItem(),
            ChatItem(),
            ChatItem(),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text("Name"),
      subtitle: Text("Subtitle"),
      trailing: Text("18.10 PM"),
    );
  }
}