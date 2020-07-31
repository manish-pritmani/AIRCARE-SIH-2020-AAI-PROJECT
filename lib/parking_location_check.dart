import 'package:android_intent/android_intent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_string/random_string.dart';
import 'package:sih/explore/shop_list.dart';
import 'package:sih/features/water_continue.dart';
import 'package:sih/navigation/parking.dart';
import 'package:sih/shop/screens/home/home_screen.dart';

class CheckPark extends StatefulWidget {
  @override
  _DrinkWaterState createState() => _DrinkWaterState();
}

class _DrinkWaterState extends State<CheckPark> {

  final PermissionHandler permissionHandler = PermissionHandler();
  Map<PermissionGroup, PermissionStatus> permissions;

  void initState() {
    super.initState();
    requestLocationPermission();
    _gpsService();
    _getCurrentLocation();
    _getAddressFromLatLng();
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
  String _currentAddressLocation;

  final TextEditingController _searchControl = new TextEditingController();

  ScrollController scrollController;
  bool dialVisible = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: (){Navigator.pop(context);}
          ),
          title: Text(
            "Parking at Airport",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontFamily: "Circular",
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Lottie.asset("assets/lf30_editor_AqHwTh.json"),
                )
            ),
            Text(
              "You are not at airport",
              style: TextStyle(
                  fontSize: 25, color: Colors.black, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: Text(
                  "This facility is only available inside airport to park vehicles and search their location."
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Text(
                _currentAddressLocation == null
                    ? "Getting Location"
                    : _currentAddressLocation,
                style: TextStyle(
                    fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,16,16,0),
                        child: Text(
                          "Search from outside the airport and book parking.",
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                        child: FlatButton.icon(
                          color: Color(0xff376AFF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          icon: Icon(Icons.location_searching),
                          textColor: Colors.white,
                          label: Text(
                            'Locate and Search Airports',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0),
                          ),
                          onPressed: () {
                            showAlertDialog(context);
                            Future.delayed(const Duration(milliseconds: 1500), () {
                              Navigator.pop(context);
                              showAuto(context);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 10,),
          Expanded(child:Text("Searching Airports in\n$_currentAddress" )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  showAuto(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Select Airport for Parking"),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Select from the airport in Location: $_currentAddress.'),
                SizedBox(height: 10,),
                Text('Airports Found'),
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
                            "Jabalpur Airport",
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
          child: Text('Proceed for Parking'),
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

  Firestore instance =Firestore.instance;

  void feedData() {
    Navigator.of(context).pop();
    String token = randomAlphaNumeric(10);
    instance.collection("users").document(token).setData({
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
              builder: (context) => Parking(location: _currentAddress)));
    });
  }
  var _taxiType = "Jabalpur Airport";

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
        "${place.locality}";
        _currentAddressLocation =
        "Your Location : ${place.locality}";
      });
    } catch (e) {
      print(e);
    }
  }
}
