import 'dart:convert';

import 'package:daily_feeds/models/feedModel.dart';
import 'package:http/http.dart' as http;

class Feeds{

  String keyword='coronavirus OR corona OR covid-19';
  List<FeedModel> feeds = [];
  Future<void> getFeeds() async{
    String urlTopNews = "https://newsapi.org/v2/everything?q=$keyword&apiKey=b8852569455c49b3ac3758c3dbb89081";

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

class CountryFeeds{

  
  
  List<FeedModel> feeds = [];
  Future<void> getCountryFeeds(String country, bool isSource, String searchKeywords) async{
    String urlTopNews;
    if(isSource == false){

      String keyword='coronavirus OR corona OR covid-19 AND ' + country;
      urlTopNews = "https://newsapi.org/v2/everything?qInTitle=$keyword&language=en&apiKey=b8852569455c49b3ac3758c3dbb89081";
    }
    else{

      String keyword='coronavirus OR corona OR covid-19';
      urlTopNews = "https://newsapi.org/v2/everything?qInTitle=$keyword&language=en&domains=$searchKeywords&apiKey=b8852569455c49b3ac3758c3dbb89081";
    }
    print("$country and $isSource and $searchKeywords");

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