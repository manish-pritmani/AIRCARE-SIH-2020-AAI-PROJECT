import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:random_string/random_string.dart';

class WheelChairRequest extends StatefulWidget {
  @override
  _WheelChairRequestState createState() => _WheelChairRequestState();
}

class _WheelChairRequestState extends State<WheelChairRequest> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();

  final firestoreInstance = Firestore.instance;

  String _name,_age,_ticketNumber,_id;
  String _message =" ";

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      feedData();
    }
  }

  void feedData() {
    String token = randomAlphaNumeric(10);
    print(_name);
    firestoreInstance.collection("users").document(token).setData(
        {
          "name" : _name,
          "age" : _age,
          "ticket" : _ticketNumber,
          "id" : _id,
          "message": _message,
        }).then((_){
      print("success!");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Success(token: token)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Wheel Chair Request",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: "Circular",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Color(0xfff0f0f0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.info_outline,
                        color: Colors.black,
                        size: 17,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        child: Text(
                          "Enter details of the person needed chair.",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Circular",
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  makeInput(
                    label: "Name*",
                    message: "Provide a Name",
                    onSave: _name,
                  ),
                  makeInput(
                    label: "Age*",
                    message: "Provide an Age",
                    onSave: _age,
                  ),
                  makeInput(
                    label: "Ticket Number*",
                    message: "Provide an Email",
                    onSave: _ticketNumber,
                  ),
                  makeInput(
                    label: "Identity Card* (any)",
                    message: "Provide any identity card id",
                    onSave: _id,
                  ),
                  makeMessage(
                    label: "Any Special Message",
                    onSave: _message,
                  ),
                ],
              ),
            ),
//              FlatButton(onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>Success()));
//              }, child: Text("Success")),
//              FlatButton(onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>Failed()));
//              }, child: Text("Failed")),
//              FlatButton(onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>Already()));
//              }, child: Text("Already"))
          ],
        ),
      )),
      bottomNavigationBar: Container(
        height: 56,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Color(0xfff9d56e),
                child: FlatButton(
                  child: Text("Request Now", style: TextStyle(fontSize: 17)),
                  onPressed: _submit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false, message, onSave}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          validator: (input) {
            if (input.isEmpty) {
              return message;
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onSaved: (val) => onSave = val,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget makeMessage({label, obscureText = false, onSave}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onSaved: (val) => onSave = val,
          maxLines: 5,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class Success extends StatelessWidget {
  final String token;
  Success({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Request Successful",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: "Circular",
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Lottie.asset("assets/23749-successful.json"),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your token number",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            token.toUpperCase(),
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "You will receive SMS shortly and",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "we will reach to you soon.",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class Failed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Request Failed",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: "Circular",
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child:
                Lottie.asset("assets/12821-failed-attempt.json", height: 250),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your request cannot be processed.",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Please Try Again or Contact Helpdesk",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "we will reach to you soon.",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              color: Colors.amberAccent,
              elevation: 0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WheelChairRequest()));
              },
              child: Text(
                "Try Again",
                style: TextStyle(fontSize: 18),
              )),
        ],
      ),
    );
  }
}

class Already extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Request Successful",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: "Circular",
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Lottie.asset("assets/6936-class-ninjas-floating-ninja.json"),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your request is already accepted.",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your token number is",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            "2XEKDF2",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "If you have any query,",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            "let us know through helpdesk.",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "we will reach to you soon.",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
