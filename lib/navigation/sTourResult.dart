import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class sTResult extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<sTResult> {
  String _minutes;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

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
              "Smart Tour Guide Booking",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Circular",
              ),
            )),
        body: ListView(
          children: <Widget>[
            Card(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xff121212)
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Shashank Singh',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/men.png"),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Charges : 300 Per Hour",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Famous for Site Visit in Jabalpur",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Completed 12 Visits.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                      child: Column(children: <Widget>[
                        makeInput(
                          label: "Auto-Book Minutes before Destination*",
                          message: "Provide a auto-book minutes.",
                          onSave: _minutes,
                        ),
                      ]),
                    ),
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.receipt),
                    textColor: Colors.black,
                    label: Text(
                      "Auto Book This Guide",
                      style: TextStyle(
                        fontFamily: "Circular",
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                            Toast.show("Payment Functionality will be added soon.", context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.BOTTOM);
                      }
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.only(
                                bottomLeft: const Radius.circular(5.0),
                                bottomRight: const Radius.circular(5.0))),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton.icon(
                              icon: Icon(Icons.call),
                              textColor: Colors.black,
                              label: Text(
                                "Contact Guide",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: _telPhone,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Card(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xff121212)
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Abhinav Bhardwaj',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_half,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/men.png"),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Charges : 1300 Per Hour",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Most People Book this guide",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Completed 38 Visits.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey2,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                      child: Column(children: <Widget>[
                        makeInput(
                          label: "Auto-Book Minutes before Destination*",
                          message: "Provide a auto-book minutes.",
                          onSave: _minutes,
                        ),
                      ]),
                    ),
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.receipt),
                    textColor: Colors.black,
                    label: Text(
                      "Auto Book This Guide",
                      style: TextStyle(
                        fontFamily: "Circular",
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Toast.show("Payment Functionality will be added soon.", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      }
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.only(
                                bottomLeft: const Radius.circular(5.0),
                                bottomRight: const Radius.circular(5.0))),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton.icon(
                              icon: Icon(Icons.call),
                              textColor: Colors.black,
                              label: Text(
                                "Contact Guide",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: _telPhone,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
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
}
