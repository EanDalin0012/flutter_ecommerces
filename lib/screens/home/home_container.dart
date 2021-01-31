import 'package:flutter/material.dart';

class HomeContainerScreen extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainerScreen> {
  var colorTabsText = Colors.black54;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          body: _appBar(),
        ),
    );
  }

  Container _appBar(){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: _tabBar(),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      indicatorColor: Colors.red,
      tabs: <Widget>[
        Tab(
          child: Container(
            child: Text('HOME',style: TextStyle(color: colorTabsText, fontSize: 18.0)),
          ),
        ),
        Tab(
          child: Container(child: Text('GAMES',style: TextStyle(color: colorTabsText, fontSize: 18.0),)
        ),
        ),
        Tab(
          child: Container(
            child: Text(
              'MOVIES',
              style: TextStyle(color: colorTabsText, fontSize: 18.0),
            ),
          ),
        ),
        Tab(
          child: Container(
            child: Text(
              'BOOK',
              style: TextStyle(color: colorTabsText, fontSize: 18.0),
            ),
          ),
        ),
        Tab(
          child: Container(
            child: Text(
              'MUSIC',
              style: TextStyle(color: colorTabsText, fontSize: 18.0),
            ),
          ),
        ),
      ],
    );
  }
}
