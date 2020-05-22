import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return MaterialApp (
      title: "Daiy News",
      home: Scaffold(
        appBar: AppBar(
          title: Text ("Latest News"),
          centerTitle: true,
          backgroundColor: Colors.amber
        ,),
      body: Text ("Loading News ..."),
      )
    );
  }  


} 
