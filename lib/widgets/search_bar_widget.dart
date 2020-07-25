import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [BoxShadow(color: Colors.grey[350], blurRadius: 30.0)]
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          icon: Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Icon(Icons.search),
          ),
          // fillColor: Colors.black12,
          // filled: true,
        ),
      ),
    );
  }
}
