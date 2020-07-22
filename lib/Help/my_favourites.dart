import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Favourites",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: "Circular",
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Lottie.asset("assets/12363-heart.json"),
          Text(
            "You're All Caught",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w300),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Save favorite shops, destinations",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "and foods to reorder quickly.",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}