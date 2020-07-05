import 'package:daily_feeds/helpers/data.dart';
import 'package:daily_feeds/helpers/feeds.dart';
import 'package:daily_feeds/models/countryModel.dart';
import 'package:daily_feeds/models/feedModel.dart';
import 'package:daily_feeds/views/countryView.dart';
import 'package:daily_feeds/views/postView.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CountryModel> countries = new List<CountryModel>();
  List<FeedModel> feeds = new List<FeedModel>();
  bool _loading = true; //underscore makes the variable private to lib

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countries = getCountries(); // retrieve categories from data.dart
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
      backgroundColor: Color.fromARGB(0, 254, 254, 254),
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
            ))
          : SingleChildScrollView(
              //if loaded
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    //Top List
                    Container(
                      height: 85,
                      child: ListView.builder(
                          itemCount: countries.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CountrySelection(
                              imageUrl: countries[index].imageUrl,
                              countryName: countries[index].countryName,
                              isSource: countries[index].isSource,
                              searchKeywords: countries[index].searchKeywords,
                            );
                          }),
                    ),

                    //News Feed
                    Container(
                      padding: EdgeInsets.only(
                        top: 0,
                      ),
                      child: ListView.builder(
                          itemCount: feeds.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsFeed(
                              thumbnail: feeds[index].urlToImage,
                              title: feeds[index].title,
                              description: feeds[index].description,
                              feedUrl: feeds[index].url,
                              //publishAt: feeds[index].publishedAt,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CountrySelection extends StatelessWidget {
  final imageUrl, countryName, isSource, searchKeywords;
  CountrySelection(
      {this.imageUrl, this.countryName, this.isSource, this.searchKeywords});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CountryView(
                      country: countryName.toLowerCase(),
                      isSource: isSource,
                      searchKeywords: searchKeywords,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 20,
          top: 10,
        ), //margin  to the right of the country pic
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.transparent,
            ),
            Container(
              margin: EdgeInsets.only(left: 5, top: 4),
              child: Text(countryName, style: TextStyle(color: Colors.black)),
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
  final String thumbnail, title, description, feedUrl;
  NewsFeed({this.thumbnail, this.title, this.description, this.feedUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                //push means to push a new activity on top of the current activity
                builder: (context) => FeedView(
                      feedUrl: feedUrl,
                    )));
      },
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            //background color of box
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
        margin: EdgeInsets.only(top: 0, bottom: 20),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(thumbnail)),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                description,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            //Text(publishAt)
          ],
        ),
      ),
    );
  }
}
