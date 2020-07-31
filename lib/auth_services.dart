import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementation {
  Future<String> signIn(String phone, String password);
  Future<String> signUp(String phone, String password,String name,String email);
  Future<String> getCurrentUser();
  Future<String> userEmail();
  Future<void> signOut();
}

class Auth implements AuthImplementation {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String phone, String password) async {
    String email = phone + "@gmail.com";
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signUp(String phone, String password,String name,String email) async {
    String peal = phone + "@gmail.com";
    var uniqueid;
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: peal, password: password);
      FirebaseUser user = result.user;
      uniqueid=user.uid;
      if(user.uid!=null){
        Firestore.instance.collection("user").document(phone).setData({
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
          "role": "student",
          "createdOn": DateTime.now().toString(),
        });
      }
      UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
      userUpdateInfo.displayName = name;
      user.updateProfile(userUpdateInfo);
    }catch(e){
      print('Error = ' + e.toString());}
    return uniqueid;
  }

  Future<String> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  Future<String> userEmail() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.email;
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}