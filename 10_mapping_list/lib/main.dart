import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String,dynamic>> myList = [
    {
      "Name" : "Hafizhoh",
      "Age" : 19,
      "favColor" : [
        "Black", 
        "Red", 
        "Amber",
        "Black", 
        "Red", 
        "Amber"
        ],
    },
    {
      "Name" : "Dini",
      "Age" : 25,
      "favColor" : ["White", "Red", "Green""White", "Red", "Green","White", "Red", "Green"],
    },
  ];
      
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ID Apps"),
        ),
        body: ListView(
          children: myList.map((data){
            print(data["favColor"]);
            List myfavcolor = data["favColor"];
            print("----------");
            print(myfavcolor);
            return Card(
              margin: EdgeInsets.all(20),
              color: Colors.black.withOpacity(0.1),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //row
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ${data['Name']}"),
                            Text("Age ${data['Age']}"),
                          ],
                        )
                      ],
                    ),
                    //favColor
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: myfavcolor.map((color){
                          return Container(
                            color: Colors.amber,
                            margin: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 8,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(color),
                          );
                        }).toList(),
                        ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}