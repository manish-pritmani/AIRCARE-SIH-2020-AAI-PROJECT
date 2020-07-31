import 'package:wifi_flutter/wifi_flutter.dart';
import 'package:flutter/material.dart';

class MyWifi extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyWifi> {
  List<Widget> _platformVersion = [];

  @override
  void initState() {
    super.initState();
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
            "Wifi",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Circular",
            ),
          ),
        ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          'Connect to Premium Airport Wifi',
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
                          'Quickly search and connect premium wifi nearby present inside airport and seamlessly enjoy the service.'))),
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
                        'Premium Wifi',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Circular",
                        ),
                      ),
                      subtitle: Text(
                        "Scan and connect",
                      ),
                      leading: CircleAvatar(
                          child: new Text(
                            "Wifi",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          )),
                      trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: (){},),
                    ),

                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-20,
                child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: new BoxDecoration(
                      color: Color(0xff376AFF),
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
                          color: Colors.white,
                          size: 17,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            "Location and Wifi Search Permission needed.",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Circular",
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
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
                          'Search for Free Wifi',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      )
                    ],
                  )
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Center(
                      child: Text(
                          'Search and connect to free wifi nearby inside airport and seamlessly enjoy the service.'))),
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
                        'Free Wifi',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Circular",
                        ),
                      ),
                      subtitle: Text(
                        "Scan and connect",
                      ),
                      leading: CircleAvatar(
                          child: new Text(
                            "Free",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          )),
                      trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: (){},),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-20,
                child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: new BoxDecoration(
                      color: Color(0xff376AFF),
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
                          color: Colors.white,
                          size: 17,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            "Search for nearby available spots of Wifi.",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Circular",
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
      ),
    );
  }
}

