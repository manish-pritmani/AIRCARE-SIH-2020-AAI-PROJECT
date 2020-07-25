import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      color: Colors.white,
      width: double.infinity,
      height: 60.0,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 24.0,
            backgroundImage: AssetImage('assets/imgs/profile.JPG'),
          ),
          Spacer(),
          SvgPicture.asset('assets/icons/menu.svg')
        ],
      ),
    );
  }
}
