import 'package:android_intent/android_intent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_string/random_string.dart';
import 'package:toast/toast.dart';
import 'package:sih/navigation/mTourResult.dart';
import 'package:sih/navigation/sTourResult.dart';

class TourGuide extends StatefulWidget {
  @override
  _AirportDetailsState createState() => _AirportDetailsState();
}

class _AirportDetailsState extends State<TourGuide> {
  final PermissionHandler permissionHandler = PermissionHandler();
  Map<PermissionGroup, PermissionStatus> permissions;

  void initState() {
    super.initState();
    requestLocationPermission();
    _gpsService();
  }

  Future<bool> _requestPermission(PermissionGroup permission) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

/*Checking if your App has been Given Permission*/
  Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.location);
    if (granted != true) {
      requestLocationPermission();
    }
    debugPrint('requestContactsPermission $granted');
    return granted;
  }

/*Show dialog if GPS not enabled and open settings location*/
  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Can't get current location"),
                content:
                    const Text('Please make sure you enable GPS and try again'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        final AndroidIntent intent = AndroidIntent(
                            action:
                                'android.settings.LOCATION_SOURCE_SETTINGS');
                        intent.launch();
                        Navigator.of(context, rootNavigator: true).pop();
                        _gpsService();
                      })
                ],
              );
            });
      }
    }
  }

/*Check if gps service is enabled or not*/
  Future _gpsService() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      return true;
  }

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  String _ticket;
  bool checkboxValue = false;
  var _c1 = "One Day";
  var _c2 = "1";
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

  var locationAlert = "";

  showAlertDialog(BuildContext context, message) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Text(message)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
              "Tour Guides",
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
                child: Lottie.asset(
                    "assets/23011-realcommercial-illustration.json"),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          'Guides Near me',
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
                          'Search tour guides available near your current location and contact them easily.'))),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Column(children: <Widget>[
                    makeInput(
                      label: "Number of Travellers*",
                      message: "Provide number of travellers.",
                      onSave: _ticket,
                    ),
                  ]),
                ),
              ),
              _currentAddress == null
                  ? FlatButton.icon(
                      icon: Icon(Icons.location_searching),
                      textColor: Colors.black,
                      label: Text(
                        'Locate me',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        _getCurrentLocation();
                      },
                    )
                  : Text(
                      _currentAddress,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: FlatButton(
                  color: Color(0xff376AFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  splashColor: Colors.white.withAlpha(40),
                  child: Text(
                    'Search Guides',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (_currentAddress != null) {
                        _formKey.currentState.save();
                        showAlertDialog(
                            context, "Searching guides near \n$locationAlert");
                        Future.delayed(const Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tResult()));
                          Toast.show("Found 2 Results", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        });
                      } else {
                        Toast.show("Locate yourself first.", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      }
                    }
                  },
                ),
              ),
              Divider(),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          'Smart Guide Search',
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
                          'Travel internationally? Don\'t know what to do. New Location New People. Don\'t worry we will find a guide before you reach destination and they will contact you as you reach.'))),
              Form(
                key: _formKey2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Column(children: <Widget>[
                    makeInput(
                      label: "Boading Pass Number (Destination)*",
                      message: "Provide a boarding pass number.",
                      onSave: _ticket,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Number of travellers",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
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
                          Icon(Icons.people, color: Color(0xff3f81f0)),
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
                                "1",
                                "2",
                                "3",
                                "4",
                                "5+",
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
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Smart Tour Pack",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
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
                          Icon(Icons.stars, color: Color(0xff3f81f0)),
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
                                "One Day",
                                "Mega Pack",
                                "Super Travel",
                                "Destiny (Star)",
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
                    'Get Guide',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  onPressed: () {
                    if (_formKey2.currentState.validate()) {
                      if (_currentAddress != null) {
                        _formKey2.currentState.save();
                        showAlertDialog(context,"Finding and Booking best guides for your tour.");
                        Future.delayed(const Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => sTResult()));
                          Toast.show("Found 3 Results", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        });
                      } else {
                        Toast.show("Locate yourself first.", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      }
                    }
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

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country} ";
        locationAlert = "${place.name}, ${place.locality}";
      });
    } catch (e) {
      print(e);
    }
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
