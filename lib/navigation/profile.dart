import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.account_balance_wallet),
            color: Colors.black,
          ),
          title: Text(
            "My Profile",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontFamily: "Circular",
            ),
          )
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTiaeo4KRf4TB86TnhHUWOcUT6tS_I50CFZUEFweCQHX4yBA2so&usqp=CAU'),
                    ),
                    title: Text("Narendra Modi"),
                    onTap: () {},
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
                    onTap: () {},
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
                    title: Text("Received notification"),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: false,
                    title: Text("Received newsletter"),
                    onChanged: null,
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: true,
                    title: Text("Received Offer Notification"),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Color(0xff0437D6),
                    value: true,
                    title: Text("Received App Updates"),
                    onChanged: null,
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
                    onTap: () {},
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
                    onTap: () {},
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
                    onTap: () {},
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
