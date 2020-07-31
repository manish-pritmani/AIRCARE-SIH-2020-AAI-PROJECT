import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/country_picker.dart';
import 'package:sih/custom_button.dart';
import 'package:sih/main.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _contactEditingController = TextEditingController();
  var _dialCode = '';

  Future<void> clickOnLogin(BuildContext context) async {
    if (_contactEditingController.text.isEmpty) {
      showErrorDialog(context, 'Contact number can\'t be empty.');
    } else {
      final responseMessage = await Navigator.pushNamed(context, '/otpScreen',
          arguments: '$_dialCode${_contactEditingController.text}');
      if (responseMessage != null) {
        showErrorDialog(context, responseMessage as String);
      }
    }
  }

  void _callBackFunction(String name, String dialCode, String flag) {
    _dialCode = dialCode;
  }

  void showErrorDialog(BuildContext context, String message) {
    final AlertDialog alert = AlertDialog(
      title: Text("Error Occurred"),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$message'),
              ],
            ),
          );
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('OKAY'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool rememberMe = false;

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var phone = prefs.getString('phone');
  }

  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;
    if (rememberMe) {
      saveSwitchState(_contactEditingController.text.toString());
      rememberMe=true;
    } else {
      _contactEditingController.text=null;
    }
  });

  Future saveSwitchState(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("phone", value);
  }

  Future<String> isRem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String isSwitchedFT = prefs.getString("phone");
    return isSwitchedFT;
  }

  @override
  void initState() {
   if( _contactEditingController.text!=null) {
          isRem();
   }
    super.initState();
  }
  //build method for UI Representation
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Image.asset(
                  'assets/launch_image.png',
                  width: screenWidth * 0.7,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
//                Image.asset(
//                  'assets/launch_image.png',
//                  height: screenHeight * 0.3,
//                  fit: BoxFit.contain,
//                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Login to AirCare',
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Enter your mobile number to receive a verification code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth > 600 ? screenWidth * 0.2 : 12),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
//                      boxShadow: [
////                        const BoxShadow(
////                          color: Colors.grey,
////                          offset: Offset(0.0, 1.0), //(x,y)
//////                          blurRadius: 1.0,
////                        ),
////                      ],
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff376AFF),
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            CountryPicker(
                              callBackFunction: _callBackFunction,
                              headerText: 'Select Country',
                              headerBackgroundColor:
                                  Theme.of(context).primaryColor,
                              headerTextColor: Colors.white,
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'Contact Number',
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 13.5),
                                ),
                                controller: _contactEditingController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomButton(clickOnLogin),
                      CheckboxListTile(
                          title: new Text(
                            'Remember Login',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          value: rememberMe,
                          onChanged: _onRememberMeChanged
                      ),
                      FlatButton(
                          onPressed: () {
                            Toast.show("Disabled by System administrator.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          },
                          child: Text(
                            "Skip Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
