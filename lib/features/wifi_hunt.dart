import'package:flutter/material.dart';
import 'package:android_wifi_info/android_wifi_info.dart';

class MyAppWifi extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppWifi> {
  // Public methods
  Future<String> bssid;
  // TODO: detailedStateOf
  Future<int> frequency;
  Future<bool> ssidHidden;
  Future<int> ipAddress;
  Future<int> linkSpeed;
  Future<String> macAddress;
  Future<int> networkId;
  Future<int> rssi;
  Future<int> rxLinkSpeedMbps;
  Future<String> ssid;
  // TODO: supplicantState
  // Future<SupplicantState> supplicantState;
  Future<int> txLinkSpeedMbps;
  // Constants
  Future<String> frequencyUnits;
  Future<String> linkSpeedUnits;

  @override
  void initState() {
    fireAllFutures();
    super.initState();
  }

  fireAllFutures() {
    setState(() {
      // Public methods
      bssid = AndroidWifiInfo.bssid;
      frequency = AndroidWifiInfo.frequency;
      ssidHidden = AndroidWifiInfo.ssidHidden;
      ipAddress = AndroidWifiInfo.ipAddress;
      linkSpeed = AndroidWifiInfo.linkSpeed;
      macAddress = AndroidWifiInfo.macAddress;
      networkId = AndroidWifiInfo.networkId;
      rssi = AndroidWifiInfo.rssi;
      rxLinkSpeedMbps = AndroidWifiInfo.rxLinkSpeedMbps;
      ssid = AndroidWifiInfo.ssid;
      txLinkSpeedMbps = AndroidWifiInfo.txLinkSpeedMbps;
      // Constants
      frequencyUnits = AndroidWifiInfo.frequencyUnits;
      linkSpeedUnits = AndroidWifiInfo.linkSpeedUnits;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: fireAllFutures,
              )
            ],
            title: Text(
              'android_wifi_info',
              style: TextStyle(
                fontFamily: 'monospace',
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Colors.lightGreen,
          ),
          body: ListView(
            children: <Widget>[
              // PUBLIC METHODS
              buildFutureListTile(
                future: bssid,
                name: 'bssid',
                description: Column(
                  children: <Widget>[
                    TText(
                        'Basic service set identifier (BSSID) of the current access point.'),
                    TText(
                        'Returns BSSID, in the form of a six-byte MAC address: XX:XX:XX:XX:XX:XX'),
                    TText(
                        'The BSSID may be null if there is no network currently connected.')
                  ],
                ),
                type: 'String',
              ),
              // TODO: detailedStateOf
              buildFutureListTile(
                  future: frequency,
                  name: 'frequency',
                  description: Column(
                    children: <Widget>[TText('Current WiFi frequency in MHz')],
                  ),
                  type: 'int'),
              buildFutureListTile(
                future: ssidHidden,
                name: 'ssidHidden',
                description: Column(
                  children: <Widget>[
                    TText('Shows whether the current network is hidden.'),
                    TText(
                        'true if this network does not broadcast its SSID, so an SSID-specific probe request must be used for scans.')
                  ],
                ),
                type: 'bool',
              ),
              buildFutureListTile(
                future: ipAddress,
                name: 'ipAddress',
                description: Column(
                  children: <Widget>[
                    TText('IP Address.'),
                  ],
                ),
                type: 'int',
              ),
              buildFutureListTile(
                future: linkSpeed,
                name: 'linkSpeed',
                description: Column(
                  children: <Widget>[
                    TText('Current link speed in Mbps.'),
                  ],
                ),
                type: 'int',
              ),
              buildFutureListTile(
                future: macAddress,
                name: 'macAddress',
                description: Column(
                  children: <Widget>[
                    TText('MAC Address'),
                    TText(
                        'Using these device identifiers is not recommended other than for high value fraud prevention and advanced telephony use-cases. For advertising use-cases, use AdvertisingIdClient\$Info#getId and for analytics, use InstanceId#getId.'),
                    // TODO: links
                  ],
                ),
                type: 'String',
              ),
              buildFutureListTile(
                future: networkId,
                name: 'networkId',
                description: Column(
                  children: [
                    TText('Network ID.'),
                    TText(
                        'Each configured network has a unique small integer ID, used to identify the network when performing operations on the supplicant. This method returns the ID for the currently connected network.')
                  ],
                ),
                type: 'int',
              ),
              buildFutureListTile(
                future: rssi,
                name: 'rssi',
                description: Column(
                  children: [
                    TText('Received Signal Strength Indicator.'),
                    TText(
                        'Returns the received signal strength indicator of the current 802.11 network, in dBm.')
                  ],
                ),
                type: 'int',
              ),
              /*
              buildFutureListTile(
                future: rxLinkSpeedMbps,
                name: 'rxLinkSpeedMbps',
                description: Column(
                  children: [Text('Current receive link speed in Mbps.')],
                ),
                type: 'int',
              ), */
              buildFutureListTile(
                future: ssid,
                name: 'ssid',
                description: Column(
                  children: <Widget>[
                    TText(
                        'Service set identifier (SSID aka WiFi Name) of the current 802.11 network.'),
                  ],
                ),
                type: 'String',
              ),
              // TODO: supplicantState
              /*
              buildFutureListTile(
                future: txLinkSpeedMbps,
                name: 'txLinkSpeedMbps',
                description: Column(
                  children: [
                    Text(
                        'Current transmit link speed in [linkSpeedUnits] (Mbps).')
                  ],
                ),
                type: 'int',
              ),*/
              // CONSTANTS
              buildFutureListTile(
                future: frequencyUnits,
                name: 'frequencyUnits',
                description: Column(
                  children: <Widget>[
                    TText(
                        'The unit in which frequency measurements expressed in this API.'),
                    TText('Constant Value: "MHz".'),
                    TText(
                        'As it\'s constant value, it doesn\'t really make much sense to call it all the time, but as the package decided to provide an interface to the WifiInfo class, frequencyUnits is also part of the API.'),
                  ],
                ),
                type: 'String',
              ),
              buildFutureListTile(
                future: linkSpeedUnits,
                name: 'linkSpeedUnits',
                description: Column(
                  children: <Widget>[
                    TText('The unit in which links speeds are expressed.'),
                    TText('Constant Value: "Mbps".'),
                    TText(
                        'As it\'s constant value, it doesn\'t really make much sense to call it all the time, but as the package decided to provide an interface to the WifiInfo class, linkSpeedUnits is also part of the API.'),
                  ],
                ),
                type: 'linkSpeedUnits',
              ),
            ],
          ));
  }

  Widget buildFutureListTile({
    @required Future future,
    @required String name,
    @required Widget description,
    @required String type,
  }) {
    List<Widget> expansionTileChildren = [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('Type: '),
            Text(type, style: TextStyle(fontFamily: 'monospace')),
          ],
        ),
      ),
      Padding(padding: EdgeInsets.all(8.0), child: description),
    ];
    final nameWidget = Text(
      '$name ',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'monospace',
      ),
    );

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        final titleWidget = Row(children: <Widget>[
          nameWidget,
          Text(
            '${snapshot.data}',
            style: TextStyle(fontFamily: 'monospace'),
          ),
        ]);
        if (snapshot.hasError) {
          return ExpansionTile(
            leading: Icon(Icons.error, color: Colors.red),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(type, style: TextStyle(fontFamily: 'monospace')),
                Text(name),
                Text(snapshot.error)
              ],
            ),
            children: [description, Text(snapshot.error)],
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return Text('active');
          case ConnectionState.done:
            return ExpansionTile(
              leading: snapshot.hasData
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.error_outline, color: Colors.orange),
              title: titleWidget,
              children: expansionTileChildren,
            );
          case ConnectionState.none:
            return ExpansionTile(
              leading: Icon(Icons.help_outline, color: Colors.red),
              title: titleWidget,
              children: expansionTileChildren,
            );
          case ConnectionState.waiting:
            return ExpansionTile(
              leading: Icon(Icons.hourglass_empty, color: Colors.grey[400]),
              title: titleWidget,
              children: expansionTileChildren,
            );
        }
      },
    );
  }
}

class TText extends StatelessWidget {
  final text;

  TText(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: Container(child: Text(text, textAlign: TextAlign.left)),
  );
}