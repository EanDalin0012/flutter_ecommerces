import 'package:ecommerces/screens/products/product.dart';
import 'package:flutter/material.dart';

class HomeContainerScreen extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainerScreen> {
  var colorTabsText = Colors.black54;
  final List<Map> articles = [
    {
      "title": "How to Seem Like You Always Have Your Shot Together",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "Does Dry is January Actually Improve Your Health?",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "You do hire a designer to make something. You hire them.",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "How to Seem Like You Always Have Your Shot Together",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "How to Seem Like You Always Have Your Shot Together",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "Does Dry is January Actually Improve Your Health?",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "You do hire a designer to make something. You hire them.",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
    {
      "title": "How to Seem Like You Always Have Your Shot Together",
      "author": "Jonhy Vino",
      "time": "4 min read",
    },
  ];

  static final String path = "lib/src/pages/blog/bhome1.dart";
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Theme(
          data: _themeData(),
          child: _themeChild()
      ),
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(color: secondaryColor, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: secondaryColor),
        actionsIconTheme: IconThemeData(color: secondaryColor),
      ),
    );
  }

  Scaffold _themeChild() {
    return Scaffold(
      backgroundColor: Theme.of(context).buttonColor,
      appBar: _appBar(),
      body: TabBarView(
          children: <Widget>[
            Container(
              child: ProductScreen(),
            ),
            Container(
              child: Text("Tab 2"),
            ),
            Container(
              child: Text("Tab 3"),
            ),
            Container(
              child: Text("Tab 4"),
            ),
            Container(
              child: Text("Tab 5"),
            ),
          ]
      )
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Categories'),
      leading: Icon(Icons.category),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
      bottom: _tabBar(),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      isScrollable: true,
      labelColor: primaryColor,
      indicatorColor: primaryColor,
      unselectedLabelColor: secondaryColor,
        tabs: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("For You"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Design"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Beauty"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Education"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Entertainment"),
          ),
        ],
    );
  }
}
