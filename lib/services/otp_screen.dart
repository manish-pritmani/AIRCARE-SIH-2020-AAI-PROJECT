import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpScreen extends StatefulWidget {
  bool _isInit = true;
  var _contact = '';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}


class _OtpScreenState extends State<OtpScreen> {
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Timer _timer;

  //this is method is used to initialize data
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load data only once after screen load
    if (widget._isInit) {
      widget._contact = '${ModalRoute.of(context).settings.arguments as String}';
      generateOtp(widget._contact);
      widget._isInit = false;
    }
  }

  //dispose controllers
  @override
  void dispose() {
    super.dispose();
  }

  //build method for UI
  @override
  Widget build(BuildContext context) {
    //Getting screen height width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Lottie.asset(
                  'assets/lf30_editor_W5Ua7J.json',
                  height: screenHeight * 0.3,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  'Enter a 6 digit number that was sent to ${widget._contact}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth > 600 ? screenWidth * 0.2 : 4),
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
//                      boxShadow: [
//                        const BoxShadow(
//                          color: Colors.grey,
//                          offset: Offset(0.0, 1.0), //(x,y)
//                          blurRadius: 2.0,
//                        ),
//                      ],
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: screenWidth * 0.025),
                        child: PinEntryTextField(
                          fields: 6,
                          onSubmit: (text) {
                            smsOTP = text as String;
                          },
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          verifyOtp();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:  Color(0xff376AFF),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Verify',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
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

  //Method for generate otp from firebase
  Future<void> generateOtp(String contact) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: contact,
          codeAutoRetrievalTimeout: (String verId) {
            verificationId = verId;
          },
          codeSent: smsOTPSent,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) {},
          verificationFailed: (AuthException exception) {
            // Navigator.pop(context, exception.message);
          });
    } catch (e) {
      handleError(e as PlatformException);
      // Navigator.pop(context, (e as PlatformException).message);
    }
  }

  Future<String> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user.uid;
  }

  Future<String> userEmail() async {
    FirebaseUser user = await _auth.currentUser();
    return user.email;
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  //Method for verify otp entered by user
  Future<void> verifyOtp() async {
    if (smsOTP == null || smsOTP == '') {
      showAlertDialog(context, 'Please enter 6 digit OTP.');
      return;
    }
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final AuthResult user = await _auth.signInWithCredential(credential);
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.user.uid == currentUser.uid);
      Navigator.pushReplacementNamed(context, '/homeScreen');
    } catch (e) {
      handleError(e as PlatformException);
    }
  }

  //Method for handle the errors
  void handleError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          errorMessage = 'Invalid Verification Code.';
        });
        showAlertDialog(context, 'Invalid Verification Code.');
        break;
      default:
        showAlertDialog(context, error.message);
        break;
    }
  }
  showAlertDialog(BuildContext context, String message) {
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
    showDialog(barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}