import 'package:ecommerces/screens/products/product.dart';
import 'package:flutter/material.dart';

class HomeContainerScreen extends StatefulWidget {
  final String title;
  HomeContainerScreen(this.title);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainerScreen> {

  var colorTabsText = Colors.black54;
  static final String path = "lib/src/pages/blog/bhome1.dart";
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  var newNotification = 2;

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

  AppBar _appBar(){
    return AppBar(
      title: Text(widget.title, style: TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.purple[900],
      elevation: 0,
      leading: Container(),
      actions: <Widget>[
        InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SignInScreen()),
            // );
          },
          child: Container(
            height: 40,
            width: 50,
            child: Icon(Icons.shopping_cart,color: Colors.white),
          ),
        ),
        Stack(
          children: <Widget>[
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => NotificationScreen()),
                // );
              },
              child: Container(
                height: 80,
                width: 40,
                child: Icon(Icons.notifications, color: Colors.white,),
              ),
            ),
            newNotification != 0 ? _notificationsVal(newNotification): Container()

          ],
        ),
        Container(
          width: 10,
        )
      ],
    );
  }


  Container _notificationsVal(int val) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(left: 20,top: 3),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(child: Text(val.toString(), style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500))),
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
