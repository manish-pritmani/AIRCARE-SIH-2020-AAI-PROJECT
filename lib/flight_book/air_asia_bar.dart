import 'package:flutter/material.dart';

class AirAsiaBar extends StatelessWidget {
  final double height;

  const AirAsiaBar({Key key, this.height}) : super(key: key);

//  Color(0xff4A00E0),
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff376AFF),  Color(0xff4A00E0),],
            ),
          ),
          height: height,
        ),
        new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: new Text(
            "Powered by AirAsia",
            style: TextStyle(
                fontFamily: 'NothingYouCouldDo', fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
