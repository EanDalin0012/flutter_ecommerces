import 'package:ecommerces/shares/components/cached_network_image.dart';
import 'package:ecommerces/shares/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key key}) : super(key: key);

  Size size;
  var numItems = 20;
  var _biggerFont = TextStyle(fontSize: 18.0);
  var logo = '';
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _container(context),
            ListTile(title: Text("KYC Form"), leading: Icon(Icons.info),),
            ListTile(title: Text("My Bookings"), leading: Icon(FontAwesomeIcons.calendarDay),),
            ListTile(title: Text("My Purchases"), leading: Icon(FontAwesomeIcons.listOl),),
            ListTile(title: Text("Transaction Limits"), leading: Icon(FontAwesomeIcons.chartLine),),
            ListTile(title: Text("Coupan"), leading: Icon(Icons.card_giftcard),),
            Divider(),
            ListTile(title: Text("Play Khalti Quiz"), leading: Icon(FontAwesomeIcons.brain),),
            ListTile(title: Text("Khalti Points"), leading: Icon(FontAwesomeIcons.coins),),
            Divider(),
            ListTile(title: Text("Settings"), leading: Icon(Icons.settings),),
            ExpansionTile(
              backgroundColor: Colors.grey.shade100,
              title: Text("Help & Support"),
              leading: Icon(Icons.headset_mic),
              children: <Widget>[
                ListTile(title: Text("FAQ"),),
                ListTile(title: Text("Contact Us"),),
                ListTile(title: Text("Feedback"),),
              ],
            ),
            ListTile(title: Text("About"), leading: Icon(Icons.info),),
            ListTile(title: Text("Logout"), leading: Icon(Icons.exit_to_app),),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60.0,),
              color: Colors.grey.shade200,
              child: Text("2.20.00"),
            )
          ]
      )
      )
    );
  }

  AppBar _appBar(){
    return AppBar(
      centerTitle: true,
      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: const Icon(Icons.arrow_back, color: Colors.red,),
      //       onPressed: () {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      //       },
      //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //     );
      //   },
      // ),
      title: Text('Product', style: TextStyle(color: Color(0xff324558))),
      backgroundColor: Colors.white,
    );
  }

  Container _container(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 50),
      // height: 170,
      color: Colors.purple,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              onTap: (){},
              leading: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ImageNetWorkCached('http://static1.squarespace.com/static/5f3a9e2015992d4d3b07334e/5f9978562a20b21cc2d29eee/5f9978562a20b21cc2d29ef1/1604415820585/google_logo.png?format=1500w'),
                  ),
                  Positioned(
                      bottom: -5,
                      right: -5,
                      child: Icon(Icons.remove_circle, color: Colors.red,))
                ],
              ),
              title: Text("Damodar Lohani",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
              ),),
              subtitle: Text("981151121", style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white
              ),),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 75.0),
            //   child: Text.rich(TextSpan(
            //       children: [
            //         TextSpan(text: "Rs "),
            //         TextSpan(text: "0", style: TextStyle(
            //             fontSize: 24.0
            //         ))
            //       ]
            //   ), style: TextStyle(color: Colors.white),),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 75.0),
            //   child: Text.rich(TextSpan(
            //       children: [
            //         TextSpan(text: "KP "),
            //         TextSpan(text: "0", style: TextStyle(
            //             fontSize: 20.0
            //         ))
            //       ]
            //   ), style: TextStyle(color: Colors.white),),
            // ),
          ]
      )
    );
  }

}
