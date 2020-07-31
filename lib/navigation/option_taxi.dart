import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:random_string/random_string.dart';
import 'package:sih/taxi/screens/home_screen.dart';
import 'package:toast/toast.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class OptionTaxi extends StatefulWidget {
  @override
  _AirportDetailsState createState() => _AirportDetailsState();
}

final format = DateFormat("yyyy-MM-dd HH:mm");

class _AirportDetailsState extends State<OptionTaxi> {
  String _ticket;
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;

  var _c1 = "Delhi Flight - BK9SG";
  var _c2 = "15 minutes";
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

  TextEditingController dateController = new TextEditingController();
  var _taxiType = "Standard";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _schKey = GlobalKey<FormState>();
    final _formKey3 = GlobalKey<FormState>();
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
                child: Lottie.asset("assets/4012-fast-car.json", height: 100),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: new Text(
                        'Book Taxi',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Center(
                      child: Text(
                          'Book taxi for Airports,Tourist places and enjoy the ride without any hassles.'))),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: FlatButton(
                  color: Color(0xff376AFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  splashColor: Colors.white.withAlpha(40),
                  child: Text(
                    'Search Taxi Nearby and Book',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
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
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Center(
                      child: Text(
                          'Booking taxi in advance for tours and destinations.'))),
              Container(
                padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                child: Text(
                  "Select Scheduled Date-Time for Booking",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              Form(
                key: _schKey,
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: DateTimeField(
                    format: format,
                    initialValue: DateTime.now(),
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(date, time);
                      } else {
                        return currentValue;
                      }
                    },
                  ),
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
                    if (_c1 == _c2) {
                      Toast.show("Currency cannot be same.", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    } else {
                      if (_formKey3.currentState.validate()) {
                        _formKey3.currentState.save();
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
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          'Auto-Book Taxi (Ticket based Taxi)',
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
                          'Auto-book taxi just as you reach your destination.'))),
              Form(
                key: _formKey3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                          Icon(Icons.airplanemode_active,
                              color: Color(0xff3f81f0)),
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
                                "Delhi Flight - BK9SG",
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
                    Container(
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                        child: Center(
                            child: Text('Select Auto-book before time.'))),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                          Icon(Icons.timelapse, color: Color(0xff3f81f0)),
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
                                "15 minutes",
                                "30 minutes",
                                "1 hour",
                                "2 hours",
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
                    CheckboxListTile(
                      value: checkboxValue1,
                      onChanged: (val) {
                        if (checkboxValue1 == false) {
                          setState(() {
                            checkboxValue1 = true;
                          });
                        } else if (checkboxValue1 == true) {
                          setState(() {
                            checkboxValue1 = false;
                          });
                        }
                      },
                      title: new Text(
                        'Book for source of this ticket.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xff376AFF),
                    ),
                    CheckboxListTile(
                      value: checkboxValue2,
                      onChanged: (val) {
                        if (checkboxValue2 == false) {
                          setState(() {
                            checkboxValue2 = true;
                          });
                        } else if (checkboxValue2 == true) {
                          setState(() {
                            checkboxValue2 = false;
                          });
                        }
                      },
                      title: new Text(
                        'Book for destination of this ticket.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xff376AFF),
                    ),
                  ]),
                ),
              ),
              CheckboxListTile(
                value: checkboxValue3,
                onChanged: (val) {
                  if (checkboxValue3 == false) {
                    setState(() {
                      checkboxValue3 = true;
                    });
                  } else if (checkboxValue3 == true) {
                    setState(() {
                      checkboxValue3 = false;
                    });
                  }
                },
                title: new Text(
                  'Enable Notification for booking updates and taxi details.',
                  style: TextStyle(fontSize: 14.0),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Color(0xff376AFF),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: FlatButton(
                  color: Color(0xff376AFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  splashColor: Colors.white.withAlpha(40),
                  child: Text(
                    'Auto-Book for selected ticket',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  onPressed: () {
                    if (_formKey3.currentState.validate()) {
                      showAuto(context);
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  showAuto(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Autobook Confirm"),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Are you sure, you want to auto-book taxi for Ticket Number BK9SG. We\'ll select nearest taxi available for you.'),
                SizedBox(height: 10,),
                Text('Taxi Type'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey), //
                          value: _taxiType,
                          items: [
                            "Standard",
                            "Premium",
                            "Platinum",
                          ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _taxiType = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Confirm Booking'),
          onPressed: () {
            feedData();
          },
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void feedData() {
    Navigator.of(context).pop();
    String token = randomAlphaNumeric(10);
    firestoreInstance.collection("users").document(token).setData({
      "name": "name of traveller",
      "id": "id of traveller",
      "amount1": "source amount",
      "amount2": "final amount",
      "token": "token generated",
    }).then((_) {
      print("success!");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ExchangeSucess(token: token)));
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
          "Booking Request Successful",
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
