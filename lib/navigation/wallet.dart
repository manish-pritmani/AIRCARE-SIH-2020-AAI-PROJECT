import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
          leading: Icon(
            Icons.account_balance_wallet,
            color: Colors.black,
          ),
          title: Text(
            "ONE Wallet",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Circular",
            ),
          )
      ),
      body: Container(
        color: Color(0xFFbdc3c7),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(


          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Container(
                  child: Column(
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Current Balance",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "ONE PAY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text(
                              "IN 32,452",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF2ecc71),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              child: Text(
                                "VIP USER",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Last Spend : 5,458",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton.icon(
                            elevation: 0,
                            onPressed: (){},
                            icon: Icon(Icons.add, color: Color(0xFF2ecc71),),
                            label: Text("Add Money"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          RaisedButton.icon(
                            elevation: 0,
                            onPressed: (){},
                            icon: Icon(Icons.view_headline, color: Color(0xff3498db),),
                            label: Text("Recent Spends"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff0437D6),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff0437D6),
                        Color(0xff4A00E0),
                      ],
                    ),
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[


                    Expanded(
                      child: RaisedButton.icon(
                        onPressed: (){},
                        icon: Icon(FontAwesomeIcons.levelUpAlt, color: Color(0xff3498db),),
                        label: Text("Send"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    SizedBox(width: 20,),

                    Expanded(
                      child: RaisedButton.icon(
                        elevation: 0,
                        onPressed: (){},
                        icon: Icon(Icons.add, color: Color(0xFF2ecc71),),
                        label: Text("Add Money"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,),
                alignment: Alignment.topLeft,
                child: Text("Currency", style: TextStyle(fontSize: 22,),),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffecf0f1),
                          child: Icon(FontAwesomeIcons.bitcoin, color: Color(0xFFf1c40f),),
                        ),
                        title: Text("Bitcoin"),
                        trailing: Text("\$8,000"),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffecf0f1),
                          child: Icon(FontAwesomeIcons.ethereum, color: Color(0xFF2980b9),),
                        ),
                        title: Text("Ethereum"),
                        trailing: Text("\$450"),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffecf0f1),
                          child: Icon(FontAwesomeIcons.euroSign, color: Color(0xff2ecc71),),
                        ),
                        title: Text("Euro"),
                        trailing: Text("\$99"),
                      ),
                    ),

                  ],
                ),
              ),


              SizedBox(height: 100,),


            ],
          ),
        ),
      ),
    );
  }
}

