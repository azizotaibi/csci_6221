import 'dart:convert';
import 'package:daily_feed/news_models/feed.dart';
import 'package:http/http.dart' as http_package;

class webservice {

Future<List<Feed>> retrievedFeed () async {

  String url = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-04-21&sortBy=publishedAt&apiKey=b8852569455c49b3ac3758c3dbb89081";

  final resonse = await http_package.get(url);

  if (resonse.statusCode == 200) {
      final result = jsonDecode(resonse.body);
      int totalResult = result("totalResults");
      Iterable list = [totalResult,result("articles")]; 
      return list.map((post) => Feed.fromJSON(post)).toList();
      
  } else {
    
    throw Exception("Can not connect to the news server");

  }




} 

}