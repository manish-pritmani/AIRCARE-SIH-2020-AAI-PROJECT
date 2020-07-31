import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih/features/qr_scan.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:majascan/majascan.dart';

class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  double width, height = 50.0;
  double customFontSize = 13;
  String result = "Hey there !";

  Future _scanQR() async {
    try {
      String qrResult = await MajaScan.startScan(
          title: "QRcode scanner",
          titleColor: Colors.amberAccent[700],
          qRCornerColor: Colors.orange,
          qRScannerColor: Colors.orange);
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == MajaScan.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

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
            SizedBox(
              height: 110.0,
              child: ListView(
                scrollDirection: Axis.horizontal, children: <Widget>[
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
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanViewDemo()));
                                      },
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
                                      onPressed: () {
                                        showAccessDialog(context);
                                      },
                                      shape: CircleBorder(),
                                      child: Image.asset("assets/lock.png"),
                                    ),
                                  ),
                                  Text(
                                    "Digital Locker",
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
                    ),
                ),
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
                                      onPressed: () {
                                        showAccessDialog(context);
                                      },
                                      shape: CircleBorder(),
                                      child: Image.asset("assets/repeat.png"),
                                    ),
                                  ),
                                  Text(
                                    "Repeat Travel",
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
              ],),
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
                          'Aarogya Setu',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            ListTile(
              title: Text(
              "As per recent government guidelines and rules published for flight-travellers,it is recommended to download Aarogya-Setu.",
              style: TextStyle(
              ),
            ),
              subtitle:RaisedButton(
                color: Color(0xff376AFF),
                child:
                Text('DOWNLOAD NOW', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0),),
                onPressed: () {
                  StoreRedirect.redirect(
                      androidAppId: "nic.goi.aarogyasetu");
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(6.0)),
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
            ListTile(
              dense: true,
              trailing: Text(
                "CONFIRMED",
                style: TextStyle(
                    inherit: true, fontWeight: FontWeight.w600, fontSize: 16.0),
              ),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Material(
                  elevation: 1,
                  shape: CircleBorder(),
                  shadowColor: Colors.green.withOpacity(0.4),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Icon(
                        Icons.flight,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child:  Text(
                    "Travel to Delhi",
                    style: TextStyle(
                        inherit: true, fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),)
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Ticket Number: BK9SG",
                        style: TextStyle(
                            inherit: true, fontSize: 12.0, color: Colors.black45)),
                  ],
                ),
              ),
            ),
//            Container(
////              height: 80,
////              child: Center(
////                child:Text("Looks clean here! Book Travels to see here."),
////              ),
////            ),
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
            ListTile(
              dense: true,
              trailing: Text(
                "COMPLETED",
                style: TextStyle(
                    inherit: true, fontWeight: FontWeight.w600, fontSize: 16.0),
              ),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Material(
                  elevation: 1,
                  shape: CircleBorder(),
                  shadowColor: Colors.green.withOpacity(0.4),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Icon(
                        Icons.flight,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child:  Text(
                    "Travel to New York",
                    style: TextStyle(
                        inherit: true, fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),)
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Ticket Number: BK9SG",
                        style: TextStyle(
                            inherit: true, fontSize: 12.0, color: Colors.black45)),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              child: Center(
                child:Text("Explore and Travel more to see something here."),
              ),
            ),
          ],
        ),
      )
    );
  }
  showAccessDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Aarogya Setu Download"),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('As per the latest government regulations, travellers are recommended to download this application.'),
              ],
            ),
          );
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Download Now'),
          onPressed: () {
            StoreRedirect.redirect(
                androidAppId: "nic.goi.aarogyasetu");
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
    showDialog(barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}