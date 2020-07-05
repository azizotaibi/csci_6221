import 'package:flutter/foundation.dart';

class Post {

final String country;
final int cases;
final int active;
final int recovered;
final int death;
final int critical;

  Post({@required this.country, @required this.cases, @required this.active, @required this.recovered, @required this.death,this.critical});


factory Post.fromJson (Map<String,dynamic> json){

return Post ( country:json['country'] as String ,
              active: json['active'] as int,
              cases: json['cases']as int,
               recovered: json['recovered']as int,
               death: json['death']as int,
               critical:json['critical']as int);
}



}