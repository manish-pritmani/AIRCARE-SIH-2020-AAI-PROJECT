import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  Color _custom = Colors.white;
  Color _color = Colors.black;
  var _pAccess = "Basic";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buy Subscription",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: "Circular",
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => {Navigator.of(context).pop()},
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Lottie.asset("assets/7267-likes-and-hearts.json"),
                Positioned(
                  top: 25,
                  left: 22,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Select Plan Type",
                      style: TextStyle(
                          color: _custom,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.stars, color: Color(0xff3f81f0)),
                            SizedBox(width: 20),
                            Expanded(
                              child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                icon: Icon(Icons.keyboard_arrow_down,
                                    color: Color(0xff3f81f0)),
                                //
                                value: _pAccess,
                                items: [
                                  "Basic",
                                  "Elite",
                                  "Pro",
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _pAccess = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // appbar
//            SafeArea(
//              top: true,
//              left: true,
//              right: true,
//              child: Container(
//                margin: EdgeInsets.symmetric(horizontal: 16.0),
//                height: 40.0,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Spacer(),
//                    Container(
//                      height: 40.0,
//                      width: 200.0,
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              Text(
//                                "Space",
//                                style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
//                              ),
//                              Container(
//                                height: 24.0,
//                                width: 40.0,
//                                decoration: BoxDecoration(
//                                    color: Color.fromRGBO(242, 197, 145, 1), borderRadius: BorderRadius.circular(2.0)),
//                                child: Center(
//                                    child: Text(
//                                      "CARE",
//                                      style: TextStyle(color: _backgroundColor, fontSize: 16.0, fontWeight: FontWeight.bold),
//                                    )),
//                              )
//                            ],
//                          ),
//                          Text(
//                            "open full access to space",
//                            style: TextStyle(
//                                color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w600, fontSize: 10.0),
//                          ),
//                        ],
//                      ),
//                    ),
//                    Spacer(),
//                    Container(
//                      height: 32.0,
//                      width: 32.0,
//                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
//                      child: Center(
//                          child: Icon(
//                            Icons.close,
//                            size: 20.0,
//                            color: Colors.white,
//                          )),
//                    )
//                  ],
//                ),
//              ),
//            ),

            // listview
            Container(
//                    alignment: Alignment.center,
                height: 250.0,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 16.0, right: 8.0, top: 64.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.green,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "3",
                                    style: TextStyle(
                                        color: _custom,
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "month",
                                    style: TextStyle(
                                        color: _custom,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "\27.99",
                                    style: TextStyle(
                                        color: _custom,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 2.0,
                              color: _custom,
                            ),
                            Flexible(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "\8.99",
                                    style: TextStyle(
                                        color: _custom,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "per month",
                                    style: TextStyle(
                                        color: _custom.withOpacity(0.5),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 8.0,
                            right: 8.0,
                            left: 8.0,
                            bottom: 12.0,
                            child: Container(
                              height: 250.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.red,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 16.0,
                                      child: Center(
                                        child: Text(
                                          "POPULAR".toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Flexible(
                                      flex: 6,
                                      child: Container(
                                        color: Color(0xff3f81f0),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "12",
                                                style: TextStyle(
                                                    color: _custom,
                                                    fontSize: 40.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "month",
                                                style: TextStyle(
                                                    color: _custom,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                "\119.88",
                                                style: TextStyle(
                                                    color: _custom
                                                        .withOpacity(0.5),
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                              Text(
                                                "\79.99",
                                                style: TextStyle(
                                                    color: _custom,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 2.0,
                                      color: Colors.red,
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(8.0))),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "\6.67",
                                                style: TextStyle(
                                                    color: _custom,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "per month",
                                                style: TextStyle(
                                                    color: _custom
                                                        .withOpacity(0.5),
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Icon(
                              Icons.check_circle,
                              size: 28.0,
                              color: Colors.amberAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 8.0, right: 16.0, top: 64.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.redAccent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        color: _custom,
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "month",
                                    style: TextStyle(
                                        color: _custom,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "\47.99",
                                    style: TextStyle(
                                        color: _custom,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 2.0,
                              color: _custom,
                            ),
                            Flexible(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "\7.99",
                                    style: TextStyle(
                                        color: _custom,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "per month",
                                    style: TextStyle(
                                        color: _custom.withOpacity(0.5),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),

            SizedBox(height: 20.0),
            // text
            Text(
              "Select your plan after 7-days trial period",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                height: 48.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Color(0xff376AFF),
                    borderRadius: BorderRadius.circular(4.0)),
                child: FlatButton(
                  child: Text(
                    "Try now for free",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: (){
                    showAccessDialog(context);
                  },
                ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              height: 48.0,
              decoration: BoxDecoration(
                  color: Color(0xff376AFF),
                  borderRadius: BorderRadius.circular(4.0)),
              child: Center(
                  child: Text(
                "Buy Now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )),
            ),
            // text
            Text(
              "By clicking Buy Now, you agree to the rules",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "for ",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0),
                ),
                TextSpan(
                  text: "using the servies ",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0),
                ),
                TextSpan(
                  text: "and ",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0),
                ),
                TextSpan(
                  text: "processing personal data.",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0),
                ),
              ]),
            ),
            SizedBox(
              height: 32.0,
            ),
          ],
        ),
      ),
    );
  }
  showAccessDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("7-Days Trial"),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('To help you decide which subscription to chose.We\'re serving you free 7-days trial after that you need to proceed with the payment.'),
              ],
            ),
          );
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Start Trial'),
          onPressed: () {
            Navigator.of(context).pop();
            Toast.show("Free Trial Activated.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
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
