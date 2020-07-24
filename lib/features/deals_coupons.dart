import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:sih/features/wifi.dart';


class Coupon extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Coupon> with SingleTickerProviderStateMixin {
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
            Icons.arrow_back,
            color: Colors.black,
          ),
          title: Text(
            "Deals and Discounts",
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
              _tabSection(context)
            ],
          ),
        ),
      ),
    );
  }
}

var titleTextStyle = TextStyle(
  color: Colors.black87,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

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
                  text: "Deals and Offers",
                ),
                Tab(
                  text: "Coupon Codes",
                ),
              ]),
        ),
        Container(
          //Add this to give height
          height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
           SingleChildScrollView(
             child:  Container(
                 child: Column(
                     children: <Widget> [
                       Card(
                         elevation: 1.0,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(6.0),
                         ),
                         child: Stack(
                           children: <Widget>[
                             Column(
                               children: <Widget>[
                                 Container(
                                   height: 150.0,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.only(
                                         topLeft: Radius.circular(6.0),
                                         topRight: Radius.circular(6.0),
                                       ),
                                       image: DecorationImage(
                                         image: AssetImage("assets/8.jfif"),
                                         fit: BoxFit.cover,
                                       )),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(16.0),
                                   child: Text(
                                     "Get upto 25% off on your FIRST cab ride. USE CODE : FIRST25",
                                     style: titleTextStyle,
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                   child: Row(
                                     children: <Widget>[
                                       Text(
                                         "T&C Apply (For VIP User only)",
                                         style: TextStyle(
                                           color: Colors.grey,
                                           fontSize: 14.0,
                                         ),
                                       ),
                                       Spacer(),
                                       Text(
                                         "Valid till : 29 Aug",
                                         style: TextStyle(
                                           color: Colors.grey,
                                           fontSize: 14.0,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                                 const SizedBox(height: 20.0),
                               ],
                             ),
                             Positioned(
                               top: 140,
                               left: 10.0,
                               child:Container(
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
                             )
                           ],
                         ),
                       ),
                       Card(
                         elevation: 1.0,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(6.0),
                         ),
                         child: Stack(
                           children: <Widget>[
                             Column(
                               children: <Widget>[
                                 Container(
                                   height: 150.0,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.only(
                                         topLeft: Radius.circular(6.0),
                                         topRight: Radius.circular(6.0),
                                       ),
                                       image: DecorationImage(
                                         image: AssetImage("assets/5.jpg"),
                                         fit: BoxFit.cover,
                                       )),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(16.0),
                                   child: Text(
                                     "Shop on any duty free shop and get additional discount on payment using ONE WALLET.",
                                     style: titleTextStyle,
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                   child: Row(
                                     children: <Widget>[
                                       Text(
                                         "T&C Apply",
                                         style: TextStyle(
                                           color: Colors.grey,
                                           fontSize: 14.0,
                                         ),
                                       ),
                                       Spacer(),
                                       Text(
                                         "Valid till : 31st Dec",
                                         style: TextStyle(
                                           color: Colors.grey,
                                           fontSize: 14.0,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                                 const SizedBox(height: 20.0),
                               ],
                             ),
                             Positioned(
                               top: 140,
                               left: 10.0,
                               child:Container(
                                 decoration: BoxDecoration(
                                   color: Colors.redAccent,
                                   borderRadius: BorderRadius.circular(16),
                                 ),
                                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                 child: Text(
                                   "FREE USER",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 16,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ]
                 )
             ),
           ),
            Container(
                child: Column(
                  children: <Widget>[

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