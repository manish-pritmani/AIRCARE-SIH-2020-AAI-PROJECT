import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:random_string/random_string.dart';

class SwabTest extends StatefulWidget {
  @override
  _WheelChairRequestState createState() => _WheelChairRequestState();
}

class _WheelChairRequestState extends State<SwabTest> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();

  final firestoreInstance = Firestore.instance;

  String _name,_age,_ticketNumber,_id;
  String _message =" ";
  bool _termsChecked=false;

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
    firestoreInstance.collection("swab-test").document(token).setData(
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

  var _location="Madhya Pradesh";

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
          "Swab-Test Booking Online",
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
                          Expanded(
                            child: Text(
                              "Swab-Test is currently available on limited location. Check before you leave for destination.",
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
                        height: 10,
                      ),
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
                            Icon(Icons.map, color: Color(0xff3f81f0)),
                            SizedBox(width: 20),
                            Expanded(
                              child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                icon: Icon(Icons.keyboard_arrow_down,
                                    color: Color(0xff3f81f0)), //
                                value: _location,
                                items: [
                                  "Andaman and Nicobar Islands",
                                  "Andhra Pradesh",
                                  "Arunachal Pradesh",
                                  "Assam",
                                  "Bihar",
                                  "Chandigarh",
                                  "Chhattisgarh",
                                  "Delhi",
                                  "Goa",
                                  "Gujarat",
                                  "Haryana",
                                  "Himachal Pradesh",
                                  "Jammu and Kashmir",
                                  "Jharkhand",
                                  "Karnataka",
                                  "Kerala",
                                  "Ladakh",
                                  "Madhya Pradesh",
                                  "Maharashtra",
                                  "Manipur",
                                  "Meghalaya",
                                  "Mizoram",
                                  "Odisha",
                                  "Puducherry",
                                  "Punjab",
                                  "Rajasthan",
                                  "Tamil Nadu",
                                  "Telangana",
                                  "Tripura",
                                  "Uttar Pradesh",
                                  "Uttarakhand",
                                  "West Bengal"
                                ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _location = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Text(
                        "Enter the details of the person for test below.",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Circular",
                            color: Colors.black),
                      ),
                      SizedBox(height: 5),
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
                        label: "Email*",
                        message: "Provide an Email",
                        onSave: _ticketNumber,
                      ),
//                      CheckboxListTile(
//                        value: checkboxValue,
//                        onChanged: (val) {
//                          if (checkboxValue == false) {
//                            setState(() {
//                              checkboxValue = true;
//                            });
//                          } else if (checkboxValue == true) {
//                            setState(() {
//                              checkboxValue = false;
//                            });
//                          }
//                        },
//                        subtitle: !checkboxValue
//                            ? Text(
//                          'Required.',
//                          style: TextStyle(color: Colors.red),
//                        )
//                            : null,
//                        title: new Text(
//                          'I agree.',
//                          style: TextStyle(fontSize: 14.0),
//                        ),
//                        controlAffinity: ListTileControlAffinity.leading,
//                        activeColor: Colors.green,
//                      )
                    ],
                  ),
                ),
                CheckboxListTile(
                  activeColor: Theme.of(context).accentColor,
                  title: Text('I agree to terms and conditions of the swab-test from the AirCare.'),
                  value: _termsChecked,
                  onChanged: (bool value) => setState(() => _termsChecked = value),
                  subtitle: !_termsChecked
                      ? Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                    child: Text('Required field', style: TextStyle(color: Color(0xFFe53935), fontSize: 12),),)
                      : null,
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
                color: Color(0xff3f81f0),
                child: FlatButton(
                  child: Text("Request Now", style: TextStyle(fontSize: 17,color: Colors.white)),
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