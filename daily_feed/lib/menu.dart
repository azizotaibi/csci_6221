import 'package:daily_feeds/pages/about.dart';
import 'package:daily_feeds/pages/docs.dart';
import 'package:daily_feeds/pages/tracker.dart';
import 'package:daily_feeds/views/homeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class Menu extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<Menu> {
int _PagesNumber = 0;

final tabs = [
    Home(),
    Tracker(),
    Docs(),
    About()
  ];

  @override
  Widget build(BuildContext context) {
    
    return (Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 46.0,
          items: <Widget>[
            Icon(Icons.home, size: 20, ),
            Icon(Icons.blur_circular, size: 20),
            Icon(Icons.pages, size: 20),
            Icon(Icons.dvr, size: 20),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.redAccent,
          animationCurve: Curves.ease,
          animationDuration: Duration(milliseconds: 200),
          onTap: (int index){
            setState((){
              _PagesNumber = index;
            });
          },
        ),
        body: tabs[_PagesNumber])
            );
              
}
}



