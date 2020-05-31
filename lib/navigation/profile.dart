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
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.account_balance_wallet),
            color: Colors.black,
          ),
          title: Text(
            "My Profile",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Circular",
            ),
          )
      ),
      body:  SafeArea(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 330,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff0437D6),
                    gradient: LinearGradient(
                      colors: [

                        Color(0xff0434D6),
                        Color(0xff8A00E0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 30,
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                        height: 90,
                        margin: EdgeInsets.only(top: 60),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage('https://www.thehindubusinessline.com/info-tech/social-media/z6d0w1/article25454757.ece/ALTERNATES/LANDSCAPE_1200/SUNDARPICHAI'),
                          child: Image.network(""),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    Text(
                      "Sunder Rajan Pichai",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.white,),
                        Text(
                          "Jabalpur",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(),
                      padding: EdgeInsets.all(10),
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                    padding:
                                    EdgeInsets.only(top: 15, bottom: 5),
                                    child: Text("Photos",
                                        style: TextStyle(
                                            color: Colors.black54))),
                                Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    child: Text("5,000",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16))),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                    padding:
                                    EdgeInsets.only(top: 15, bottom: 5),
                                    child: Text("Followers",
                                        style: TextStyle(
                                            color: Colors.black54))),
                                Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    child: Text("5,000",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16))),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                    padding:
                                    EdgeInsets.only(top: 10, bottom: 5),
                                    child: Text("Account",
                                        style: TextStyle(
                                            color: Colors.black54))),
                                Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text("3",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16)
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    UserInfo(),
                    SingleChildScrollView(
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
                                    backgroundImage: NetworkImage('https://www.thehindubusinessline.com/info-tech/social-media/z6d0w1/article25454757.ece/ALTERNATES/LANDSCAPE_1200/SUNDARPICHAI'),
                                  ),
                                  title: Text("Damodar Lohani"),
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
                            "PUSH NOTIFICATIONS",
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
                          Text(
                            "APP INFO",
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
                                  onChanged: (val){}
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
                          const SizedBox(height: 60.0),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "User Information",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            leading: Icon(Icons.my_location),
                            title: Text("Location"),
                            subtitle: Text("Kathmandu"),
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text("sudeptech@gmail.com"),
                            trailing: IconButton(icon: Icon(Icons.edit),),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text("99--99876-56"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Address"),
                            subtitle: Text(
                                "Flat Number 34, Karmeta Road,Jabalpur"),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
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
