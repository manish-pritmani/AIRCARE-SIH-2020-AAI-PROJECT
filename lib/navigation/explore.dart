import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sih/Help/chatbot.dart';
import 'package:sih/Help/my_favourites.dart';
import 'package:sih/Help/qna.dart';
import 'package:sih/features/book_flight.dart';
import 'package:sih/features/deals_coupons.dart';
import 'package:sih/features/help_desk.dart';
import 'package:sih/features/wheel_chair_request.dart';
import 'package:sih/features/wifi_hunt.dart';
import 'package:sih/main.dart';
import 'package:sih/navigation/indoor_navigation.dart';
import 'package:sih/utils/offers.dart';
import 'package:sih/utils/slider.dart';
import 'package:sih/vip_zone.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  double width, height = 50.0;
  double customFontSize = 13;
  final TextEditingController _searchControl = new TextEditingController();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  ScrollController scrollController;
  bool dialVisible = true;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  LineIcons.map_marker,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  _currentAddress == null
                      ? "Getting Location"
                      : _currentAddress,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ],
          title: Text(
            "Explore",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontFamily: "Circular",
            ),
          )),
      floatingActionButton: SpeedDial(
        // both default to 16
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        visible: dialVisible,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.easeInExpo,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Quick Action',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.bubble_chart),
              backgroundColor:  Color(0xff376AFF),
              foregroundColor: Colors.white,
              label: 'HelpBot',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageDialogflow()),
                );
              }),
          SpeedDialChild(
            child: Icon(Icons.star),
            backgroundColor: Colors.amberAccent,
            foregroundColor: Colors.white,
            label: 'Favourites',
            labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favourites()),
                );
              }),
          SpeedDialChild(
            child: Icon(Icons.local_offer),
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            label: 'My Coupons',
            labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favourites()),
                );
              }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PreferredSize(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: "Search flights, shops, services etc",
                        prefixIcon: Icon(
                          LineIcons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.filter_list,
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                      maxLines: 1,
                      controller: _searchControl,
                    ),
                  ),
                ),
              ),
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                60.0,
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: double.maxFinite,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage("assets/bg.jpg"),
//                    fit: BoxFit.cover,
//                    alignment: Alignment.topCenter,
//                  ),
//                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  title: Text("Airport Navigation"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapViewExample()));
                  },
                  subtitle: Text("See inside airport view"),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF0437d6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      "NAVIGATE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            sectionHeader('Pick a Services', onViewMore: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ViewMore()));
            }),

            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Find Nearby",
                        style: serviceStyle,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                  onPressed: () {},
                                  shape: CircleBorder(),
                                  child: Image.asset("assets/food.png"),
                                ),
                              ),
                              Text(
                                "Dining",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontFamily: 'Roboto-Light.ttf',
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {},
                                    shape: CircleBorder(),
                                    child: Image.asset(
                                        "assets/passengerswait.png")),
                              ),
                              Text(
                                "Book Taxi",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: width,
                                height: height,
                                child: RawMaterialButton(
                                  onPressed: () {},
                                  shape: CircleBorder(),
                                  child: Image.asset("assets/hotel.png"),
                                ),
                              ),
                              Text(
                                "Hotels",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                  onPressed: () {},
                                  shape: CircleBorder(),
                                  child: Image.asset("assets/shop.png"),
                                ),
                              ),
                              Text(
                                "Shopping",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Quick Search",
                        style: serviceStyle,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FlightSearchPage()));
                                    },
                                    shape: CircleBorder(),
                                    child: Image.asset("assets/tickets.png")),
                              ),
                              Text(
                                "Book Flight",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: width,
                                height: height,
                                child: RawMaterialButton(
                                    onPressed: () {},
                                    shape: CircleBorder(),
                                    child: Image.asset("assets/tourism.png")),
                              ),
                              Text(
                                "Tour Guide",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {},
                                    shape: CircleBorder(),
                                    child: Image.asset("assets/euro.png")),
                              ),
                              Text(
                                "Exchange",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Coupon()));
                                    },
                                    shape: CircleBorder(),
                                    child: Image.asset("assets/gift.png")),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Deals and",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  ),
                                  Text(
                                    "offers",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Services",
                        style: serviceStyle,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {},
                                    shape: CircleBorder(),
                                    child:
                                        Image.asset("assets/waiting-room.png")),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Waiting",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  ),
                                  Text(
                                    "Room",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {},
                                    shape: CircleBorder(),
                                    child: Image.asset("assets/parking.png")),
                              ),
                              Text(
                                "Parking",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontFamily: 'Roboto-Light.ttf',
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: width,
                                height: height,
                                child: RawMaterialButton(
                                    onPressed: () {},
                                    shape: CircleBorder(),
                                    child: Image.asset("assets/location.png")),
                              ),
                              Text(
                                "Wifi Nearby",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {},
                                    shape: CircleBorder(),
                                    child: Image.asset("assets/baggage.png")),
                              ),
                              Text(
                                "Check-in",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Convenience",
                        style: serviceStyle,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {},
                                    shape: CircleBorder(),
                                    child: Image.asset("assets/hand-wash.png")),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Covid-19",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  ),
                                  Text(
                                    "Response",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HelpDesk()),
                                      );
                                    },
                                    shape: CircleBorder(),
                                    child:
                                        Image.asset("assets/telemarketer.png")),
                              ),
                              Text(
                                "HelpDesk",
                                style: TextStyle(
                                    color: Color(0xFF969696),
                                    fontWeight: FontWeight.w500,
                                    fontSize: customFontSize),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WheelChairRequest()));
                                    },
                                    shape: CircleBorder(),
                                    child:
                                        Image.asset("assets/water-bottle.png")),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Drinking Water",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  ),
                                  Text(
                                    "Station",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(bottom: 10),
                                child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WheelChairRequest()));
                                    },
                                    shape: CircleBorder(),
                                    child:
                                        Image.asset("assets/wheelchair.png")),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Wheel Chair",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  ),
                                  Text(
                                    "Request",
                                    style: TextStyle(
                                        color: Color(0xFF969696),
                                        fontWeight: FontWeight.w500,
                                        fontSize: customFontSize),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            sectionHeader('Offers and Discounts', onViewMore: () {
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => ViewMore()));
            }),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.4,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurants == null ? 0 : restaurants.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map restaurant = restaurants[index];

                    return Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: SlideItem(
                        img: restaurant["img"],
                        title: restaurant["title"],
                        address: restaurant["address"],
                        rating: restaurant["rating"],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          createCard(context,
                              'https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201802231621388236-77015efa221711e98be80242ac110002.jpg?&output-quality=75&downsize=520:350&crop=520:350;23,0&output-format=jpg'),
                          createCard(context,
                              'https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg'),
                        ],
                      ))
                ],
              ),
            ),
//            Card(
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(8),
//              ),
//              child: ListTile(
//                contentPadding:
//                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                leading: CircleAvatar(
//                  backgroundColor: Color(0xffecf0f1),
//                  child: Icon(Icons.fastfood, color: Colors.redAccent),
//                ),
//                title: Text("Food Order"),
//                trailing: Container(
//                  decoration: BoxDecoration(
//                    color: Color(0xFF2ecc71),
//                    borderRadius: BorderRadius.circular(4),
//                  ),
//                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                  child: Text(
//                    "ORDER NOW",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 16,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ),
//              ),
//            ),
//            Card(
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(8),
//              ),
//              child: ListTile(
//                contentPadding:
//                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                leading: CircleAvatar(
//                  backgroundColor: Color(0xffecf0f1),
//                  child: Icon(
//                    Icons.local_taxi,
//                    color: Color(0xFF2980b9),
//                  ),
//                ),
//                title: Text("Cab Ride"),
//                trailing: Container(
//                  decoration: BoxDecoration(
//                    color: Color(0xff3498db),
//                    borderRadius: BorderRadius.circular(4),
//                  ),
//                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                  child: Text(
//                    "BOOK NOW",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 16,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ),
//              ),
//            ),
//            Card(
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(8),
//              ),
//              child: ListTile(
//                contentPadding:
//                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                leading: CircleAvatar(
//                  backgroundColor: Color(0xffecf0f1),
//                  child: Icon(
//                    Icons.shopping_basket,
//                    color: Color(0xff3f3f44),
//                  ),
//                ),
//                title: Text("Shopping Mall"),
//                trailing: Container(
//                  decoration: BoxDecoration(
//                    color: Color(0xffffcd3c),
//                    borderRadius: BorderRadius.circular(4),
//                  ),
//                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                  child: Text(
//                    "SHOWCASE",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 16,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ),
//              ),
//            ),
//            Card(
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(8),
//              ),
//              child: ListTile(
//                contentPadding:
//                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                leading: CircleAvatar(
//                  backgroundColor: Color(0xffecf0f1),
//                  child: Icon(Icons.hotel, color: Colors.redAccent),
//                ),
//                title: Text("Hotels Nearby"),
//                trailing: Container(
//                  decoration: BoxDecoration(
//                    color: Color(0xFFd92027),
//                    borderRadius: BorderRadius.circular(4),
//                  ),
//                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                  child: Text(
//                    "SEARCH NOW",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 16,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ),
//              ),
//            ),
            if (_currentPosition != null)
              Text(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
            Container(
              width: double.maxFinite,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                title: Text("Buy VIP Subscription"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VIPZone()));
                },
                subtitle: Text("Get exciting offers and save more."),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                title: Text("Airport Details"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VIPZone()));
                },
                subtitle: Text("Locate any airport and get details."),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "LOCATE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                title: Text("Safe Travel Guidelines"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VIPZone()));
                },
                subtitle: Text("Coronavirus guidelines for airports."),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "SEE GUIDE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
//            Text("Project Developed by Six Muskeeters for SIH-2020"),
//            SizedBox(height: 20,),
//            FlatButton(
//              child: Text("Get location"),
//              onPressed: () {
//                _getCurrentLocation();
//              },
//            ),
//            FlatButton(
//              child: Text("Get location"),
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => OnBoardingPage()),
//                );
//              },
//            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}

Widget createCard(BuildContext context, String imageAssetUrl) {
  //TODO replace all constants with variables passed in an object
  return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Query())),
      child: Container(
        ///check orientation
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ?

            ///then set the card's width limits (relative or absolute max)
            MediaQuery.of(context).size.width * 0.85
            : 350,
        //TODO add a special case for tablets
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.blueGrey[100],
          image: DecorationImage(
              //TODO add black vignette
              image: NetworkImage(imageAssetUrl),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            'Book Now the Hotels at best price in Jabalpur'
                                .toUpperCase(),
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 19)),
                      ),
                      Expanded(
                        child: Text(
                          'Buy VIP Membership for Exciting discounts',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                      )
                    ],
                  )),
                  Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.timer,
                            color: Colors.white,
                          )),
                      Text('00h 00m', style: TextStyle(color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child:
                        Text('BOOK NOW', style: TextStyle(color: Colors.white)),
                    color: Color(0xff0437D6),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Query()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(6.0)),
                  )
                ],
              ),
            ),
          ],
        ),
      ));
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(
          headerTitle,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all'),
        ),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('Service', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Frieds', Icons.fastfood, onPressed: () {}),
            headerCategoryItem('Fast Food', Icons.fastfood, onPressed: () {}),
            headerCategoryItem('Creamery', Icons.fastfood, onPressed: () {}),
            headerCategoryItem('Hot Drinks', Icons.fastfood, onPressed: () {}),
            headerCategoryItem('Vegetables', Icons.fastfood, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 70,
            height: 70,
            child: FloatingActionButton(
              elevation: 1,
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: Colors.white,
              child: Icon(icon, size: 30, color: Colors.black87),
            )),
        Text(name)
      ],
    ),
  );
}

final TextStyle headerStyle = TextStyle(
  color: Colors.grey.shade800,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);

final TextStyle serviceStyle = TextStyle(
  color: Colors.grey.shade800,
  fontWeight: FontWeight.w600,
  fontSize: 16.0,
);

class ViewMore extends StatelessWidget {
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
          "Explore Everything",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: "Circular",
          ),
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
