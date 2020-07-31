import 'package:sih/taxi/models/user.dart';

class UserController {
  static User getUser() {
    return User(
        name: "Manish Pritmani",
        mobileNumber: "+91-7879365300",
        photoUrl:
            "assets/men.png");
  }
}
