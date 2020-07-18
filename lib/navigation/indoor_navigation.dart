import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mapwize/mapwize.dart';

import 'dart:typed_data';


class MapViewExample extends StatelessWidget {

  MapwizeMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text(
              "Navigate Airport",
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                fontFamily: "Circular",
              ),
            )),
        body: Column(children: [
          Expanded(
              flex: 3,
              child: MapwizeMap(
                apiKey: "MapwizeDevAPIKEY", //This is a demo API KEY that CANNOT be used for production.
                centerOnVenueId: "56b20714c3fa800b00d8f0b5",
                onMapCreatedCallback: _onMapViewCreated,
                onMapLoadedCallback: _onMapLoaded,
                onMapClickCallback: _onMapClick,
                onFloorsChangeCallback: _onFloorsChanged,
                onFloorChangeCallback: _onFloorChanged,
                onVenueEnterCallback: _onVenueEnter,
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new FlatButton(
                onPressed: _addLineAndMarker,
                child: new Icon(Icons.add),
              ),
              new FlatButton(
                onPressed: _removeLineAndMarker,
                child: new Icon(Icons.delete),
              ),
            ],
          ),

        ]));
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller.addImage(name, list);
  }

  void _addLineAndMarker() async {
    controller.setFloor(3);
    SymbolOptions options = SymbolOptions(
        geometry: LatLng(10.0, 10.0),
        iconImage: "assets/shop.png",
        iconSize: 3
    );
    Symbol s = await this.controller.addSymbol(options);
    LineOptions lineOptions = LineOptions(
        geometry: <LatLng>[LatLng(0.0, 0.0), LatLng(10.0, 10.0)],
        lineColor: "#C51586"
    );
    debugPrint("$lineOptions");
    this.controller.addLine(lineOptions);
  }

  void _removeLineAndMarker() async {
    this.controller.clearSymbols();
    this.controller.clearLines();
  }

  void _onMapViewCreated(MapwizeMapController controller) {
    debugPrint("On map view created");
    this.controller = controller;
  }

  void _onMapLoaded() {
    debugPrint("On map loaded");
    addImageFromAsset("assetImage", "assets/custom-icon.png");
  }

  void _onMapClick(LatLngFloor llf) {
    debugPrint("On map click $llf");
  }

  void _onFloorsChanged(List<Floor> floors) {
    debugPrint("On floors changed $floors");
  }

  void _onFloorChanged(Floor floor) {
    debugPrint("On floor changed $floor");
  }

  void _onVenueEnter(Venue venue) {
    debugPrint("on venue enter ${venue.name}");
  }
}