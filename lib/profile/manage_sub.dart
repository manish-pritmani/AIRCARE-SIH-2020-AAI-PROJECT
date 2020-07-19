import 'package:flutter/material.dart';

class ManageSub extends StatefulWidget {
  @override
  _ManageSubState createState() => _ManageSubState();
}

class _ManageSubState extends State<ManageSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "Manage Membership",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Circular",
            ),
          )),
    );
  }
}
