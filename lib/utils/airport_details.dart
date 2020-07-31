import 'package:flutter/material.dart';

class AirportDetails extends StatefulWidget {
  @override
  _AirportDetailsState createState() => _AirportDetailsState();
}

class _AirportDetailsState extends State<AirportDetails> {
  var _location = "Jabalpur Airport";
  double width, height = 55.0;
  double customFontSize = 13;
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyText = TextStyle(
    color: Colors.grey.shade600,
  );
  final TextStyle whiteBoldText = TextStyle(
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text(
              "Search Airport Details",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Circular",
              ),
            )),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset("assets/animation_500_kd1hfn8v.gif"),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Text(
                        'Search by Location',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Center(
                      child: Text(
                          'Turn-on Location to search nearby airports and see the details.'))
              ),
              Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: FlatButton.icon(
                    icon: Icon(Icons.location_searching),
                    textColor: Colors.black,
                    label: Text(
                      'Locate Nearby Airport',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                  )
              ),
              Divider(),
              Container(
                width: width,
                height: height,
                margin: EdgeInsets.only(bottom: 10),
                child: Image.asset("assets/animation_500_kd1hhr4l.gif"),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Text(
                        'Select Airport',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                  child: Center(
                      child: Text(
                          'Select airport from below to see the details.'))),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Color(0xff3f81f0)),
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Color(0xff3f81f0)),
                          //
                          value: _location,
                          items: [
                            "Jabalpur Airport",
                            "Mumbai Airport",
                            "Delhi Airport",
                            "Nagpur Airport",
                            "Chennai Airport",
                            "Kolkata Airport",
                            "Madras Airport",
                            "Kanpur Airport",
                            "Raipur Airport",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _location = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: FlatButton(
                  color: Color(0xff376AFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  splashColor: Colors.white.withAlpha(40),
                  child: Text(
                    'Show Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              Divider(),
            ],
          ),
        ));
  }
}
