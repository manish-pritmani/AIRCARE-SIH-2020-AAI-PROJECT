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
    'What is this app',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed '),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking'),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking'),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking'),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking'),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking\n'),
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