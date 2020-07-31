import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AppLanguage extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<AppLanguage> {
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
            "Choose App Language",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Circular",
            ),
          )),
      body: ListView(
          children: <Widget>[
            ListTile(
                title: Text("English"),
                trailing: Icon(Icons.check_circle,color: Color(0xff376AFF),),
                onTap: (){
                    Toast.show("Language Already Selected.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                },
            ),
            ListTile(
                title: Text("हिन्दी"),
                onTap: (){
                    Toast.show("We're working on this.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                },
            ),
            ListTile(
              title: Text("한국어"),
              onTap: (){
                Toast.show("We're working on this.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              },
            ),
            ListTile(
              title: Text("Française"),
              onTap: (){
                Toast.show("We're working on this.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              },
            ),
            ListTile(
              title: Text("svenska"),
              onTap: (){
                Toast.show("We're working on this.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              },
            ),

          ],
        )
    );
  }
}
