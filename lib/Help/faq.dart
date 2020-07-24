import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
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
            "Frequently Asked Questions",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Circular",
            ),
          )),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}


// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'When canceling the flight can we get our money back or refund?',
    <Entry>[
      Entry('Full amount will not be refundable. But some amount(as per the company guidelines)will be refunded.\n'),
    ],
  ),
  Entry(
    'How do passengers get to know the recovery of their left/lost belongings in the aircraft or at the airport?',
    <Entry>[
      Entry('In case passengers have lost/left behind any articles in the aircraft, they may contact the concerned airline. In case passengers have lost/left behind any articles at the airport, they may contact the Terminal Manager. \n'),
    ],
  ),
  Entry(
    'Where do I get "real-time" flight information?',
    <Entry>[
      Entry('Click on the flight  button in the main menu.Click on flight status.\n'),
    ],
  ),
  Entry(
    'We have a long Airport layover and need to find food, a drugstore & buy some gifts. Where?',
    <Entry>[
      Entry('You are at the right place! Type help in the chatbot for more information. \n'),
    ],
  ),
  Entry(
    'What is an Airport Code?',
    <Entry>[
      Entry('Every airport has a unique three-letter identifier to streamline the process of tracking the millions of airport data transmitted daily--from flight plans to weather reports.\n'),
    ],
  ),
  Entry(
    'Where can I wait for arriving passengers inside the Terminal?',
    <Entry>[
      Entry('Meet your arriving passengers in the terminal baggage claim area or at terminal curbside.You can also ask for a gate pass at the airline ticket counter, but there is no guarantee you will be issued one, or that security will allow you to pass.\n'),
    ],
  ),
  Entry(
    'Is there any Child Care lounge facility at the airport?',
    <Entry>[
      Entry('For the privacy of mothers who wish to nurse their infants, a well-equipped Child Care Lounge with toys, baby cot is available at all terminals.\n'),
    ],
  ),
  Entry(
    'What is the definition of Unaccompanied Minor Passenger? Is a Parent allowed to accompany a child during check-in?',
    <Entry>[
      Entry('An unaccompanied minor is a child without the presence of a legal guardian. This term is used in immigration law and in airline policies. The specific definition varies from country to country and from airline to airline. Please check with the airline for further information.\n'),
    ],
  ),
  Entry(
    'What are the facilities available for special needs?',
    <Entry>[
      Entry('Airport offers barrier free access for passengers. There are reserved parking slots, ramps & special rest rooms for passengers with special needs.\n'),
    ],
  ),
  Entry(
    'If I travel, what steps should I take to help reduce my chances of getting sick?',
    <Entry>[
      Entry('a- Clean your hands often. \nb- Avoid touching your eyes, nose, or mouth with unwashed hands.\nc- Avoid close contact with others.\nd- Wear a cloth face covering in public.\ne- Cover coughs and sneezes.\n'),
    ],
  ),
  Entry(
    'Is there any Child Care lounge facility at the airport?',
    <Entry>[
      Entry('For the privacy of mothers who wish to nurse their infants, a well-equipped Child Care Lounge with toys, baby cot is available at all terminals.\n'),
    ],
  ),
  Entry(
    'What Happens If a Co-passenger Tests Positive for COVID-19?',
    <Entry>[
      Entry('In this case, one passenger tested positive and others were tested negative and were sent to home quarantine.\n'),
    ],
  ),
  Entry(
    'What will happen if I don’t have Aarogya Setu, but have a valid ticket?',
    <Entry>[
      Entry('If you do not have the government contact tracing app, you will need to provide a self-declaration form. There is no clarity whether the Aarogya Setu app is mandatory or not, although the written order says it is.\n'),
    ],
  ),
  Entry(
    'Is Wi-Fi facility available at the airport?',
    <Entry>[
      Entry('We have option to searh for the nearby wifi and airport supported wifi by turning on the location and searching wifi in the WiFi-availability section.\n'),
    ],
  ),
  Entry(
    'Does the airport have any medical facility?',
    <Entry>[
      Entry('In the event of a medical emergency, well trained doctors and paramedics are available from the emergency treatment centre run by the Hospital. These doctors and paramedics are available round the clock.\n'),
    ],
  ),
  Entry(
    'The coupons will be validated or can we use it any time?',
    <Entry>[
      Entry('No,the coupons have validity dates.\n'),
    ],
  ),
  Entry(
    'If the coupons are not validated then how many times one coupon can be used?',
    <Entry>[
      Entry('you can use the coupons only for one time.\n'),
    ],
  ),
  Entry(
    'When canceling the flight can we get our money back or refund?',
    <Entry>[
      Entry('Full amount will not be refundable. But some amount(as per the company guidelines)will be refunded.\n'),
    ],
  ),
  Entry(
    'What if our taxi gets late then  there will be some refund or compromisation?',
    <Entry>[
      Entry('By chance this condition arrives then proper inquiry will be done.\n'),
    ],
  ),
  Entry(
    'What Happens If a Co-passenger Tests Positive for COVID-19?',
    <Entry>[
      Entry('In this case, one passenger tested positive and others were tested negative and were sent to home quarantine.\n'),
    ],
  ),
  Entry(
    'What is the definition of Unaccompanied Minor Passenger? Is a Parent allowed to accompany a child during check-in?',
    <Entry>[
      Entry('An unaccompanied minor is a child without the presence of a legal guardian. This term is used in immigration law and in airline policies. The specific definition varies from country to country and from airline to airline. Please check with the airline for further information.\n'),
    ],
  ),
  Entry(
    'What if I have a cold or flu, will I still be allowed to travel?',
    <Entry>[
      Entry('No,you are not allowed to travel in such a case. If you show any symptoms, you’ll be sent to a special quarantine facility.\n'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}