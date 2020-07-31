import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sih/Help/chatbot.dart';
import 'package:sih/Help/faq.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpDesk extends StatefulWidget {
  @override
  _HelpDeskState createState() => _HelpDeskState();
}

class _HelpDeskState extends State<HelpDesk> {
  double customFontSize = 13;
  double width,
      height = 50.0;

  _sendMail() async {
    const uri =
        'mailto:support@aircare.com?subject=Support%20a%20Query';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not initiate $uri';
    }
  }

  _telPhone() async {
    const uri = 'tel: 1800-11-0402';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not initiate $uri';
    }
  }

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
          "Helpdesk",
          style: TextStyle(
            color: Theme
                .of(context)
                .brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: "Circular",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Center(
            child: Lottie.asset(
              "assets/21332-teamwork.json",
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "We always have your back and ready",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "to solve your issues and queries",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Contact us we will reach to you soon.",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          height: height,
                          margin: EdgeInsets.only(bottom: 10),
                          child: RawMaterialButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageDialogflow()));
                              },
                              shape: CircleBorder(),
                              child:
                              Image.asset("assets/icons8-chat-bubble-64.png")),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Chat with",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: customFontSize),
                            ),
                            Text(
                              "Aleesa",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: customFontSize),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
              Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          height: height,
                          margin: EdgeInsets.only(bottom: 10),
                          child: RawMaterialButton(
                              onPressed: _telPhone,
                              shape: CircleBorder(),
                              child: Image.asset("assets/icons8-call-64.png")),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Contact us",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: customFontSize),
                            ),
                            Text(
                              " ",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: customFontSize),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          height: height,
                          margin: EdgeInsets.only(bottom: 10),
                          child: RawMaterialButton(
                              onPressed: _sendMail,
                              shape: CircleBorder(),
                              child: Image.asset("assets/icons8-email-64.png")),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Email us",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: customFontSize),
                            ),
                            Text(
                              " ",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: customFontSize),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
              Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          height: height,
                          margin: EdgeInsets.only(bottom: 10),
                          child: RawMaterialButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>FaqPage()));
                              },
                              shape: CircleBorder(),
                              child: Image.asset("assets/icons8-help-64.png")),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "FAQs",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: customFontSize),
                            ),
                            Text(
                              " ",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: customFontSize),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
//          RaisedButton.icon(
//            elevation: 0,
//            color: Colors.amberAccent,
//            onPressed: (){},
//            icon: Icon(Icons.email,),
//            label: Text("Email Us",style: TextStyle(fontSize: 18),),
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(4),
//            ),
//          ),
//          RaisedButton.icon(
//            elevation: 0,
//            color: Colors.amberAccent,
//            onPressed: (){},
//            icon: Icon(Icons.phone,),
//            label: Text("Call Us",style: TextStyle(fontSize: 18),),
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(4),
//            ),
//          ),
//          RaisedButton.icon(
//            elevation: 0,
//            color: Colors.amberAccent,
//            onPressed: (){},
//            icon: Icon(Icons.chat,),
//            label: Text("Chatbot",style: TextStyle(fontSize: 18),),
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(4),
//            ),
//          ),
//          RaisedButton.icon(
//            elevation: 0,
//            color: Colors.amberAccent,
//            onPressed: (){},
//            icon: Icon(Icons.help,),
//            label: Text("FAQs",style: TextStyle(fontSize: 18),),
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(4),
//            ),
//          ),
        ],
      ),
    );
  }

  Widget makeInput({label, obscureText = false, message, onSave}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          validator: (input) {
            if (input.isEmpty) {
              return message;
            }
            return message;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onSaved: (input) {
            setState(() {
              switch (label) {
                case "Email":
                  var _email = input;
                  break;
                case "Password":
                  var _password = input;
                  break;
              }
            });
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
