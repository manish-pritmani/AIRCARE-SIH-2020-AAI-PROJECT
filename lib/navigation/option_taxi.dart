import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:random_string/random_string.dart';
import 'package:toast/toast.dart';

class OptionTaxi extends StatefulWidget {
  @override
  _AirportDetailsState createState() => _AirportDetailsState();
}

class _AirportDetailsState extends State<OptionTaxi> {
  String _ticket;
  bool checkboxValue=false;
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
              "Book Taxi Smartly",
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
                child: Lottie.asset("assets/lf30_editor_OJeMpc.json"),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          'Smart-Exchange based on Travel',
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
                          'Quickly exchange local currency amount, and exchange them with the destination locale currency.'))),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Column(children: <Widget>[
                    makeInput(
                      label: "Ticket Number*",
                      message: "Provide a ticket number.",
                      onSave: _ticket,
                    ),
                    makeRup(
                      label: "Amount",
                      message: "Provide a amount to exchange.",
                      onSave: _ticket,
                    ),
                    CheckboxListTile(
                      value: checkboxValue,
                      onChanged: (val) {
                        if (checkboxValue == false) {
                          setState(() {
                            checkboxValue = true;
                          });
                        } else if (checkboxValue == true) {
                          setState(() {
                            checkboxValue = false;
                          });
                        }
                      },
                      title: new Text(
                        'Allow split between source and destination in international flights.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xff376AFF),
                    )
                  ]),
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
                    'Exchange',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }
                  },
                ),
              ),
              Divider(),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          'Schedule Booking',
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
                          'Booking taxi in advance for tours and destinations.'))),
              Container(
                width: width,
                height: height,
                margin: EdgeInsets.only(bottom: 10),
                child: Lottie.asset("assets/lf30_editor_0nC6US.json",),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Text(
                        'Custom Exchange',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Center(
                      child: Text(
                          'Select currencies from below to exchange.'))),
              Form(
                key: _formKey2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Column(children: <Widget>[
                    makeRup(
                      label: "Amount for exchange",
                      message: "Provide a amount to exchange.",
                      onSave: _ticket,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey[400],
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.attach_money, color: Color(0xff3f81f0)),
                          SizedBox(width: 20),
                          Expanded(
                            child: DropdownButton(
                              isExpanded: true,
                              underline: SizedBox(),
                              icon: Icon(Icons.keyboard_arrow_down,
                                  color: Color(0xff3f81f0)),
                              //
                              value: _c2,
                              items: [
                                "US Dollar",
                                "Indian Ruppee",
                                "Euro",
                                "Singapore Dollar",
                                "UAE Dirham",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _c2 = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    makeRup(
                      label: "Final amount",
                      message: "Provide a final amount.",
                      onSave: _ticket,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey[400],
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.attach_money, color: Color(0xff3f81f0)),
                          SizedBox(width: 20),
                          Expanded(
                            child: DropdownButton(
                              isExpanded: true,
                              underline: SizedBox(),
                              icon: Icon(Icons.keyboard_arrow_down,
                                  color: Color(0xff3f81f0)),
                              //
                              value: _c1,
                              items: [
                                "Indian Ruppee",
                                "US Dollar",
                                "Euro",
                                "Singapore Dollar",
                                "UAE Dirham",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _c1 = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: FlatButton(
                  color: Color(0xff376AFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  splashColor: Colors.white.withAlpha(40),
                  child: Text(
                    'Exchange',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  onPressed: () {
                    if(_c1==_c2){
                      Toast.show("Currency cannot be same.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    }else{
                      if (_formKey2.currentState.validate()) {
                        _formKey2.currentState.save();
                        feedData();
                      }
                    }
//                    setState(() {
//                      Navigator.pop(context);
//                    });
                  },
                ),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  void feedData() {
    String token = randomAlphaNumeric(10);
    firestoreInstance.collection("users").document(token).setData(
        {
          "name" : "name of traveller",
          "id" : "id of traveller",
          "amount1" : "source amount",
          "amount2" : "final amount",
          "token" : "token generated",
        }).then((_){
      print("success!");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExchangeSucess(token: token)));
    });
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

class ExchangeSucess extends StatelessWidget {
  final String token;
  ExchangeSucess({Key key, @required this.token}) : super(key: key);

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
          "Request Successful",
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
          Lottie.asset("assets/23749-successful.json"),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your token number",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            token.toUpperCase(),
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "You will receive SMS shortly and",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "we will reach to you soon.",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}