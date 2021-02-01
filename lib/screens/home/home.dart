import 'package:ecommerces/screens/cart/cart.dart';
import 'package:ecommerces/screens/home/home_container.dart';
import 'package:ecommerces/screens/menu/menu.dart';
import 'package:ecommerces/screens/notification/notification.dart';
import 'package:ecommerces/screens/sign_in/sign_in.dart';
import 'package:ecommerces/shares/models/navigation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _titleBar = 'Home';
  int _selectedIndex = 0;
  var bottomNavigationBarActiveColor = Color(0xffFD6592);
  List<Widget> _widgetOptions = <Widget>[
    HomeContainerScreen('Home'),
    CartScreen(),
    MenuScreen(),
    MenuScreen(),
  ];

  Color _backgroundColor = Colors.white;

  List<NavigationItem> _listNavigationItem = [
    NavigationItem(Icon(Feather.home),Text('Home'), Colors.deepPurpleAccent),
    NavigationItem(Icon(Feather.message_circle),Text('Favorite'), Colors.pinkAccent),
    NavigationItem(Icon(Feather.shopping_cart),Text('Carts'),Colors.amberAccent),
    NavigationItem(Icon(Feather.user),Text('Profile'),Colors.deepPurpleAccent)
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        print('data');
      },
      child: Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          backgroundColor: Colors.white,
          bottomNavigationBar: _bottomNavigationBar1(),
      ),
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

  BottomNavigationBar _bottomNavigationBar1() {
  return BottomNavigationBar(
    currentIndex: _selectedIndex,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Feather.home),
        title: Text(""),
        activeIcon: Icon(Feather.home, color: bottomNavigationBarActiveColor)
      ),
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.folderOpen),
        title: Text(""),
        activeIcon: Icon(FontAwesomeIcons.folderOpen, color: bottomNavigationBarActiveColor)
      ),
      BottomNavigationBarItem(
        icon: Icon(Feather.shopping_cart),
        title: Text(""),
        activeIcon: Icon(Feather.shopping_cart, color: bottomNavigationBarActiveColor)
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.sort_rounded),
        title: Text(""),
        activeIcon: Icon(Icons.sort_rounded, color: bottomNavigationBarActiveColor)
      ),
    ],
    onTap: (index){
      setState(() {
        _selectedIndex = index;
      });
    },
  );
  }
}


