
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
          title: Text("Image Widget"),
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 500,
            color: Colors.brown,  
            child: Image.asset("images/esa.jpg", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}