import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class tResult extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<tResult> {
  _telPhone() async {
    const uri = 'tel: 1800-11-0402';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not initiate $uri';
    }
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
              "Tour Guides Search Result",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Circular",
              ),
            )),
        body: ListView(
          children: <Widget>[
            Card(
              color: Theme
                  .of(context)
                  .brightness == Brightness.dark
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
                      'Amit Mishra',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.star,color: Colors.amber,),
                        Icon(Icons.star,color: Colors.amber,),
                        Icon(Icons.star,color: Colors.amber,),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/men.png"),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Charges : 300 Per Hour",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Famous for Site Visit in Jabalpur",
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
                      "Nearly 15 Site Visits",
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
                              icon: Icon(Icons.call),
                              textColor: Colors.black,
                              label: Text(
                                "Contact Guide",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: _telPhone,
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.star_border),
                              textColor: Colors.black,
                              label: Text(
                                "Book This Guide",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: () {
                                Toast.show("Payment Functionality will be added soon.", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);
                              },
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Card(
              color: Theme
                  .of(context)
                  .brightness == Brightness.dark
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
                      'Pradhuymn Singh',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Circular",
                      ),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.star,color: Colors.amber,),
                        Icon(Icons.star,color: Colors.amber,),
                        Icon(Icons.star,color: Colors.amber,),
                        Icon(Icons.star_half,color: Colors.amber,),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/men.png"),
                    ),
                  ),

                  SizedBox(
                    width: 310,
                    child: Text(
                      "Charges : 1300 Per Hour",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Circular",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 310,
                    child: Text(
                      "Recommended by most peoples.",
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
                      "Nearly 15 Site Visits",
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
                              icon: Icon(Icons.call),
                              textColor: Colors.black,
                              label: Text(
                                "Contact Guide",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: _telPhone,
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.star_border),
                              textColor: Colors.black,
                              label: Text(
                                "Book This Guide",
                                style: TextStyle(
                                  fontFamily: "Circular",
                                ),
                              ),
                              onPressed: () {
                                  Toast.show("Payment Functionality will be added soon.", context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.BOTTOM);
                              },
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
