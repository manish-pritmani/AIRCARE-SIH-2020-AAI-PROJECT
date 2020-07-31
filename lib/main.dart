import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/explore.dart';
import 'package:sih/navigation/profile.dart';
import 'package:sih/navigation/travel.dart';
import 'package:sih/navigation/wallet.dart';
import 'package:sih/onboarding.dart';
import 'package:sih/services/login_screen.dart';
import 'package:sih/services/otp_screen.dart';
import 'package:sih/widgets/name.dart';
import 'package:sih/taxi/bloc/taxi_booking_bloc.dart';


void main() {
  //MapView.setApiKey("AIzaSyDT8-ttxGcKLv7LyC62JcSgT2TBYnXvfFw");
  runApp(MultiBlocProvider(providers: [
    BlocProvider<TaxiBookingBloc>(
      create: (context) => TaxiBookingBloc(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AirCare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
        accentColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      darkTheme: ThemeData.dark(),
      home: Splash(),
      routes: <String, WidgetBuilder>{
        '/otpScreen': (BuildContext ctx) => OtpScreen(),
        '/homeScreen': (BuildContext ctx) => HomePage(),
        '/name': (BuildContext ctx) => Name(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  HomePage({this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Explore(),
    Travel(),
    Wallet(),
    Profile(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 2,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Color(0xff0437D6),
                tabs: [
                  GButton(
                    icon: LineIcons.dashboard,
                    text: 'Explore',
                  ),
                  GButton(
                    icon: LineIcons.briefcase,
                    text: 'Travel',
                  ),
                  GButton(
                    icon: LineIcons.credit_card,
                    text: 'Wallet',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}

MaterialColor colorCustom = MaterialColor(0xff0437D6, color);

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};


class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => OnBoardingPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("Welcome to AirCare",style: TextStyle(color: Color(0xff376AFF),fontSize: 18),),
            )
          ],
        )
    );
  }
}

//
//class MappingPage extends StatefulWidget {
//  final AuthImplementation auth;
//
//  MappingPage({
//    this.auth,
//  });
//
//  State<StatefulWidget> createState() {
//    return _MappingPageState();
//  }
//}
//
//enum AuthStatus {
//  notSignedIn,
//  signedIn,
//}
//
//class _MappingPageState extends State<MappingPage> {
//  AuthStatus authStatus = AuthStatus.notSignedIn;
//  FirebaseUser user;
//
//  @override
//  void initState() {
//    super.initState();
//    widget.auth.getCurrentUser().then((firebaseUserId) {
//      setState(() {
//        authStatus = firebaseUserId == null
//            ? AuthStatus.notSignedIn
//            : AuthStatus.signedIn;
//      });
//    });
//    initUser();
//  }
//
//  initUser() async {
//    user = await _auth.currentUser();
//  }
//
//
//  void _signedIn() {
//    setState(() {
//      authStatus = AuthStatus.signedIn;
//    });
//  }
//
//  void _signOut() {
//    setState(() {
//      authStatus = AuthStatus.notSignedIn;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    switch (authStatus) {
//      case AuthStatus.notSignedIn:
//        return LoginScreen(
//          auth: widget.auth,
//          onSignedIn: _signedIn,
//        );
//
//      case AuthStatus.signedIn:
//        return HomePage(
//          auth: widget.auth,
//          onSignedOut: _signOut,
//        );
//    }
//    return null;
//  }
//}
