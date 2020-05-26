import 'dart:convert';

import 'package:daily_feeds/models/feedModel.dart';
import 'package:http/http.dart' as http;

class Feeds{

  List<FeedModel> feeds = [];
  Future<void> getFeeds() async{
    String urlTopNews = "http://newsapi.org/v2/top-headlines?q=corona&apiKey=b8852569455c49b3ac3758c3dbb89081";

    var result = await http.get(urlTopNews);
    var jsonData = jsonDecode(result.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['title'] != null){

          FeedModel feedModel = FeedModel(
            author: element["author"],
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            //publishedAt: element['publishedAt'],
            content: element['content']
          );
          feeds.add(feedModel);
        }
      });
    }
  }

}