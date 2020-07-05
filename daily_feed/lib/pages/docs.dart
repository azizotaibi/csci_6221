import 'package:daily_feeds/helpers/data.dart' as docs;
import 'package:daily_feeds/models/docsModel.dart' ;
import 'package:flutter/material.dart';



class Docs extends StatefulWidget {

  @override
  _DocsState createState() => _DocsState();
}

class _DocsState extends State<Docs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      


      appBar: AppBar(
        bottom: PreferredSize(
            child: Container(
              color: Colors.redAccent,
              height: 3.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset(
            'images/logo.png',
            fit: BoxFit.cover,
            height: 40.0,
          )
        ]),
        //centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          
          Stack(
            //alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(color: Colors.white,height: 22.0,
              ),
              Container(padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0), 
              height: (MediaQuery.of(context).size.height) / 8,
              width: MediaQuery.of(context).size.width / 1,
              child: Column(children: <Widget>[
                  Text("CDC Guidelines ",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w600),),
                  Text("\nBelow are the necessary guideline from Centers for Disease Control and Prevention (CDC) for preventing the spread of the Coronavirus.",style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w600),),

              ],),
              
                        decoration:BoxDecoration(borderRadius:BorderRadius.circular(0.0) ,color: Colors.black87,) )
            
            ],
          ),
          
          Expanded(child: Container(
            
            color: Colors.white,
            child: ListView.builder(
              itemBuilder: (context,index){
                 return  DocsModel(docs.getDocuments()[index]);
              },
              itemCount: docs.getDocuments().length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            ),
            
          )),
        ],
    ),
      )            
      );
  }
}





