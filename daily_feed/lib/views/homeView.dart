import 'package:daily_feeds/helpers/data.dart';
import 'package:daily_feeds/helpers/feeds.dart';
import 'package:daily_feeds/models/categoryModel.dart';
import 'package:daily_feeds/models/feedModel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<FeedModel> feeds = new List<FeedModel>();
  bool _loading = true; //underscore makes the variable private to lib

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories(); // retrieve categories from data.dart
    getFeeds();
  }

  getFeeds() async {
    Feeds feed = Feeds();
    await feed.getFeeds();
    feeds = feed.feeds;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "DailyFeeds",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        //centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Container(
              //if is still loading
              child: Container(
              child: Center(
                  child: SizedBox(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 212, 180, 167)),
                  backgroundColor: Colors.grey,
                ),
                height: 85.0,
                width: 85.0,
              )),
            )
            ) : SingleChildScrollView( //if loaded
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    
                    Container(
                      height: 85,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategorySelection(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),

                     Container(
                       child: ListView.builder(
                         itemCount: feeds.length,
                         shrinkWrap: true,
                         physics: ClampingScrollPhysics(),
                         itemBuilder: (context, index){
                           return NewsFeed(
                             thumbnail: feeds[index].urlToImage,
                             title: feeds[index].title,
                             description: feeds[index].description,
                             //publishAt: feeds[index].publishedAt,
                           );
                         } ),
                     )
                  ],
                ),
              ),
          ),
    );
  }
}

class CategorySelection extends StatelessWidget {
  final imageUrl, categoryName;
  CategorySelection({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          right: 20,
          top: 5,
        ), //margin  to the right of the category pic
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.transparent,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 5,
              ),
              child: Text(categoryName, style: TextStyle(color: Colors.cyan)),
            )
          ],
        ),
      ),
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 5,), //margin  to the right of the category pic
      child: Row(
        children: <Widget>[
          new Container(
            width: 90.0,
            height: 200.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                //fit: BoxFit.fill,
                image: new NetworkImage(imageUrl)
              )
            )
          ),
          new Container(
            child: Text(categoryName, style: TextStyle(
              color: Colors.cyan
            )),
          )
        ],
      ),
    );
  }
}
*/

class NewsFeed extends StatelessWidget {
  final String thumbnail, title, description;
  NewsFeed({this.thumbnail, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(thumbnail),
          Text(title),
          Text(description),
          //Text(publishAt)
        ],
      ),
    );
  }
}
