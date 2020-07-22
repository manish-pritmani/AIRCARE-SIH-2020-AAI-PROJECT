import 'package:flutter/material.dart';
import 'package:sih/navigation/test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih/utils/constants.dart';
import 'package:sih/utils/offers.dart';
import 'package:sih/utils/slider.dart';

class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  double width, height = 50.0;
  double customFontSize = 13;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.card_travel),
            color: Colors.black,
          ),
          title: Text(
            "Your Travel",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontFamily: "Circular",
            ),
          )
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 85,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: width,
                                    height: height,
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: RawMaterialButton(
                                      onPressed: () {},
                                      shape: CircleBorder(),
                                      child: Image.asset("assets/qr-code.png"),
                                    ),
                                  ),
                                  Text(
                                    "Scan Ticket",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontFamily: 'Roboto-Light.ttf',
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 85,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: width,
                                    height: height,
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: RawMaterialButton(
                                      onPressed: () {},
                                      shape: CircleBorder(),
                                      child: Image.asset("assets/ticket_section.png"),
                                    ),
                                  ),
                                  Text(
                                    "My Tickets",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontFamily: 'Roboto-Light.ttf',
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'Plan Your Travels',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
//            Padding(
//                padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 5.0),
//                child: new Text(
//                  'Whether you have an hour or a whole day to spare, we\'ll create a memorable tour for you.',
//                  style: TextStyle(
//
//                  ),
//                ),
//            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
              child: Container(
                height: MediaQuery.of(context).size.height/2.5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.9,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Card(
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
                      elevation: 1.0,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height/4,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/tour-pic-plan.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 7.0),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Whether you have an hour or a whole day to spare, we\'ll create a memorable tour for you.",
                                style: TextStyle(


                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                            child:
                            Text('CREATE NOW', style: TextStyle(color: Colors.black)),
                            onPressed: () {
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(builder: (context) => Query()),
//                                    );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(6.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'Upcoming Travels',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[Text("See all")],
                    )
                  ],
                )),
            Container(
              height: 80,
              child: Center(
                child:Text("Looks clean here! Book Travels to see here."),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          "Past Travels",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[Text("See all")],
                    )
                  ],
                )),
            Container(
              height: 80,
              child: Center(
                child:Text("Explore and Travel to see something here."),
              ),
            ),
          ],
        ),
      )
    );
  }
}