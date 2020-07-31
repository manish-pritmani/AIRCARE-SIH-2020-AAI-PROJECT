import 'package:sih/flight_book/air_asia_bar.dart';
import 'package:sih/flight_book/content_card.dart';
import 'package:sih/flight_book/rounded_button.dart';
import 'package:flutter/material.dart';

class FlightBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AirAsiaBar(height: 210.0),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 40.0),
              child: new Column(
                children: <Widget>[
                  _buildButtonsRow(),
                  Expanded(child: ContentCard()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          new RoundedButton(text: "ONE WAY"),
          new RoundedButton(text: "ROUND"),
          new RoundedButton(text: "MULTICITY", selected: true),
        ],
      ),
    );
  }
}
