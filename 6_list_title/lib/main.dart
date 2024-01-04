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
          title: Text("List Tile"),
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              title: Text("Hafizhoh Viarma"),
              subtitle: Text("This is subtitle ya ges.. coba dipadatkan dulu ini subtitlenya coba dipadatkan dulu ini subtitlenya coba dipadatkan dulu ini subtitlenya coba dipadatkan dulu ini subtitlenya", 
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(),
              trailing: Text("18.10 PM"),
              // tileColor: Colors.orange,
              // dense: true, //gunanya kalo banyak subtitle dia akan padat dan menyesuaikan
              // onTap: (){
              //   return;
              // },
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Hafizhoh Viarma"),
              subtitle: Text("This is subtitle ya ges.."),
              leading: CircleAvatar(),
              trailing: Text("18.10 PM"),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Hafizhoh Viarma"),
              subtitle: Text("This is subtitle ya ges.."),
              leading: CircleAvatar(),
              trailing: Text("18.10 PM"),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Hafizhoh Viarma"),
              subtitle: Text("This is subtitle ya ges.."),
              leading: CircleAvatar(),
              trailing: Text("18.10 PM"),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Hafizhoh Viarma"),
              subtitle: Text("This is subtitle ya ges.."),
              leading: CircleAvatar(),
              trailing: Text("18.10 PM"),
            ),
          ],
        ),
      ),
      
    );
  }
}