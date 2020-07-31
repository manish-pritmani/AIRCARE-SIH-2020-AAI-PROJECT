import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sih/models/box_model.dart';
import 'package:sih/widgets/options_box_widget.dart';

class HotelDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(//
      body: Stack(children: <Widget>[
        Container(
          height: _screenSize.height * 0.45,
          child: Swiper(
            pagination:
            new SwiperPagination(margin: EdgeInsets.only(bottom: 45.0)),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/imgs/room-${index + 1}.jpg'),
              );
            },
          ),
        ),
        Positioned(
          top: 45.0,
          width: _screenSize.width,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 255, 255, 0.3),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: IconButton(
                    onPressed: () {
                      return Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                    ),
                  ),
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 255, 255, 0.3),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(bottom: 100.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            height: _screenSize.height * 0.6,
            child: SingleChildScrollView(
              child: Container(
                child: _descriptionCard(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: price(),
        )
      ]),
    );
  }

  Widget _descriptionCard() {
    return Column(
      children: <Widget>[mainInformation(), menu(), about()],
    );
  }

  Widget menu() {
    final List<BoxModel> boxes = [
      BoxModel(color: 0xFFDFDBEE, text: 'Wifi', iconName: 'wifi'),
      BoxModel(color: 0xFFDFDBEE, text: 'Ac', iconName: 'ac_unit'),
      BoxModel(color: 0xFFDFDBEE, text: 'Pool', iconName: 'pool'),
      BoxModel(color: 0xFFDFDBEE, text: 'More', iconName: 'apps'),
    ];
    return Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        margin: EdgeInsets.symmetric(vertical: 30.0),
        child: OptionsBox(boxes));
  }

  Widget mainInformation() {
    return Container(
      padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Golden Tulip Hotel',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Color(0xFF6C46FE),
                    size: 16.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Buenos Aires, Argentina',
                      style: TextStyle(color: Colors.grey, fontSize: 12.0))
                ],
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.map,
                    color: Color(0xFF6C46FE),
                    size: 16.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('1 hours (3,4 km)',
                      style: TextStyle(color: Colors.grey, fontSize: 12.0))
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          mapita()
        ],
      ),
    );
  }

  Widget mapita() {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image(
          image: AssetImage('assets/imgs/map.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      height: 75.0,
      width: 75.0,
      decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [BoxShadow(blurRadius: 5.0, color: Colors.grey)],
          borderRadius: BorderRadiusDirectional.circular(10.0)),
    );
  }

  Widget about() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'About Hotel',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7.0,
          ),
          Text(
            'This 3-star hotel combines style, comfort and the modern side of Pontianak city on the Kapuas River delta, West Kalimantan. As the capital of the province.',
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  Widget price() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Price'),
              Text('\$ 280,00',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
            ],
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Color(0xFF6C46FE),
            textColor: Colors.white,
            child: Text(
              'Book Room',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}