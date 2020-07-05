import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeedView extends StatefulWidget {

final String feedUrl;
FeedView({this.feedUrl});

  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {

    final Completer<WebViewController> _completer = Completer<WebViewController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
      ),

      body: Container(
      child: WebView(
        initialUrl: widget.feedUrl,
        onWebViewCreated: ((WebViewController webViewController){
          _completer.complete(webViewController);
        }),
      ),
      
    )
  
    ); 
  }
}