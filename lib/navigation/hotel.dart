import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sih/hotel/hotelBooking/hotelHomeScreen.dart';
import 'package:sih/utils/categories.dart';
import 'package:lottie/lottie.dart';

class Hotel extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Hotel> {
  final PermissionHandler permissionHandler = PermissionHandler();
  Map<PermissionGroup, PermissionStatus> permissions;
  var _location="RD7GH - Delhi Flight";
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
      if (Theme
          .of(context)
          .platform == TargetPlatform.android) {
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

  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

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
            "Hotel Search",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Circular",
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: ListView(
              children: <Widget>[
                Container(
                  child: Lottie.asset("assets/17784-analyzing-website.json",height:110,width: double.maxFinite),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Center(
                        child: Text(
                            'Quickly search and book hotels as you needed.'))),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10, 10.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Book Nearby Hotels",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: new BoxDecoration(
                        color: Color(0xfff0f0f0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.info_outline,
                            color: Colors.black,
                            size: 17,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Stuck somewhere? Finding places to stay, Select this option.",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Circular",
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      )),
                ),
                _currentAddress == null ? FlatButton.icon(
                  icon: Icon(Icons.location_searching),
                  textColor: Colors.black,
                  label: Text(
                    'Locate and Search Hotels Nearby',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {},
                ) : Text(
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
                      'Search Nearby',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0),
                    ),
                    onPressed: () {
                      _getCurrentLocation();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10, 10.0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Select Location and Book Hotels",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: new BoxDecoration(
                        color: Color(0xfff0f0f0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.info_outline,
                            color: Colors.black,
                            size: 17,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Travelling somewhere? Thinking where to stay, Select this option.",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Circular",
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: FlatButton(
                    color: Color(0xff376AFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    splashColor: Colors.white.withAlpha(40),
                    child: Text(
                      'Pick and Book',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HotelHomeScreen()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10, 10.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Ticket Based Booking",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: new BoxDecoration(
                        color: Color(0xfff0f0f0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.info_outline,
                            color: Colors.black,
                            size: 17,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Enter your travel details we will find best hotels for your stay.",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Circular",
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
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
                            Icon(Icons.map, color: Color(0xff3f81f0)),
                            SizedBox(width: 20),
                            Expanded(
                              child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                icon: Icon(Icons.keyboard_arrow_down,
                                    color: Color(0xff3f81f0)), //
                                value: _location,
                                items: [
                                  "RD7GH - Delhi Flight",
                                ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _location = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 5),
//                      CheckboxListTile(
//                        value: checkboxValue,
//                        onChanged: (val) {
//                          if (checkboxValue == false) {
//                            setState(() {
//                              checkboxValue = true;
//                            });
//                          } else if (checkboxValue == true) {
//                            setState(() {
//                              checkboxValue = false;
//                            });
//                          }
//                        },
//                        subtitle: !checkboxValue
//                            ? Text(
//                          'Required.',
//                          style: TextStyle(color: Colors.red),
//                        )
//                            : null,
//                        title: new Text(
//                          'I agree.',
//                          style: TextStyle(fontSize: 14.0),
//                        ),
//                        controlAffinity: ListTileControlAffinity.leading,
//                        activeColor: Colors.green,
//                      )
                    ],
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
                      'Start Booking',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            )));
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
        "${place.name}, ${place.locality}, ${place.postalCode}, ${place
            .country} ";
      });
    } catch (e) {
      print(e);
    }
  }

}
