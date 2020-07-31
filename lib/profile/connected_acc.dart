import 'package:flutter/material.dart';

class ConAcc extends StatefulWidget {
  @override
  _ConAccState createState() => _ConAccState();
}

class _ConAccState extends State<ConAcc> {
  var _wAccess = "Yes";
  var _tAccess = "Yes";
  var _pAccess = "Yes";
  var _aAccess = "Yes";

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
                              onPressed: () {
                                showAccessDialog(context);
                              },
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
                              onPressed: () {
                                showAlertDialog(context);
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
                              onPressed: () {
                                showAccessDialog(context);
                              },
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
                              onPressed: () {
                                showAlertDialog(context);
                              },
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

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Logout this Account"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
                'This account will no longer have access to your services and benefits and will be removed from the connected accounts.'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Logout'),
          onPressed: () {
            Navigator.of(context).pop();
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

  showAccessDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Change user access."),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Changing access will limit the services for this user account.'),
                SizedBox(height: 15,),
                Text('Wallet access'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey), //
                          value: _wAccess,
                          items: [
                            "Yes",
                            "No",
                          ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _wAccess = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Text('Travel access'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey), //
                          value: _tAccess,
                          items: [
                            "Yes",
                            "No",
                          ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _tAccess = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Text('Payment access'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey), //
                          value: _pAccess,
                          items: [
                            "Yes",
                            "No",
                          ].map<DropdownMenuItem<String>>(
                                  (String value) {
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
                SizedBox(height: 15,),
                Text('Account Details access'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey), //
                          value: _aAccess,
                          items: [
                            "Yes",
                            "No",
                          ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _aAccess = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Save Changes'),
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
