import 'package:flutter/material.dart';
import 'package:sih/navigation/test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Color(0xffecf0f1),
                  child: Icon(Icons.card_travel, color: Color(0xFF2980b9),),
                ),
                title: Text("Ethereum"),
                trailing: Text("\$450"),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "FREE USER",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 330,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff0437D6),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(),
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage('https://www.thehindubusinessline.com/info-tech/social-media/z6d0w1/article25454757.ece/ALTERNATES/LANDSCAPE_1200/SUNDARPICHAI'),
                          child: Image.network(""),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding:
                              EdgeInsets.only(top: 15, bottom: 5),
                              child: Text(
                                "Sunder Pinchas",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              ),),
                            Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Text("5,000",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16))),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                Text(
                  "Sunder Pinchas",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Positioned(
                  top: 20,
                  right: 30,
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),


              ],
            ),
            UserInfo(),

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

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[


                Expanded(
                  child: RaisedButton.icon(
                    onPressed: (){},
                    icon: Icon(FontAwesomeIcons.levelUpAlt, color: Color(0xff3498db),),
                    label: Text("Send"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                SizedBox(width: 20,),

                Expanded(
                  child: RaisedButton.icon(
                    elevation: 0,
                    onPressed: (){},
                    icon: Icon(Icons.add, color: Color(0xFF2ecc71),),
                    label: Text("Add Money"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),

              ],
            ),
          ),


          Container(
            margin: EdgeInsets.symmetric(horizontal: 20,),
            alignment: Alignment.topLeft,
            child: Text("Currency", style: TextStyle(fontSize: 22,),),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffecf0f1),
                      child: Icon(FontAwesomeIcons.bitcoin, color: Color(0xFFf1c40f),),
                    ),
                    title: Text("Bitcoin"),
                    trailing: Text("\$8,000"),
                  ),
                ),

                SizedBox(height: 10,),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffecf0f1),
                      child: Icon(FontAwesomeIcons.ethereum, color: Color(0xFF2980b9),),
                    ),
                    title: Text("Ethereum"),
                    trailing: Text("\$450"),
                  ),
                ),

                SizedBox(height: 10,),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffecf0f1),
                      child: Icon(FontAwesomeIcons.euroSign, color: Color(0xff2ecc71),),
                    ),
                    title: Text("Euro"),
                    trailing: Text("\$99"),
                  ),
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}