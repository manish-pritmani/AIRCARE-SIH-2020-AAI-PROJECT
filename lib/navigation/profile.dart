import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:sih/profile/manage_sub.dart';
import 'package:sih/profile/language.dart';
import 'package:sih/profile/dev_contact.dart';
import 'package:sih/profile/connected_acc.dart';


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
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontFamily: "Circular",
            ),
          )
      ),
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget>[
               Center(
                 child: Container(
                     height: 100,
                     margin: EdgeInsets.only(top: 30),
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
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                Text(
                  "+91-7879365300",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ]
            ),
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
                    onTap: () {},
                    trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade600,),
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: true,
                    title: Text("Private Account"),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                  ListTile(
                    title: Text("Connected Accounts"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ConAcc()));
                    },
                    trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade600,),
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
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0,),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: true,
                    title: Text("Receive Travel Notification"),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: true,
                    title: Text("Receive Offer Notification"),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: true,
                    title: Text("Flight Update Notifications"),
                    onChanged: (val) {},
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
                        fontWeight: FontWeight.bold
                    ),
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
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0,),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Manage Membership"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageSub()));
                    },
                    trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade600,),
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
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0,),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: true,
                    title: Text("Dark Mode"),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                  ListTile(
                    title: Text("Language"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AppLanguage()));
                    },
                    trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade600,),
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
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0,),
              child: Column(
                children: <Widget>[
                  ListTile(
                      title: Text("App Version"),
                      onTap:(){

                      },
                      trailing: Text("2.3.84",style: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.w600),)
                  ),
                  _buildDivider(),
                  ListTile(
                    title: Text("Contact Us"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DevContact()));
                    },
                    trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade600,),
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0,),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: (){},
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
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