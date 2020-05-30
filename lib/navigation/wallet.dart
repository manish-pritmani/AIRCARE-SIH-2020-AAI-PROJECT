import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.card_giftcard),
            color: Colors.black,
          ),
          title: Text(
            "Wallet",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Circular",
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton.icon(onPressed: null, icon: Icon(Icons.add), label: Text("Add Money")),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'BALANCE',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "\$3,020.09",
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FlatButton.icon(onPressed: null, icon: Icon(Icons.add), label: Text("Add Money")),
            FlatButton.icon(onPressed: null, icon: Icon(Icons.add), label: Text("Add Money")),
            FlatButton.icon(onPressed: null, icon: Icon(Icons.add), label: Text("Add Money")),

          ],
        ),
      )
    );
  }
}

