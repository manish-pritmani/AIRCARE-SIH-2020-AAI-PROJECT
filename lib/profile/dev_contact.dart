import 'package:flutter/material.dart';

class DevContact extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<DevContact> {
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
              "Contact Idea Developers",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Circular",
              ),
            )),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Problem Statement",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Mobile Application needs to develop to track the registered passengers from resistance to home.The application will register passenger mobile number only for those who are willing to take the service,Passengers will be provided customised offers for taxi,concessionaires(a person or a company that has the legal right to use the land that is owned by someone else), etc . based upon passenger history and facility choices opted by the users for the separate module dedicated to vip passengers facilitation needs to be incorporated project should also have 1. User friendly UI/UX for airport passengers 2. Digitally storing and monitoring overall project related data.",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Team Six-Muskeeters",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              ListTile(
                  title: Text("Isha Goyal"),
                  subtitle: Text(
                    "Team Leader",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
              ListTile(
                  title: Text(
                    "Piyush Jain",
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "Team Member",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
              ListTile(
                  title: Text(
                    "Manish Pritmani",
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "Team Member",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
              ListTile(
                  title: Text(
                    "Mihir Bhasin",
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "Team Member",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
              ListTile(
                  title: Text(
                    "Nalin Mahajan",
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "Team Member",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
              ListTile(
                  title: Text(
                    "Neha Mishra",
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "Team Member",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
