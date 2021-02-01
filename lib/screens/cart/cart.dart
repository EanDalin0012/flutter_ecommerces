import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<CartScreen> {
  var colorTabsText = Colors.black54;
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeData(),
      child: Scaffold(
        backgroundColor: Theme.of(context).buttonColor,
        appBar: _appBar(),
        body: Text('Cart'),
      ),
    );
  }

  AppBar _appBar(){
    return AppBar(
      title: Text('Home', style: TextStyle(color: Color(0xff324558)),),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
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
}
