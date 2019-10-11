
import 'package:justblog/model/items.dart';

class Root{

  String version;
  String user_comment;
  String home_page_url;
  String feed_url;
  String title;
  String description;
  List<Items> items;

  Root({this.version, this.user_comment, this.home_page_url, this.feed_url,
      this.title, this.description, this.items});


  factory Root.fromJson(Map<String, dynamic> json){


    var list = json['items'] as List;

    List<Items> itemList = list.map((i) => Items.fromJson(i)).toList();



    return Root(

      version : json['varsion'] as String,
      user_comment : json['user_comment']  as String,

      home_page_url : json['home_page_url'] as String,

      feed_url : json['feed_url'] as String,

      title : json['title'] as String,

      description : json['description'] as String,

      items: itemList


    );
  }


}