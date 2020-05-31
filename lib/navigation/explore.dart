import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sih/Help/qna.dart';
import 'package:sih/navigation/onboarding.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.location_on,color: Colors.black,),
                Text(
                  _currentAddress == null ? "Get Location" : _currentAddress,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 15,)
              ],
            ),
          ],
          title: Text(
            "Explore",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Circular",
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Query()),
          );
        },
        elevation: 1,
        child: Icon(Icons.chat),
        backgroundColor: Color(0xffffffff),
        foregroundColor: Color(0xff0437D6),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 250,
                      child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          createCard(context, 'https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201802231621388236-77015efa221711e98be80242ac110002.jpg?&output-quality=75&downsize=520:350&crop=520:350;23,0&output-format=jpg'),
                          createCard(context, 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg'),
                        ],
                      )
                  )
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Color(0xffecf0f1),
                  child: Icon(Icons.fastfood, color: Colors.redAccent),
                ),
                title: Text("Food Order"),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF2ecc71),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "ORDER NOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Color(0xffecf0f1),
                  child: Icon(
                    Icons.local_taxi,
                    color: Color(0xFF2980b9),
                  ),
                ),
                title: Text("Cab Ride"),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff3498db),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "BOOK NOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Color(0xffecf0f1),
                  child: Icon(
                    Icons.shopping_basket,
                    color: Color(0xff3f3f44),
                  ),
                ),
                title: Text("Shopping Mall"),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffcd3c),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "SHOWCASE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Color(0xffecf0f1),
                  child: Icon(Icons.hotel, color: Colors.redAccent),
                ),
                title: Text("Hotels Nearby"),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFd92027),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "SEARCH NOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            if (_currentPosition != null)
              Text(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                OnBoardingPage();
              },
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
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}

Widget createCard(BuildContext context, String imageAssetUrl){
  //TODO replace all constants with variables passed in an object
  return GestureDetector(
      onTap:  ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Query())),
      child: Container(
        ///check orientation
        width: MediaQuery.of(context).orientation== Orientation.portrait?
        ///then set the card's width limits (relative or absolute max)
        MediaQuery.of(context).size.width * 0.85 : 350,
        //TODO add a special case for tablets
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.blueGrey[100],
          image:  DecorationImage(
            //TODO add black vignette
              image: NetworkImage(imageAssetUrl),
              fit: BoxFit.cover,
              alignment: Alignment.center
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(child:  Text('Book Now the Hotels at best price in Jabalpur'.toUpperCase(),
                              overflow: TextOverflow.fade,
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 19)),),
                          Expanded(child: Text('Buy VIP Membership for Exciting discounts',
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14
                            ),
                          ),)
                        ],)
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.timer, color: Colors.black, )),
                      Text('00h 00m',
                          style: TextStyle(color: Colors.white)),
                    ],)
                ],
              ),

            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('BOOK NOW', style: TextStyle(color: Colors.white)),
                    color: Color(0xff0437D6),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Query()),
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)) ,
                  )
                ],
              ),
            ),

          ],
        ),
      ));
}
