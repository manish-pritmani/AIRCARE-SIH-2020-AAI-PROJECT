import 'package:flutter/material.dart';
import 'package:hotel/src/models/box_model.dart';
import 'package:hotel/src/utils/icon_string_util.dart';

class OptionsBox extends StatelessWidget {
  final List<BoxModel> boxes;

  OptionsBox(this.boxes);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _OptionItem(
          color: Color(boxes[0].color),
          title: boxes[0].text,
          iconName: boxes[0].iconName,
          iconColor:
              boxes[0].color == 0xFFDFDBEE ? Color(0xFF6C46FE) : Colors.white,
        ),
        _OptionItem(
          color: Color(boxes[1].color),
          title: boxes[1].text,
          iconName: boxes[1].iconName,
          iconColor:
              boxes[0].color == 0xFFDFDBEE ? Color(0xFF6C46FE) : Colors.white,
        ),
        _OptionItem(
          color: Color(boxes[2].color),
          title: boxes[2].text,
          iconName: boxes[2].iconName,
          iconColor:
              boxes[0].color == 0xFFDFDBEE ? Color(0xFF6C46FE) : Colors.white,
        ),
        _OptionItem(
          color: Color(boxes[3].color),
          title: boxes[3].text,
          iconName: boxes[3].iconName,
          iconColor:
              boxes[0].color == 0xFFDFDBEE ? Color(0xFF6C46FE) : Colors.white,
        ),
      ],
    );
  }
}

class _OptionItem extends StatelessWidget {
  final Color color;
  final String title;
  final String iconName;
  final Color iconColor;

  _OptionItem(
      {@required this.color,
      @required this.title,
      @required this.iconName,
      @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 65.0,
          height: 65.0,
          decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20.0)]),
          child: getIcon(this.iconName, this.iconColor),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(this.title)
      ],
    );
  }
}
