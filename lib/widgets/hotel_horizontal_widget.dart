import 'package:flutter/material.dart';

class HotelHorizontal extends StatelessWidget {
  final String title;
  final List<String> hotels;
  HotelHorizontal({@required this.title, @required this.hotels});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            this.title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 200.0,
          child: PageView(
            controller: PageController(initialPage: 0, viewportFraction: 0.55),
            pageSnapping: false,
            children: [
              _tarjeta(hotels[0], context),
              _tarjeta(hotels[1], context),
              _tarjeta(hotels[2], context),
            ],
          ),
        )
      ],
    );
  }
}

Widget _tarjeta(String imageURL, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'hotel');
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)]),
      child: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: AssetImage(imageURL),
                  placeholder: AssetImage(imageURL),
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
            bottom: 5,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Golden Tulip Hotel',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                Container(
                  color: Colors.black45,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 14.0,
                      ),
                      Text(
                        'Buenos Aires',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 60.0,
              height: 30.0,
              decoration: BoxDecoration(
                  color: Color(0xFFF6AC02),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  Text(
                    '4.8',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
