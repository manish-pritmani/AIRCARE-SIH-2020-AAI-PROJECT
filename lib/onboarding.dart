import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih/main.dart';
import 'package:sih/services/login_screen.dart';
import 'package:sih/utils/buy_sub.dart';
import 'package:sih/web_view.dart';



class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _endCall(context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => WebViewWindow(
          title: "Terms of Service",
          selectedUrl: "https://raw.githubusercontent.com/manish-pritmani/tnc/master/tnc",
        )));
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Introducing AirCare",
          body:
          "Simple and easy travel management with much more travel facilities than before.",
          image: _buildImage('airport'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Now Travel Smartly with Automation using AI",
          body:
          "Travelling was never as easy as automating it like this.Automated Bookings,Good Recommendations.",
          image: _buildImage('airport'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pay Quick and Easy",
          body:
          "Introducing ONE Wallet Paying at Airport Shopping Complex,Parking, Hotels,Cabs was never be as easy.",
          image: _buildImage('card'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Simplified Experience",
          body:
          "From Check-in,Parking to Waiting Room,We'll help you manage travel easily.",
          image: _buildImage('card'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Great Offers,Limitless Discounts with VIP",
          body:
              "Everytime you pay anywhere get exclusive ONE Pay Rewards, and additional discounts for VIP Members.",
          image: _buildImage('reward'),
          footer: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Subscription()));
//              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              'Buy VIP Now',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
            color: Color(0xff0437D6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          decoration: pageDecoration,
        ),
//        PageViewModel(
//          title: "Title of last page",
//          bodyWidget: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: const [
//              Text("Click on ", style: bodyStyle),
//              Icon(Icons.edit),
//              Text(" to edit a post", style: bodyStyle),
//            ],
//          ),
//          image: _buildImage('img1'),
//          decoration: pageDecoration,
//        ),
        PageViewModel(
          title: "Let's Get in",
          body: "Create account to Explore and Book services easily. Make your travel hassle-free.",
          image: _buildImage('card'),
          footer: RaisedButton(
            onPressed: () => _onIntroEnd(context),
            child: const Text(
              'Get Started',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
            color: Color(0xff0437D6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _endCall(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('SKIP'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('T&C', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: Color(0xff0437D6),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
