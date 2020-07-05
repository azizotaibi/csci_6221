import 'package:flutter/cupertino.dart';

import 'package:daily_feeds/models/docss.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launched;

Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
await launch(url, forceWebView: false);  } else {
  throw 'Could not launch $url';  }
}
class DocsModel  extends StatefulWidget{
  final Docs doc;

  const DocsModel (this.doc,{Key key, }) : super(key: key);
  @override
  State<StatefulWidget> createState() =>_DocsModelState();
}

  class _DocsModelState extends State<DocsModel>
{

  @override
  Widget build(BuildContext context) {
     Docs doc =widget.doc;
     return Expanded(child: Container(
       margin: const EdgeInsets.all(15.0),
  padding: const EdgeInsets.all(3.0),
  decoration: BoxDecoration(
  border: Border.all(color: Colors.black),
  borderRadius: BorderRadius.circular(12),
  color: Colors.white,
  boxShadow: [
      BoxShadow(
              color: Colors.grey[300],
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                1.0, // Move to right 10  horizontally
                1.0, // Move to bottom 10 Vertically
              ),
            )
    ],

  ),
  

            child: new InkWell(
        onTap: () {
          _launched = _launchInBrowser(doc.url);
        },
      
       child:Padding(
         padding: EdgeInsets.all(8.0),
       child: ListTile(
         leading: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 4.0),
           
           child: Container(
             
         
               child: ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.network(doc.countryPic,width: 50.0,height: 50.0,))
              ),
         ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(doc.countrylanguage,style: TextStyle(inherit: true,fontWeight: FontWeight.w700,fontSize: 16.0),)],
           ),
       
       ),
     ))));
  }
  
}

