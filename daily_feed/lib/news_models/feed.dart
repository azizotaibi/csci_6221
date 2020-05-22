class Feed {

  final String title;
  final String url_image;
  final String url;
  final String publish_data;


  Feed({this.title, this.url_image,this.url,this.publish_data});
  

  factory Feed.fromJSON(Map<String, dynamic>json) {

    return Feed (
      
      title: json["title"],
      url_image: json["urlToImage"],
      url: json ["url"],
      publish_data: json ["publishedAt"]    
    ); 


  }



}