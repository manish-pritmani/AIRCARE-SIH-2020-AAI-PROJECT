import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/profile/manage_sub.dart';
import 'package:sih/profile/language.dart';
import 'package:sih/profile/dev_contact.dart';
import 'package:sih/profile/connected_acc.dart';
import 'package:sih/profile/my_profile.dart';
import 'package:toast/toast.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double width, height = 55.0;
  double customFontSize = 13;
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyText = TextStyle(
    color: Colors.grey.shade600,
  );
  final TextStyle whiteBoldText = TextStyle(
    color: Colors.black,
  );


  bool isSwitchedFT = true;
  bool privateAcc = true;
  bool receiveTravel = true;
  bool flightUpdate = true;
  bool deal=true;
  bool baggageStatus=true;

  @override
  void initState() {
    super.initState();
    getSwitchValues();
  }

  getSwitchValues() async {
    isSwitchedFT = await getSwitchState() ?? false;
    privateAcc = await getPrivateAcc() ?? false;
    receiveTravel = await getReceiveTravel() ?? false;
    flightUpdate = await getFlightUpdate()?? false;
    deal = await getDeal()?? false;
    baggageStatus = await getBaggageStatus()?? false;
    setState(() {});
  }

  Future<bool> getDeal() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool deal = prefs.getBool("deal");
    return deal;
  }

  Future<bool> saveDeal(bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("deal", value);
    print("Deal Value Saved $value");
    return prefs.setBool("deal", value);
  }

  Future<bool> getFlightUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool flightUpdate = prefs.getBool("flightUpdate");
    return flightUpdate;
  }

  Future<bool> saveFlightUpdate(bool value) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setBool("flightUpdate", value);
    print("Flight Value Saved $value");
    return prefs.setBool("flightUpdate", value);
  }


  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("switchState", value);
    print('Switch Value saved $value');
    return prefs.setBool("switchState", value);
  }

  Future<bool> getSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSwitchedFT = prefs.getBool("switchState");
    return isSwitchedFT;
  }

  Future<bool> getBaggageStatus() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool baggageStatus = prefs.getBool("baggageStatus");
    return baggageStatus;
  }

  Future<bool> saveBaggageStatus(bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("baggageStatus",value);
    print('Switch Value saved $value');
    return prefs.setBool("baggageStatus", value);

  }

  Future<bool> getPrivateAcc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool privateAcc = prefs.getBool("privateAcc");
    return privateAcc;
  }

  Future<bool> savePrivate(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("privateAcc", value);
    print('Switch Value saved $value');
    return prefs.setBool("privateAcc", value);
  }

  Future<bool> getReceiveTravel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool receiveTravel = prefs.getBool("receiveTravel");
    return receiveTravel;
  }

  Future<bool> saveReceiveTravel(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("receiveTravel", value);
    print('Switch Value saved $value');
    return prefs.setBool("receiveTravel", value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.person),
            color: Colors.black,
          ),
          title: Text(
            "User Profile",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontFamily: "Circular",
            ),
          )),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Container(
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/men.png"),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  Text(
                    "Manish Pritmani",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  Text(
                    "+91-7879365300",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ]),
            const SizedBox(height: 20.0),
            Text(
              "ACCOUNT",
              style: headerStyle,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("My Profile"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileInfo()));
                    },
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    title: Text("Private Account"),
                    value: privateAcc,
                    onChanged: (bool value) {
                      setState(() {
                        privateAcc = value;
                        savePrivate(value);
                        print('Saved state is $privateAcc');
                        if(privateAcc==true)
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Private Account Enabled Successfully'),
                            duration: Duration(seconds: 2),
                          ));
                        }else
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Private Account Disabled by You'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                        //switch works
                      });
                      print(isSwitchedFT);
                    },

                  ),
                  _buildDivider(),
                  ListTile(
                    title: Text("Connected Accounts"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ConAcc()));
                    },
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              "NOTIFICATIONS AND ALERTS",
              style: headerStyle,
            ),
            const SizedBox(height: 10.0),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    title: Text("Receive Travel Notifications"),
                    value: receiveTravel,
                    onChanged: (bool value) {
                      setState(() {
                        receiveTravel = value;
                        saveSwitchState(value);
                        print('Saved state is $receiveTravel');
                        if(receiveTravel==true)
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("You will receive travel status update notification."),
                            duration: Duration(seconds: 2),
                          ));
                        }else
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('You have disabled travel update notifications'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                        //switch works
                      });
                      print(isSwitchedFT);
                    },
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    title: Text("Flight Update Notifications"),
                    value: flightUpdate,
                    onChanged: (bool value) {
                      setState(() {
                        flightUpdate = value;
                        var note = saveFlightUpdate(value);
                        print("this is note $note");
                        print('Saved state is $flightUpdate');
                        if(flightUpdate==true)
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('You will receive flight status update notification.'),
                            duration: Duration(seconds: 2),
                          ));
                        }else
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('You have disabled flight update notifications.'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                        //switch works
                      });
                      print(isSwitchedFT);
                    },
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: deal,
                    title: Text("Deals and Offers"),
                    onChanged: (bool value) {
                      setState(() {
                        deal = value;
                        var note = saveDeal(value);
                        print("this is note $note");
                        print('Saved state is $deal');
                        if(deal==true)
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('You will receive deals and offers notifications.'),
                            duration: Duration(seconds: 2),
                          ));
                        }else
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('You have unsubscribed from deal and offers notifications.'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                        //switch works
                      });
                      print(deal);
                    },
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: baggageStatus,
                    title: Text("Baggage Status"),
                    onChanged: (bool value) {
                      setState(() {
                        baggageStatus = value;
                        var note = saveBaggageStatus(value);
                        print("this is note $note");
                        print('Saved state is $baggageStatus');
                        if(baggageStatus==true)
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('You will receive updated information for your Baggage.'),
                            duration: Duration(seconds: 2),
                          ));
                        }else
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('You have unsubscribed from Baggage Updates notifications.'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                        //switch works
                      });
                      print(baggageStatus);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "MY MEMBERSHIP",
                  style: headerStyle,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF2ecc71),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "VIP USER",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Text(
              "Expiring on January 2021",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Manage Membership"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ManageSub()));
                    },
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  _buildDivider(),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              "MORE",
              style: headerStyle,
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    title: Text("Dark Mode"),
                    value: isSwitchedFT,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitchedFT = value;
                        saveSwitchState(value);
                        print('Saved state is $isSwitchedFT');
                        if(isSwitchedFT==true)
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Dark Mode Enabled Successfully.'),
                            duration: Duration(seconds: 2),
                          ));
                        }else
                        {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Dark Mode has been disabled by You.'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                        //switch works
                      });
                      print(isSwitchedFT);
                    },
                  ),
                  _buildDivider(),
                  ListTile(
                    title: Text("Language"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppLanguage()));
                    },
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              "SUPPORT ",
              style: headerStyle,
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                      title: Text("App Version"),
                      onTap: (){
                        showAlertDialog(context);
                        Future.delayed(const Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                          Toast.show("No update available.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        });
                      },
                      trailing: Text(
                        "2.3.84",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )),
                  _buildDivider(),
                  ListTile(
                    title: Text("Contact Us"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DevContact()));
                    },
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  _buildDivider(),
                  ListTile(
                    title: Text("Rate Us"),
                    trailing: Icon(Icons.star, color: Colors.amberAccent),
                    onTap: () {
                      
                    },
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => LogoutOverlay(),
                  );
                },
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 10,),
          Container(margin: EdgeInsets.only(left: 5),child:Text("Checking for updates" )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}

Container _buildDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    width: double.infinity,
    height: 1.0,
    color: Colors.grey.shade300,
  );
}

final TextStyle headerStyle = TextStyle(
  color: Colors.grey.shade800,
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);


class LogoutOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<LogoutOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              height: 180.0,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 20.0, right: 20.0),
                        child: Text(
                          "Are you sure, you want to logout?",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      )),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ButtonTheme(
                                height: 35.0,
                                minWidth: 110.0,
                                child: RaisedButton(
                                  color: Color(0xff376AFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0)),
                                  splashColor: Colors.white.withAlpha(40),
                                  child: Text(
                                    'Logout',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0),
                                  ),
                                  onPressed: () {
                                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//                                    setState(() {
//                                      Route route = MaterialPageRoute(
//                                          builder: (context) => Profile());
//                                      Navigator.pushReplacement(context, route);
//                                    });
                                  },
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 10.0, top: 10.0, bottom: 10.0),
                              child:  ButtonTheme(
                                  height: 35.0,
                                  minWidth: 110.0,
                                  child: RaisedButton(
                                    color: Color(0xff376AFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2.0)),
                                    splashColor: Colors.white.withAlpha(40),
                                    child: Text(
                                      'Cancel',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                       });
                                    },
                                  ))
                          ),
                        ],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}