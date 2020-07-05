import 'package:daily_feeds/helpers/feeds.dart';
import 'package:daily_feeds/models/feedModel.dart';
import 'package:daily_feeds/views/postView.dart';
import 'package:flutter/material.dart';

class CountryView extends StatefulWidget {
  final String country;
  final bool isSource;
  final String searchKeywords;
  CountryView({this.country, this.isSource, this.searchKeywords});

  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  List<FeedModel> feeds = new List<FeedModel>();
  bool _loading = true; //underscore makes the variable private to lib

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryFeeds();
  }

  getCountryFeeds() async {
    CountryFeeds feed = CountryFeeds();
    print(widget.searchKeywords);
    await feed.getCountryFeeds(widget.country, widget.isSource, widget.searchKeywords);
    feeds = feed.feeds;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        title: Text(widget.country.toUpperCase()),
        centerTitle: false,
      
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    //News Feed
                    Container(
                      padding: EdgeInsets.only(
                        top: 5,
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
            borderRadius: new BorderRadius.circular(10.0), color: Colors.white,
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