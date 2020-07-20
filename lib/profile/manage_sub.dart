import 'package:flutter/material.dart';

class ManageSub extends StatefulWidget {
  @override
  _ManageSubState createState() => _ManageSubState();
}

class _ManageSubState extends State<ManageSub> {
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
            "Manage Membership",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Circular",
            ),
          )),
      backgroundColor: Colors.white,
      body: Column(
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
                    'Manish Pritmani',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Circular",
                    ),
                  ),
                  subtitle: Text(
                    "User Id : V4P48636IU",
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/men.png"),
                  ),
                  trailing: IconButton(icon: Icon(Icons.delete_outline),onPressed: (){},),
                ),
                Divider(),
                SizedBox(
                  width: 310,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.sentiment_very_satisfied),
                      SizedBox(width: 5,),
                      Text(
                        "Membership Details",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Circular",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
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
                    "Expiring on : 21st March 2021",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Circular",
                    ),
                  ),
                ),
                SizedBox(
                  width: 310,
                  child: Text(
                    "Offer and Benifits Access : Active",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Circular",
                    ),
                  ),
                ),
                SizedBox(
                  width: 310,
                  child: Text(
                    "Membership Status : Active",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Circular",
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 310,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.receipt),
                      SizedBox(width: 5,),
                      Text(
                        "Transaction Details",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Circular",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 310,
                  child: Text(
                    "Transaction Id : V4P48636IU",
                    style: TextStyle(
                      fontSize: 15,

                      fontFamily: "Circular",
                    ),
                  ),
                ),
                SizedBox(
                  width: 310,
                  child: Text(
                    "Payment Mode : One Wallet",
                    style: TextStyle(
                      fontSize: 15,

                      fontFamily: "Circular",
                    ),
                  ),
                ),
                SizedBox(
                  width: 310,
                  child: Text(
                    "Date of Transaction : 21st March 2020 ",
                    style: TextStyle(
                      fontSize: 15,

                      fontFamily: "Circular",
                    ),
                  ),
                ),
                SizedBox(
                  width: 310,
                  child: Text(
                    "Plan Type : 1-Year-Full",
                    style: TextStyle(
                      fontSize: 15,

                      fontFamily: "Circular",
                    ),
                  ),
                ),
                SizedBox(
                  width: 310,
                  child: Text(
                    "Plan Validity : 1 Year",
                    style: TextStyle(
                      fontSize: 15,

                      fontFamily: "Circular",
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
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
          Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Color(0xff376AFF),
                child: Text('Extend Membership',
                  style: TextStyle(fontSize: 16),),
                onPressed: () =>
                {

                },
              )),
        ],
      ),
    );
  }
}
