import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:random_string/random_string.dart';
import 'package:toast/toast.dart';

class Parking extends StatefulWidget {
  final String location;

  Parking({Key key, @required this.location}) : super(key: key);

  @override
  _AirportDetailsState createState() => _AirportDetailsState();
}

class _AirportDetailsState extends State<Parking>
    with SingleTickerProviderStateMixin {
  String _ticket;
  bool checkboxValue = false;
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";
  bool _onEditing = true;
  String _code="";
  bool hasError = false;
  String currentText = "";
  var _c1 = "Indian Ruppee";
  var _c2 = "US Dollar";
  double width, height = 55.0;
  double customFontSize = 13;
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyText = TextStyle(
    color: Colors.grey.shade600,
  );
  final TextStyle whiteBoldText = TextStyle(
    color: Colors.black,
  );
  final firestoreInstance = Firestore.instance;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _formKey2 = GlobalKey<FormState>();
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
              "Vehicle Parking at ${widget.location} Airport",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Circular",
              ),
            )),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                height: 150,
                child: Lottie.asset("assets/7595-long-term-saving.json"),
              ),
              Container(
                child: Column(
                  children: <Widget>[_tabSection(context)],
                ),
              ),
            ],
          ),
        ));
  }

  void feedData() {
    String token = randomAlphaNumeric(10);
    firestoreInstance.collection("users").document(token).setData({
      "name": "name of traveller",
      "id": "id of traveller",
      "amount1": "source amount",
      "amount2": "final amount",
      "token": "token generated",
    }).then((_) {
      print("success!");
    });
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
                labelColor: Colors.black,
                indicatorColor: Color(0xff0437D6),
                tabs: [
                  Tab(
                    text: "Availability",
                  ),
                  Tab(
                    text: "Calculator",
                  ),
                  Tab(
                    text: "Find My Car",
                  ),
                ]),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              SingleChildScrollView(
                child: Container(
                    child: Column(children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: new Text(
                              'Where are you going?',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 25,
                          child: Text("T1"),
                        ),
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 25,
                          child: Text("T2"),
                        ),
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 25,
                          child: Text("T3"),
                        ),
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 25,
                          child: Text("T4"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                        text: ' Parking Space Availability.\n',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'GREEN = Available',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: ' | ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: 'RED = Full',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                  Divider()
                ])),
              ),
              SingleChildScrollView(
                  child: Column(
                children: <Widget>[

                  Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: new Text(
                              'Car Park Rate Calculator',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                      child: Center(
                          child: Text(
                              'Note: This Car Park rate calculator ith the destination locale currency.'))),

                ],
              )),
              SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: new Text(
                              'Locate Your Vehicle',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                      child: Center(
                          child: Text(
                              'Enter the digits of your vehicle license plate.'))),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 30),
                    child: Form(
                      key: formKey,
                      child: VerificationCode(
                        textStyle:
                            TextStyle(fontSize: 25.0, color: Color(0xff0437D6)),
                        keyboardType: TextInputType.number,
                        length: 4,
                        onCompleted: (String value) {
                          setState(() {
                            _code = value;
                          });
                        },
                        onEditing: (bool value) {
                          setState(() {
                            _onEditing = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: FlatButton(
                      color: Color(0xff376AFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      splashColor: Colors.white.withAlpha(40),
                      child: Text(
                        'Locate',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0),
                      ),
                      onPressed: () {
                        if (_code.length == 4) {
                          if (formKey.currentState.validate()) {

                          }
                        }else{
                          Toast.show("Invalid Vehicle Number.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        }
                      },
                    ),
                  ),
                ],
              )),
            ]),
          ),
        ],
      ),
    );
  }

  var titleTextStyle = TextStyle(
    color: Colors.black87,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

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
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onSaved: (val) => onSave = val,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget makeRup({label, obscureText = false, message, onSave}) {
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
            return null;
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
              prefixIcon: Icon(Icons.monetization_on)),
          onSaved: (val) => onSave = val,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
