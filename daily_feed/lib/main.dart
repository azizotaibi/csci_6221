import 'package:flutter/material.dart';
import 'package:daily_feeds/views/homeView.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 230, 230, 230),
      ),
      home: Home(),
    );
  }
}

