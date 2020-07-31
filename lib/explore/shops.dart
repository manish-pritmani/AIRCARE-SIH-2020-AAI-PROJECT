import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sih/explore/shop_list.dart';
import 'package:sih/features/water_continue.dart';
import 'package:sih/shop/screens/home/home_screen.dart';
class Shops extends StatefulWidget {
  @override
  _DrinkWaterState createState() => _DrinkWaterState();
}

class _DrinkWaterState extends State<Shops> {
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
            "Shopping",
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
                  "This facility is only available inside airport to search nearby shopping malls and navigate."
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              child: Text(
              _currentAddress == null
                  ? "Getting Location"
                  : _currentAddress,
              style: TextStyle(
                  fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
            ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: FlatButton(
                color: Color(0xff376AFF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0)),
                splashColor: Colors.white.withAlpha(40),
                child: Text(
                  'Continue anyway',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopLists()));
                },
              ),
            ),
          ],
        ),
      ),
    );
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
        "${place.name},${place.subLocality},${place.locality}";
      });
    } catch (e) {
      print(e);
    }
  }
}
