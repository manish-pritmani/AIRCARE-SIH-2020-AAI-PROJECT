import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabContentStructure {
  static Widget createContent(BuildContext context, String groupTitle) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          createSectionHeader(context, groupTitle),
          Container(
              height: 250,
              child:
              ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  //TODO assign background img in a more concise way
                  createCard(context, 'https://img.freepik.com/free-vector/vintage-ornamental-flowers-background_52683-28040.jpg?size=626&ext=jpg'),
                  createCard(context, 'https://img.freepik.com/free-vector/vintage-ornamental-flowers-background_52683-28040.jpg?size=626&ext=jpg'),
                ],
              )
          )
        ],
      ),
    );
  }
}

Widget createSectionHeader(BuildContext context, String headerTitle, {onViewMore}) {
  return Container (
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16,top: 20),
            child: Text(headerTitle, style: Theme.of(context).textTheme.bodyText1,),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 10),
            child: FlatButton(
              onPressed: onViewMore,
              child: Text('See all', style: TextStyle(color: Color(0xffafb6bc))),
            ),
          )
        ],
      )
  );
}

Widget createCard(BuildContext context, String imageAssetUrl){
  //TODO replace all constants with variables passed in an object
  return GestureDetector(
      child: Container(
        ///check orientation
        width: MediaQuery.of(context).orientation== Orientation.portrait?
        ///then set the card's width limits (relative or absolute max)
        MediaQuery.of(context).size.width * 0.85 : 350,
        //TODO add a special case for tablets
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(left: 16.0, top: 5, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.blueGrey[100],
          image:  DecorationImage(
            //TODO add black vignette
              image: NetworkImage(imageAssetUrl),
              fit: BoxFit.cover,
              alignment: Alignment.center
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('RAINING CASHBACK OFFER',
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.subtitle1,),

              ],
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('ADD MONEY GET 3% CASHBACK'.toUpperCase(),
                              overflow: TextOverflow.fade,
                              style: Theme.of(context).textTheme.headline6),
                          Text('Add money to One Wallet by any mode and get 3% cashback upto 150, offer valid for first 200 customers',
                            overflow: TextOverflow.fade,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF2ecc71),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            child: Text(
                              "ONLY FOR VIP USER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],)
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Icon(Icons.date_range, color: Colors.black, )),
                        Text('2nd July',
                          style: Theme.of(context).textTheme.subtitle1,),
                      ],),

                    Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Icon(Icons.timer, color: Colors.black, )),
                        Text('12:00 P.M',
                          style: Theme.of(context).textTheme.subtitle1,),
                      ],),
                  ],
                ),

                FlatButton(
                  child: Text('JOIN IN', style: TextStyle(color: Colors.white)),
                  color: Color(0xff0437D6),
                  onPressed: (){

                  },
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)) ,
                )
              ],
            ),
          ],
        ),
      ));
}