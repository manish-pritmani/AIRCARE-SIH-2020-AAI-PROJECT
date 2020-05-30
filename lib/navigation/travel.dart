import 'package:flutter/material.dart';

class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.card_travel),
            color: Colors.black,
          ),
          title: Text(
            "Your Travel",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Circular",
            ),
          )
      ),
      body: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                backgroundColor: Color(0xffecf0f1),
                child: Icon(Icons.card_travel, color: Color(0xFF2980b9),),
              ),
              title: Text("Ethereum"),
              trailing: Text("\$450"),
            ),
          ),
        ],
      ),
    );
  }
}
