import 'package:flutter/material.dart';
import 'package:sih/features/testing.dart';
import 'package:sih/web_view.dart';

class CovidResp extends StatefulWidget {
  @override
  _CovidRespState createState() => _CovidRespState();
}

class _CovidRespState extends State<CovidResp> {

  List courses = [
    'COVID-19 Swab Test',
    'Travelling at other Place',
    'Covid-19 Official Information',
  ];

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
          "AirCare Covid-19 Response",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: "Circular",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 10.0,),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'Safe Travel Actions',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 10.0, ),
                child: Text(
                  'Check and Trace the COVID-19 situation at different locations before you leave.',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),),
            Column(
              children: <Widget>[
                BikeListItem(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>SwabTest())),
                  title: "COVID-19 SwabTest",
                  textButton: "BOOK NOW",
                  thirdTitle:  "Book and pay for test before you arrive at airport.",
                  imageUrl: "assets/0.jpg",
                ),
                BikeListItem(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => null,
                      )),
                  title: "Travelling at other Place",
                  textButton: "READ NOW",
                  thirdTitle:  "Check your destination travel advisories and requirements before you departure. ",
                  imageUrl: "assets/1.jpg",
                ),
                BikeListItem(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => WebViewWindow(
                        title: "WHO: Covid-19 Information",
                        selectedUrl: "https://www.who.int/travel-advice",
                      ))),
                  title: "COVID-19 Official Information",
                  textButton: "READ NOW",
                  thirdTitle:  "Get Updated Information on travelling through airport fom official sources.",
                  imageUrl: "assets/2.jpg",
                ),
              ],
            ),
//            Expanded(
//              child: GridView.builder(
//                padding: EdgeInsets.all(4.0),
//
//                itemCount: courses.length,
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height / 1.2),),
//                shrinkWrap: true,
//                itemBuilder: (BuildContext context, int index) {
//                  return Container(
//                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(10),
////                      boxShadow: [
////                        BoxShadow(
////                          color: Colors.grey[300],
////                          offset: Offset(0, 0),
////                          blurRadius: 5,
////                        ),
////                      ],
//                    ),
//                    child: ClipRRect(
//                      borderRadius: BorderRadius.circular(10),
//                      child: Material(
//                        child: InkWell(
//                          highlightColor: Colors.white.withAlpha(50),
//                          onTap: () {
//
//                          },
//                          child: Expanded(child: Column(
//                            children: <Widget>[
//                              ClipRRect(
//                                borderRadius: BorderRadius.only(
//                                  topLeft: Radius.circular(10),
//                                  topRight: Radius.circular(10),
//                                ),
//                                child: Image.asset(
//                                  'assets/$index.jpg',
//                                  fit: BoxFit.cover,
//                                  height: 100,
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.all(15),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      courses[index].toString().toUpperCase(),
//                                      style: TextStyle(
//                                        fontSize: 14,
//                                        color: Theme.of(context).primaryColor,
//                                        fontWeight: FontWeight.bold,
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: EdgeInsets.only(top: 5),
//                                    ),
//                                    Text(
//                                      'Adobe XD, Sketch, Figma',
//                                      style: TextStyle(
//                                        fontSize: 12,
//                                        color: Colors.grey,
//                                      ),
//                                    ),
//                                    Divider(
//                                      color: Colors.grey[300],
//                                      height: 25,
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Column(
//                                          children: <Widget>[
//                                            FlatButton(
//                                              child:
//                                              Text('BOOK NOW', style: TextStyle(color: Colors.black)),
//                                              onPressed: () {
////                                    Navigator.push(
////                                      context,
////                                      MaterialPageRoute(builder: (context) => Query()),
////                                    );
//                                              },
//                                              shape: RoundedRectangleBorder(
//                                                  borderRadius: new BorderRadius.circular(6.0)),
//                                            ),
//                                          ],
//                                        ),
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              )
//                            ],
//                          ),)
//                        ),
//                      ),
//                    ),
//                  );
//                },
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}

class BikeListItem extends StatelessWidget {
  final String thirdTitle;
  final bool imageRight;
  final imageUrl;
  final title;
  final textButton;
  final double elevation;
  final void Function() onTap;

  const BikeListItem({Key key,
    this.thirdTitle,
    this.imageRight = false,
    this.imageUrl,
    this.title,
    this.textButton,
    this.elevation = 0.5,
    this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onTap: onTap,
        child: Row(
          children: <Widget>[
            _buildThumbnail(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: thirdTitle,
                          ),
                        ],
                      ),
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 10.0),
                    _buildTag(context),
                    const SizedBox(height: 5.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Container _buildThumbnail() {
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: imageRight
            ? BorderRadius.only(
          topRight: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        )
            : BorderRadius.only(
          topLeft: Radius.circular(4.0),
          bottomLeft: Radius.circular(4.0),
        ),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _buildTag(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).primaryColor),
      child: Text(
        textButton,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}


