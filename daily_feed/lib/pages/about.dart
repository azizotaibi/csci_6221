import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override

  
  Widget build(BuildContext context) {
   return new Scaffold(
        /* appBar: AppBar(
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "About",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        //centerTitle: true,
        elevation: 0.0,
      ),*/
      body: new Column(
        //child: new Image.asset('images/logo.png', fit: BoxFit.cover, height: 40.0,)
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new Column(
              children: <Widget>[
                new Image.asset('images/logo.png', fit: BoxFit.cover, height: 40.0,),
                new Text("\nCSCI-6221 Final Project, Summer 2020"),
                new Text("Prof. Walter Melo"),
                new Text("Abdulaziz Alotaibi, Osama Bajaber, Mohammed Alneyadi")
              ],
            ),
          )
          
        ],

      ),
      
    );
  }
}



