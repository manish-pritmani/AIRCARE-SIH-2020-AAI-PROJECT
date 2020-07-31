import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaterLocation extends StatefulWidget {
  @override
  _DrinkWaterState createState() => _DrinkWaterState();
}

class _DrinkWaterState extends State<WaterLocation> {
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
            "Water Point at Jabalpur Airport",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontFamily: "Circular",
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      'Water Point',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Text(
                      "300m away",
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.pin_drop),
                    ),
                    trailing: IconButton(icon: Icon(Icons.navigation),onPressed: (){},),
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
                      'Water Shop',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Text(
                      "400m away",
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.shopping_basket),
                    ),
                    trailing: IconButton(icon: Icon(Icons.navigation),onPressed: (){},),
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
                      'Water Shop',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Text(
                      "600m away",
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.pin_drop),
                    ),
                    trailing: IconButton(icon: Icon(Icons.navigation),onPressed: (){},),
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
                      'Water Point',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Text(
                      "80m away",
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.pin_drop),
                    ),
                    trailing: IconButton(icon: Icon(Icons.navigation),onPressed: (){},),
                  ),
                ],
              ),
            ),
//          Card(
//            color: Theme.of(context).brightness == Brightness.dark
//                ? Color(0xff121212)
//                : Colors.white,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(5.0),
//            ),
//            elevation: 4,
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                const SizedBox(height: 10.0),
//                ListTile(
//                  title: Text(
//                    'reggeg',
//                    style: TextStyle(
//                      fontSize: 19,
//                      fontWeight: FontWeight.bold,
//                      fontFamily: "Circular",
//                    ),
//                  ),
//                  subtitle: Text(
//                    "Published on : ergerg",
//                  ),
//                ),
//
//                const SizedBox(height: 10.0),
//                SizedBox(
//                  width: 310,
//                  child: Text(
//                    "regreg",
//                    style: TextStyle(
//                      fontSize: 15,
//                      fontWeight: FontWeight.w500,
//                      fontFamily: "Circular",
//                    ),
//                  ),
//                ),
//                const SizedBox(height: 10.0),
//                SizedBox(
//                  width: 310,
//                  child: Text(
//                    "Source : rgrger",
//                    style: TextStyle(
//                      fontSize: 14,
//                      fontFamily: "Circular",
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  width: 310,
//                  child: Text(
//                    "Author : dsgdssdg",
//                    style: TextStyle(
//                      fontSize: 14,
//                      fontFamily: "Circular",
//                    ),
//                  ),
//                ),
//                const SizedBox(height: 10.0),
//                SizedBox(
//                  width: double.infinity,
//                  // height: double.infinity,
//                  child: Container(
//                      padding: EdgeInsets.all(2),
//                      decoration: new BoxDecoration(
//                          color: Theme.of(context).brightness == Brightness.dark
//                              ? Color(0xff121212)
//                              : Color(0xff323edd),
//                          borderRadius: new BorderRadius.only(
//                              bottomLeft: const Radius.circular(5.0),
////                            topLeft:  const  Radius.circular(5.0),
////                            topRight: const  Radius.circular(5.0),
//                              bottomRight: const Radius.circular(5.0))),
//                      child: Row(
//                        mainAxisSize: MainAxisSize.max,
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          FlatButton.icon(
//                            icon: Icon(Icons.bookmark_border),
//                            textColor: Colors.white,
//                            label: Text(
//                              "Add to Stack",
//                              style: TextStyle(
//                                fontFamily: "Circular",
//                              ),
//                            ),
//                          ),
//                          FlatButton.icon(
//                            icon: Icon(Icons.open_in_new),
//                            textColor: Colors.white,
//                            label: Text(
//                              "Read Now",
//                              style: TextStyle(
//                                fontFamily: "Circular",
//                              ),
//                            ),
//                          ),
//                        ],
//                      )),
//                ),
//              ],
//            ),
//          ),
          ],
        ),
      ),
    );
  }
}
