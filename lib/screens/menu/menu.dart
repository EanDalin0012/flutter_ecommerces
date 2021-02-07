import 'package:ecommerces/shares/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key key}) : super(key: key);

  Size size;
  var numItems = 20;
  var _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      body: Column(
          children: <Widget>[
            Container(
              width: size.width,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Row(
                children: <Widget>[
                  Text('dte')
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Row(
                children: <Widget>[
                  Text('dte')
                ],
              ),
            )
          ],
      ),
    );
  }

  AppBar _appBar(){
    return AppBar(
      centerTitle: true,
      title: Text('Product', style: TextStyle(color: Color(0xff324558))),
      backgroundColor: Colors.white,
    );
  }
  
  
  Container _setting() {
    return Container(
      height: 20,
      width: size.width,
      decoration: BoxDecoration(
        border: Border(
//            bottom: BorderSide( //                   <--- left side
//              color: Colors.black,
//              width: 3.0,
//            )
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Feather.home,
            color: kGoodPurple,
            size: 25,
          ),
          Text('Data')
        ],
      ),
    );
  }
}
