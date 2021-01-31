import 'package:ecommerces/shares/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _setting(),
        ],
      ),
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
