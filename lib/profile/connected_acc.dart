import 'package:flutter/material.dart';

class ConAcc extends StatefulWidget {
  @override
  _ConAccState createState() => _ConAccState();
}

class _ConAccState extends State<ConAcc> {
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
            "Connected Accounts",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Circular",
            ),
          )),
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
                      'Piyush Jain',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Text(
                      "Samsung Galaxy A4",
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/men.png"),
                    ),
                  ),

                  SizedBox(
                    width: 310,
                    child: Text(
                      "User Id : IVYP8QHY9J",
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
                      "Logged on : 24th June 2020",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Wallet Access : Yes",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
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
                              icon: Icon(Icons.create),
                              textColor: Colors.black,
                              label: Text(
                                "Change Access",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: (){},
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.exit_to_app),
                              textColor: Colors.black,
                              label: Text(
                                "Logout",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: (){},
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
                      'Isha Goyal',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Text(
                      "OnePlus 7T",
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/men.png"),
                    ),
                  ),

                  SizedBox(
                    width: 310,
                    child: Text(
                      "User Id : V4P48636IU",
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
                      "Logged on : 1st March 2020",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Wallet Access : Yes",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
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
                              icon: Icon(Icons.create),
                              textColor: Colors.black,
                              label: Text(
                                "Change Access",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: (){},
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.exit_to_app),
                              textColor: Colors.black,
                              label: Text(
                                "Logout",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: (){},
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
