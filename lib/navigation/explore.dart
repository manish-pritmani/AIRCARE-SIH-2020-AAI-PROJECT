import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.location_on,color: Colors.black,),
                Text(
                  "Jabalpur Airport",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 15,)
              ],
            ),
          ],
          title: Text(
            "Explore",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Circular",
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 1,
        child: Icon(Icons.chat),
        backgroundColor: Color(0xffffffff),
        foregroundColor: Color(0xff0437D6),
      ),
      body: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                backgroundColor: Color(0xffecf0f1),
                child: Icon(Icons.fastfood, color: Colors.redAccent),
              ),
              title: Text("Food Order"),
              trailing: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2ecc71),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  "ORDER NOW",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                backgroundColor: Color(0xffecf0f1),
                child: Icon(
                  Icons.local_taxi,
                  color: Color(0xFF2980b9),
                ),
              ),
              title: Text("Cab Ride"),
              trailing: Container(
                decoration: BoxDecoration(
                  color: Color(0xff3498db),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  "BOOK NOW",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                backgroundColor: Color(0xffecf0f1),
                child: Icon(
                  Icons.shopping_basket,
                  color: Color(0xff3f3f44),
                ),
              ),
              title: Text("Shopping Mall"),
              trailing: Container(
                decoration: BoxDecoration(
                  color: Color(0xffffcd3c),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  "SHOWCASE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                backgroundColor: Color(0xffecf0f1),
                child: Icon(Icons.hotel, color: Colors.redAccent),
              ),
              title: Text("Hotels Nearby"),
              trailing: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFd92027),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  "SEARCH NOW",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
