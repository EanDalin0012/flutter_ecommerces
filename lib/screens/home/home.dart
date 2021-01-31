import 'package:ecommerces/screens/cart/cart.dart';
import 'package:ecommerces/screens/home/home_container.dart';
import 'package:ecommerces/screens/menu/menu.dart';
import 'package:ecommerces/screens/notification/notification.dart';
import 'package:ecommerces/screens/sign_in/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _titleBar = 'Home';
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeContainerScreen(),
    CartScreen(),
    MenuScreen(),
    MenuScreen(),
  ];

  Color _backgroundColor = Colors.white;

  List<NavigationItem> _listNavigationItem = [
    NavigationItem(Icon(Feather.home),Text('Home'), Colors.deepPurpleAccent),
    NavigationItem(Icon(Icons.favorite_border),Text('Favorite'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.search),Text('Search'),Colors.amberAccent),
    NavigationItem(Icon(Icons.person_outline),Text('Profile'),Colors.cyanAccent)
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        print('data');
      },
      child: Scaffold(
          appBar: _appBar(),
          body: _widgetOptions.elementAt(_selectedIndex),
          backgroundColor: Colors.white,
          bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  AppBar _appBar(){
    return AppBar(
      title: Text(_titleBar),
      centerTitle: true,
      backgroundColor: Colors.purple[900],
      elevation: 0,
      leading: new Container(),
      actions: <Widget>[
        Stack(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              child: Container(
                height: 80,
                padding: EdgeInsets.only(
                    top: 5,
                    right: 10,
                    left: 10
                ),
                child: Icon(Icons.notifications),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.only(
                  left: 6,
                  top: 1
              ),
              margin: EdgeInsets.only(
                  top: 7,
                  left: 20
              ),
              child: Text('2', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          },
          child: Container(
            height: 40,
            padding: EdgeInsets.only(
                top: 7,
                right: 5,
                left: 5
            ),
            margin: EdgeInsets.only(
                right: 5
            ),
            child: Icon(Icons.logout),
          ),
        ),
      ],
    );
  }

  Container _body() {
    return Container(
      child: Text('Text'),
    );
  }

  Container _bottomNavigationBar() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _listNavigationItem.map((e) {
          var itemIndex = _listNavigationItem.indexOf(e);
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = itemIndex;
              });
            },
            child: _widgetBuildItem(e, _selectedIndex == itemIndex)
          );
        }).toList()
      ),
    );
  }

  Widget _widgetBuildItem(NavigationItem navigationItem, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 270),
      width: isSelected ? 125: 50,
      height: double.maxFinite,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected ? BoxDecoration(color: navigationItem.color, borderRadius: BorderRadius.all(Radius.circular(50))): null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                  data: IconThemeData(size: 25, color: isSelected ? _backgroundColor: Colors.black),
                  child: navigationItem.icon
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: isSelected ? DefaultTextStyle(style: TextStyle(color: _backgroundColor), child: navigationItem.title) : Container(),
              )
            ],
          ),
        ],
      )
    );
  }

}

class NavigationItem {
  final Icon icon;
  final Text title;
  Color color;
  NavigationItem(this.icon, this.title,this.color);
}
