import 'package:flutter/material.dart';

class VIPZone extends StatefulWidget {
  @override
  _VIPZoneState createState() => _VIPZoneState();
}

class _VIPZoneState extends State<VIPZone> {
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
            "VIP Subscription",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Circular",
            ),
          )),
    );
  }
}
