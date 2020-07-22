//import 'package:covynew/bookmark.dart';
//import 'package:progress_indicators/progress_indicators.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:async';
//import 'dart:convert';
//import 'package:pull_to_refresh/pull_to_refresh.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:url_launcher/url_launcher.dart' as url_launcher;
//import 'package:content_placeholder/content_placeholder.dart';
//import 'package:async/async.dart';
//import 'package:chips_choice/chips_choice.dart';
//
//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//List bookmark=[];
//
//class _HomeState extends State<Home> {
//  @override
//  void initState() {
//    _getData();
//    super.initState();
//  }
//
//  Future<Null> _openInWebView(String url, String title) async {
//    if (await url_launcher.canLaunch(url)) {
//      Navigator.of(context).push(
//        MaterialPageRoute(
//          maintainState: false,
//          // **Note**: if got "ERR_CLEARTEXT_NOT_PERMITTED", modify
//          // AndroidManifest.xml.
//          // Cf. https://github.com/flutter/flutter/issues/30368#issuecomment-480300618
//          builder: (ctx) => WebviewScaffold(
//            withLocalStorage: true,
//            withJavascript: true,
//            useWideViewPort: true,
//            appCacheEnabled: true,
//            debuggingEnabled: true,
//            scrollBar: true,
//            initialChild: SizedBox.expand(
//              child: Container(
//                color: Colors.white,
//                child: Text("Loading"),
//              ),
//            ),
////            initialChild: Center(
////              child: JumpingDotsProgressIndicator(fontSize: 20.0,),
////            ),
//            url: url,
//            appBar: AppBar(
//              backgroundColor: Theme.of(context).brightness == Brightness.dark
//                  ? Color(0xff121212)
//                  : Colors.white,
//              title: Text(
//                title,
//                style: TextStyle(
//                  color: Theme.of(context).brightness == Brightness.dark
//                      ? Colors.white
//                      : Colors.black,
//                  fontSize: 18,
//                  fontFamily: "Circular",
//                ),
//              ),
//              automaticallyImplyLeading: false,
//              leading: IconButton(
//                  tooltip: 'Settings',
//                  icon: Icon(
//                    Icons.close,
//                    color: Theme.of(context).brightness == Brightness.dark
//                        ? Colors.white
//                        : Colors.black,
//                  ),
//                  onPressed: () {
//                    Navigator.pop(context);
//                  }),
//              actions: <Widget>[
//                IconButton(
//                  color: Theme.of(context).brightness == Brightness.dark
//                      ? Colors.white
//                      : Colors.black,
//                  icon: Icon(Icons.bookmark_border),
//                  tooltip: 'Stack',
//                  onPressed: () {
////          Navigator.push(
////              context,
////              MaterialPageRoute(
////                  builder: (BuildContext context) => SearchBar()));
//                  },
//                ),
//                IconButton(
//                    tooltip: 'Settings',
//                    icon: Icon(
//                      Icons.refresh,
//                      color: Theme.of(context).brightness == Brightness.dark
//                          ? Colors.white
//                          : Colors.black,
//                    ),
//                    onPressed: () {}),
//                const SizedBox(width: 10.0),
//              ],
////            backgroundColor: Colors.white,
////              iconTheme: IconThemeData(color: Colors.black),
//            ),
////            bottomNavigationBar: BottomAppBar(
////              //   color: Colors.white,
////              child: new Row(
////                mainAxisSize: MainAxisSize.max,
////                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                children: <Widget>[
////                  FlatButton.icon(
////                    icon: Icon(Icons.bookmark_border),
////                    //      color: Colors.white,
////                    label: Text("Bookmark"),
////                    onPressed: () {},
////                  ),
////                  FlatButton.icon(
////                    icon: Icon(
////                      Icons.arrow_back,
////                    ),
////                    label: Text("Back"),
////                    onPressed: () {
////                      Navigator.pop(context);
////                    },
////                  ),
////                ],
////              ),
////            ),
//          ),
//        ),
//      );
//    } else {
//      Scaffold.of(context).showSnackBar(
//        SnackBar(
//          content: Text('URL $url can not be launched.'),
//        ),
//      );
//    }
//  }
//
//  RefreshController _refreshController =
//  RefreshController(initialRefresh: false);
//
//  void _onRefresh() async {
//    _getData();
//    // monitor network fetch
//    await Future.delayed(Duration(milliseconds: 2000));
//    // if failed,use refreshFailed()
//    _refreshController.refreshCompleted();
//  }
//
//  void _onLoading() async {
//    // monitor network fetch
//    await Future.delayed(Duration(milliseconds: 2000));
//    // if failed,use refreshFailed()
//    _refreshController.refreshCompleted();
//  }
//
//  Map newsData;
//  int tag = 1;
//  List<String> options = [
//    'India',
//    'WHO',
//    'Govt. of India',
//    'USA',
//    'Coronavirus',
//    'covid19',
//    'PM Care Fund',
//  ];
//
//  final AsyncMemoizer _newsMemorize = AsyncMemoizer();
//
//  Future _getData() {
//    return _newsMemorize.runOnce(() async {
//      //    http.Response response = await http.get(
////        'http://newsapi.org/v2/everything?q=coronavirus&sortBy=publishedAt&apiKey=be2af482d9ec44d0ab772da2723713e5&language=en');
//      http.Response response = await http.get(
//          "http://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=be2af482d9ec44d0ab772da2723713e5");
//      newsData = json.decode(response.body);
//      List userData = newsData["articles"];
//      userData.removeWhere((m) => m["description"] == null);
//      userData.removeWhere((m) => m["description"] == "");
////    userData.removeWhere((m) => m["author"] == null);
////    userData.removeWhere((m) => m["author"] == "");
////    userData.removeWhere((m) => m["source"] == null);
////    userData.removeWhere((m) => m["source"] == "");
//      return userData;
//    });
//  }
//  Widget createNewsListView(BuildContext context, AsyncSnapshot snapshot) {
//    List userData = snapshot.data;
//    return ListView.builder(
//      itemCount: userData == null ? 0 : userData.length,
//      physics: BouncingScrollPhysics(),
//      itemBuilder: (BuildContext context, int index) {
//        return Card(
//          color: Theme.of(context).brightness == Brightness.dark
//              ? Color(0xff121212)
//              : Colors.white,
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(5.0),
//          ),
//          elevation: 4,
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              const SizedBox(height: 10.0),
//              ListTile(
//                title: Text(
//                  '${userData[index]["title"]}',
//                  style: TextStyle(
//                    fontSize: 19,
//                    fontWeight: FontWeight.bold,
//                    fontFamily: "Circular",
//                  ),
//                ),
//                subtitle: Text(
//                  "Published on : ${userData[index]["publishedAt"]}",
//                ),
//              ),
//              Card(
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(10.0),
////                  borderRadius: BorderRadius.circular(10.0),
//                ),
//                color: Colors.grey.shade300,
//                elevation: 1,
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    ClipRRect(
//                      borderRadius: BorderRadius.circular(5.0),
//                      child: Image.network("${userData[index]["urlToImage"]}",
//                          width: 325, height: 150, fit: BoxFit.fill),
//                    ),
//                  ],
//                ),
//              ),
//              const SizedBox(height: 10.0),
//              SizedBox(
//                width: 310,
//                child: Text(
//                  "${userData[index]["description"]}",
//                  style: TextStyle(
//                    fontSize: 15,
//                    fontWeight: FontWeight.w500,
//                    fontFamily: "Circular",
//                  ),
//                ),
//              ),
//              const SizedBox(height: 10.0),
//              SizedBox(
//                width: 310,
//                child: Text(
//                  "Source : ${userData[index]["source"]["name"]}",
//                  style: TextStyle(
//                    fontSize: 14,
//                    fontFamily: "Circular",
//                  ),
//                ),
//              ),
//              SizedBox(
//                width: 310,
//                child: Text(
//                  "Author : ${userData[index]["author"]}",
//                  style: TextStyle(
//                    fontSize: 14,
//                    fontFamily: "Circular",
//                  ),
//                ),
//              ),
//              const SizedBox(height: 10.0),
//              SizedBox(
//                width: double.infinity,
//                // height: double.infinity,
//                child: Container(
//                    padding: EdgeInsets.all(2),
//                    decoration: new BoxDecoration(
//                        color: Theme.of(context).brightness == Brightness.dark
//                            ? Color(0xff121212)
//                            : Color(0xff323edd),
//                        borderRadius: new BorderRadius.only(
//                            bottomLeft: const Radius.circular(5.0),
////                            topLeft:  const  Radius.circular(5.0),
////                            topRight: const  Radius.circular(5.0),
//                            bottomRight: const Radius.circular(5.0))),
//                    child: Row(
//                      mainAxisSize: MainAxisSize.max,
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: <Widget>[
//                        FlatButton.icon(
//                          icon: Icon(Icons.bookmark_border),
//                          textColor: Colors.white,
//                          label: Text(
//                            "Add to Stack",
//                            style: TextStyle(
//                              fontFamily: "Circular",
//                            ),
//                          ),
//                          onPressed: () {
//                            bookmark.add(["${userData[index]["title"]}","${userData[index]["urlToImage"]}","${userData[index]["url"]}","${userData[index]["publishedAt"]}",]);
//                            print(bookmark);
//                          },
//                        ),
//                        FlatButton.icon(
//                          icon: Icon(Icons.open_in_new),
//                          textColor: Colors.white,
//                          label: Text(
//                            "Read Now",
//                            style: TextStyle(
//                              fontFamily: "Circular",
//                            ),
//                          ),
//                          onPressed: () {
//                            _openInWebView("${userData[index]["url"]}",
//                                "${userData[index]["title"]}");
////                            Navigator.push(
////                              context,
////                              MaterialPageRoute(builder: (context) => MyHomePage()),
////                            );
//                          },
//                        ),
//                      ],
//                    )),
//              ),
//            ],
//          ),
//        );
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        children: <Widget>[
//          ChipsChoice<int>.single(
//            value: tag,
//            options: ChipsChoiceOption.listFrom<int, String>(
//              source: options,
//              value: (i, v) => i,
//              label: (i, v) => v,
//            ),
//            onChanged: (val) => setState(() => tag = val),
//          ),
//          Expanded(
//            child: FutureBuilder(
//              future: _getData(),
//              builder: (BuildContext context, AsyncSnapshot snapshot) {
//                switch (snapshot.connectionState) {
//                  case ConnectionState.none:
//                  case ConnectionState.waiting:
//                    return Center(
//                      child: CupertinoActivityIndicator(),
//                    );
////              return SingleChildScrollView(
////                child: Padding(
////                  padding: EdgeInsets.all(15),
////                  child: Column(
////                    crossAxisAlignment: CrossAxisAlignment.stretch,
////                    children: <Widget>[
//////                      Builder(builder: (context) {
//////                        return SectionHolder(
//////                          placeholder: ContentPlaceholder(
//////                            context: context,
//////                            child: Column(
//////                              children: <Widget>[
//////                                Row(
//////                                  crossAxisAlignment: CrossAxisAlignment.start,
//////                                  children: <Widget>[
//////                                    ContentPlaceholder.block(
//////                                      width: 100,
//////                                      height: 100,
//////                                      rightSpacing: 10,
//////                                    ),
//////                                    Column(
//////                                      crossAxisAlignment: CrossAxisAlignment.start,
//////                                      children: <Widget>[
//////                                        ContentPlaceholder.block(
//////                                          width:
//////                                          MediaQuery.of(context).size.width - 150,
//////                                          height: 25,
//////                                        ),
//////                                        ContentPlaceholder.block(
//////                                          width: MediaQuery.of(context).size.width / 2,
//////                                          height: 25,
//////                                        ),
//////                                        ContentPlaceholder.block(
//////                                          width: 80,
//////                                          height: 30,
//////                                        ),
//////                                      ],
//////                                    ),
//////                                  ],
//////                                ),
//////                              ],
//////                            ),
//////                          ),
//////                        );
//////                      }),
////                      Builder(builder: (context) {
////                        return SectionHolder(
////                          placeholder: ContentPlaceholder(
////                            context: context,
////                            child: Column(
////                              children: <Widget>[
////                                Column(
////                                  crossAxisAlignment: CrossAxisAlignment.start,
////                                  children: <Widget>[
////                                    ContentPlaceholder.block(
////                                      width: double.infinity,
////                                      height: 30,
////                                    ),
////                                    ContentPlaceholder.block(
////                                      width: double.infinity,
////                                      height: 150,
////                                    ),
////                                    ContentPlaceholder.block(
////                                      width: double.infinity,
////                                      height: 70,
////                                    ),
////                                    Row(
////                                      crossAxisAlignment: CrossAxisAlignment.center,
////                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                                      children: <Widget>[
////                                        ContentPlaceholder.block(
////                                          width: MediaQuery.of(context).size.width /2.5,
////                                          height: 35,
////                                        ),
////                                        ContentPlaceholder.block(
////                                          width: MediaQuery.of(context).size.width / 2.5,
////                                          height: 35,
////                                        ),
////                                      ],
////                                    ),
////                                  ],
////                                ),
////                              ],
////                            ),
////                          ),
////                        );
////                      }),
////                      Builder(builder: (context) {
////                        return SectionHolder(
////                          placeholder: ContentPlaceholder(
////                            context: context,
////                            child: Column(
////                              children: <Widget>[
////                                Column(
////                                  crossAxisAlignment: CrossAxisAlignment.start,
////                                  children: <Widget>[
////                                    ContentPlaceholder.block(
////                                      width: double.infinity,
////                                      height: 30,
////                                    ),
////                                    ContentPlaceholder.block(
////                                      width: double.infinity,
////                                      height: 150,
////                                    ),
////                                    ContentPlaceholder.block(
////                                      width: double.infinity,
////                                      height: 70,
////                                    ),
////                                    Row(
////                                      crossAxisAlignment: CrossAxisAlignment.center,
////                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                                      children: <Widget>[
////                                        ContentPlaceholder.block(
////                                          width: MediaQuery.of(context).size.width / 3,
////                                          height: 25,
////                                        ),
////                                        ContentPlaceholder.block(
////                                          width: MediaQuery.of(context).size.width / 3,
////                                          height: 25,
////                                        ),
////                                      ],
////                                    ),
////                                  ],
////                                ),
////                              ],
////                            ),
////                          ),
////                        );
////                      }),
////                      Builder(builder: (context) {
////                        return SectionHolder(
////                          placeholder: ContentPlaceholder(
////                            context: context,
////                            child: Column(
////                              children: <Widget>[
////                                Column(
////                                  crossAxisAlignment: CrossAxisAlignment.start,
////                                  children: <Widget>[
////                                    ContentPlaceholder.block(
////                                      width: double.infinity,
////                                      height: 30,
////                                    ),
////                                    ContentPlaceholder.block(
////                                      width: double.infinity,
////                                      height: 150,
////                                    ),
////                                    ContentPlaceholder.block(
////                                      width: double.infinity,
////                                      height: 70,
////                                    ),
////                                    Row(
////                                      crossAxisAlignment: CrossAxisAlignment.center,
////                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                                      children: <Widget>[
////                                        ContentPlaceholder.block(
////                                          width: MediaQuery.of(context).size.width / 3,
////                                          height: 25,
////                                        ),
////                                        ContentPlaceholder.block(
////                                          width: MediaQuery.of(context).size.width / 3,
////                                          height: 25,
////                                        ),
////                                      ],
////                                    ),
////                                  ],
////                                ),
////                              ],
////                            ),
////                          ),
////                        );
////                      }),
////                    ],
////                  ),
////                ),
////              );
////              return Container(
//////                padding: EdgeInsets.all(50),
//////                color: Colors.white,
////                child: Column(
////                  mainAxisAlignment: MainAxisAlignment.center,
////                  crossAxisAlignment: CrossAxisAlignment.center,
////                  children: <Widget>[
////                    SectionHolder(
////                      label: 'Normal',
////                      placeholder: ContentPlaceholder(),
////                    ),
////                    Builder(builder: (context) {
////                      return SectionHolder(
////                        label: 'Global',
////                        placeholder: ContentPlaceholder(
////                          context: context,
////                          child: Column(
////                            children: <Widget>[
////                              Column(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////                                children: <Widget>[
////                                  ContentPlaceholder.block(
////                                    width: double.infinity,
////                                    height: 30,
////                                  ),
////                                  ContentPlaceholder.block(
////                                    width: double.infinity,
////                                    height: 150,
////                                  ),
////                                  ContentPlaceholder.block(
////                                    width: double.infinity,
////                                    height: 70,
////                                  ),
////                                  Row(
////                                    crossAxisAlignment: CrossAxisAlignment.center,
////                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                                    children: <Widget>[
////                                      ContentPlaceholder.block(
////                                        width: MediaQuery.of(context).size.width / 3,
////                                        height: 25,
////                                      ),
////                                      ContentPlaceholder.block(
////                                        width: MediaQuery.of(context).size.width / 3,
////                                        height: 25,
////                                      ),
////                                    ],
////                                  ),
////                                ],
////                              ),
////                            ],
////                          ),
////                        ),
////                      );
////                    }),
////                    Image.asset("assets/news_loader.gif"),
////                    SizedBox(height: 10),
//////                    Builder(builder: (context) {
//////                      return SectionHolder(
//////                        label: 'Grouped',
//////                        placeholder: ContentPlaceholder(
//////                          context: context,
//////                          child: Column(
//////                            children: <Widget>[
//////                              Row(
//////                                crossAxisAlignment: CrossAxisAlignment.start,
//////                                children: <Widget>[
//////                                  ContentPlaceholder.block(
//////                                    width: 100,
//////                                    height: 100,
//////                                    rightSpacing: 10,
//////                                  ),
//////                                  Column(
//////                                    crossAxisAlignment: CrossAxisAlignment.start,
//////                                    children: <Widget>[
//////                                      ContentPlaceholder.block(
//////                                        width:
//////                                        MediaQuery.of(context).size.width - 150,
//////                                        height: 25,
//////                                      ),
//////                                      ContentPlaceholder.block(
//////                                        width: MediaQuery.of(context).size.width / 2,
//////                                        height: 25,
//////                                      ),
//////                                      ContentPlaceholder.block(
//////                                        width: 80,
//////                                        height: 30,
//////                                      ),
//////                                    ],
//////                                  ),
//////                                ],
//////                              ),
//////                            ],
//////                          ),
//////                        ),
//////                      );
//////                    }),
////                    Text(
////                      "Give us a sec",
////                      style: TextStyle(
//////                        color: Colors.black,
////                        fontWeight: FontWeight.bold,
////                        fontFamily: "Merriweather",
////                        fontSize: 18,
////                      ),
////                    ),
////                    Text(
////                      "We are collecting things for you",
////                      style: TextStyle(
//////                        color: Colors.black,
////                      ),
////                    ),
////                  ],
////                ),
////              );
//                  default:
//                    if (snapshot.hasError)
//                      return Container(
//                        padding: EdgeInsets.all(50),
//                        color: Colors.white,
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Image.asset("assets/error.png"),
//                            SizedBox(height: 10),
//                            Text(
//                              "Something went wrong !",
//                              style: TextStyle(
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold,
//                                fontFamily: "Circular",
//                                fontSize: 18,
//                              ),
//                            ),
//                            Text(
//                              "Brace yourself till we get the error fixed.",
//                              style: TextStyle(
//                                color: Colors.black,
//                                fontFamily: "Circular",
//                              ),
//                            ),
//                            Text(
//                              "You may check the internet connection.",
//                              style: TextStyle(
//                                fontFamily: "Circular",
//                                color: Colors.black,
//                              ),
//                            ),
//                          ],
//                        ),
//                      );
//                    else
//                      return SmartRefresher(
//                        enablePullDown: true,
//                        enablePullUp: true,
//                        header: WaterDropHeader(),
//                        footer: CustomFooter(
//                          builder: (BuildContext context, LoadStatus mode) {
//                            Widget body;
//                            if (mode == LoadStatus.idle) {
//                              body = Text("Pull up to Load");
//                            } else if (mode == LoadStatus.loading) {
//                              body = CupertinoActivityIndicator();
//                            } else if (mode == LoadStatus.failed) {
//                              body = Text("Load Failed! Click retry!");
//                            } else if (mode == LoadStatus.canLoading) {
//                              body = Text("Release to load more");
//                            } else {
//                              body = Text("No more Data");
//                            }
//                            return Container(
//                              height: 55.0,
//                              child: Center(child: body),
//                            );
//                          },
//                        ),
//                        controller: _refreshController,
//                        onRefresh: _onRefresh,
//                        onLoading: _onLoading,
//                        child: createNewsListView(context, snapshot),
//                      );
//                }
//              },
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class SectionHolder extends StatelessWidget {
//  final ContentPlaceholder placeholder;
//
//  SectionHolder({
//    @required this.placeholder,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
////        Text(this.label, style: Theme.of(context).textTheme.headline),
//        SizedBox(height: 10),
//        this.placeholder,
//        SizedBox(height: 20),
//      ],
//    );
//  }
//}
//
