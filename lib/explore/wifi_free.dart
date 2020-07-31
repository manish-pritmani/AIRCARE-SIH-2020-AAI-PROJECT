import 'package:wifi_flutter/wifi_flutter.dart';
import 'package:flutter/material.dart';

class MyWifiFree extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyWifiFree> {
  List<Widget> _platformVersion = [];

  @override
  void initState() {
    super.initState();
  }

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
          "Wifi",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontFamily: "Circular",
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, i) => _platformVersion[i],
          itemCount: _platformVersion.length,
        ),
      ),
      bottomNavigationBar:  Container(
        height: 56,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Color(0xfff9d56e),
                child: FlatButton(
                  child: Text("Search Now", style: TextStyle(fontSize: 17)),
                  onPressed: () async {
                    final noPermissions = await WifiFlutter.promptPermissions();
                    if (noPermissions) {
                      return;
                    }
                    final networks = await WifiFlutter.wifiNetworks;
                    setState(() {
                      _platformVersion = networks
                          .map((network) => Text(
                          "Network SSID ${network.ssid} - Strength ${network.rssi} - Secure ${network.isSecure} "))
                          .toList();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}