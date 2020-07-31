import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sih/utils/categories.dart';
import 'package:lottie/lottie.dart';
import 'package:sih/utils/slider.dart';
import 'package:flutter/rendering.dart';
import 'package:sih/utils/offers.dart';

class Dining extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Dining> {
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
            "Dining",
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
                  child: Lottie.asset("assets/27474-food-delivery.json",height:110),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10, 10.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Order from Nearby",
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
                _currentAddress == null ? FlatButton.icon(
                  icon: Icon(Icons.location_searching),
                  textColor: Colors.black,
                  label: Text(
                    'Locate Nearby Airport',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Order by Category",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 16,
//                      fontWeight: FontWeight.w800,
                          color: Theme
                              .of(context)
                              .accentColor,
                        ),
                      ),
                      onPressed: () {
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (BuildContext context){
//                          return DishesScreen();
//                        },
//                      ),
//                    );
                      },
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 6,
                  child: ListView.builder(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categories == null ? 0 : categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map cat = categories[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                cat["img"],
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 6,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 6,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    // Add one stop for each color. Stops should increase from 0 to 1
                                    stops: [0.2, 0.7],
                                    colors: [
                                      cat['color1'],
                                      cat['color2'],
                                    ],
                                    // stops: [0.0, 0.1],
                                  ),
                                ),
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 6,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 6,
                              ),
                              Center(
                                child: Container(
                                  height:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height / 6,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 6,
                                  padding: EdgeInsets.all(1),
                                  constraints: BoxConstraints(
                                    minWidth: 20,
                                    minHeight: 20,
                                  ),
                                  child: Center(
                                    child: Text(
                                      cat["name"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10, 10.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Pre-Order for Travel",
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
                              "Food Order will start processing some-time before you arrive the destination.",
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
                      'Start Pre-Order Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0),
                    ),
                    onPressed: () {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Recommended Restaurants Near you",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.4,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurants == null ? 0 : restaurants.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map restaurant = restaurants[index];

                        return Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: SlideItem(
                            img: restaurant["img"],
                            title: restaurant["title"],
                            address: restaurant["address"],
                            rating: restaurant["rating"],
                          ),
                        );
                      },
                    ),
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
