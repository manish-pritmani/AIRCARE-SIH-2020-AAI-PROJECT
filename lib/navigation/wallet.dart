import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:sih/features/wifi.dart';


class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      _tabController = TabController(vsync: this, length: 4);
    }

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.account_balance_wallet,
            color: Colors.black,
          ),
          title: Text(
            "One Wallet",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,
              fontFamily: "Circular",
            ),
          )
      ),
      body: Container(
//        color: Color(0xFFbdc3c7),
//        width: MediaQuery.of(context).size.width,
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
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "32,452",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900
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
                            color: Colors.white,
                            onPressed: (){},
                            icon: Icon(Icons.add, color: Color(0xFF2ecc71),),
                            label: Text("Add Money"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          RaisedButton.icon(
                            elevation: 0,
                            color: Colors.white,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => {},
                    padding: EdgeInsets.all(10.0),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(LineIcons.money),
                        SizedBox(height: 5,),
                        Text("Send Money")
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => {},
                    padding: EdgeInsets.all(10.0),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(LineIcons.bell),
                        SizedBox(height: 5,),
                        Text("Notifications")
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => {},
                    padding: EdgeInsets.all(10.0),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(LineIcons.gift),
                        SizedBox(height: 5,),
                        Text("Won Rewards")
                      ],
                    ),
                  ),
//                  Container(
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(5),
//                      color: Colors.orangeAccent
//                    ),
//                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//                    child: IconButton(icon: Icon(LineIcons.gift), onPressed: (){}),
//                  ),
//                  Container(
//                    decoration: BoxDecoration(
//                      color: Color(0xFF303960),
//                      borderRadius: BorderRadius.circular(16),
//                    ),
//                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                    child: Text(
//                      "TRANSFER AMOUNT",
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 16,
//                          fontWeight: FontWeight.bold
//                      ),
//                    ),
//                  ),
                ],
              ),
             _tabSection(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(
              labelColor: Colors.black,
              indicatorColor: Color(0xff0437D6),
              tabs: [
                Tab(
                  text: "Transaction",
                ),
                Tab(
                  text: "Promotion",
                ),
          ]),
        ),
        Container(
          //Add this to give height
          height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
            Container(
              child: Column(
                children: <Widget> [
                  SizedBox(height: 5,),
                  ListView.separated(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 85.0),
                        child: Divider(),
                      );
                    },
                    padding: EdgeInsets.zero,
                    itemCount: getPaymentsCard().length,
                    itemBuilder: (BuildContext context, int index) {
                      return PaymentCardWidget(
                        payment: getPaymentsCard()[index],
                      );
                    },
                  ),
                ]
              )
            ),
            Container(
                child: Column(
                  children: <Widget>[
                    TabContentStructure.createContent(context, 'PROMOTION'),
                    TabContentStructure.createContent(context, 'LUCKY DRAW'),
                  ],
                )
            ),
          ]),
        ),
      ],
    ),
  );
}

class PaymentCardWidget extends StatefulWidget {
  final PaymentModel payment;

  const PaymentCardWidget({Key key, this.payment}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentCardWidgetState();
}

class _PaymentCardWidgetState extends State<PaymentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        dense: true,
        trailing: Text(
          "${widget.payment.type > 0 ? "+" : "-"} ${widget.payment.amount}",
          style: TextStyle(
              inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Material(
            elevation: 1,
            shape: CircleBorder(),
            shadowColor: widget.payment.color.withOpacity(0.4),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: widget.payment.color,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Icon(
                  widget.payment.icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           Expanded(child:  Text(
             widget.payment.name,
             style: TextStyle(
                 inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
           ),)
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.payment.date,
                  style: TextStyle(
                      inherit: true, fontSize: 12.0, color: Colors.black45)),
              SizedBox(
                width: 20,
              ),
              Text(widget.payment.hour,
                  style: TextStyle(
                      inherit: true, fontSize: 12.0, color: Colors.black45)),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentModel {
  IconData _icon;
  String _name, _date, _hour;
  Color _color;
  double _amount;
  int _paymentType;

  PaymentModel(this._icon, this._color, this._name, this._date, this._hour,
      this._amount, this._paymentType);

  String get name => _name;

  String get date => _date;

  String get hour => _hour;

  double get amount => _amount;

  int get type => _paymentType;

  IconData get icon => _icon;

  Color get color => _color;
}

List<PaymentModel> getPaymentsCard() {
  List<PaymentModel> paymentCards = [
    PaymentModel(Icons.add_circle_outline, Colors.green, "Added Money in Wallet",
        "23 June 2020", "20.04 AM", 251.40, 1),
    PaymentModel(Icons.receipt, Color(0xFFff415f), "Transfer To Mihir Bhasin",
        "19 June 2020", "14.30 PM", 64.80, -1),
    PaymentModel(Icons.hotel, Colors.deepOrange, "Restroom Charges",
        "15 June 2020", "10.04 PM", 115.00, -1),
    PaymentModel(Icons.train, Color(0xFF50f3e2), "Train ticket to Turkey", "07-23",
        "13 June 2020", 37.00, -1),
  ];

  return paymentCards;
}