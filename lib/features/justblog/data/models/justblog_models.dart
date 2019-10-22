


import 'package:justblog/features/justblog/domain/entities/justblog.dart';
import 'package:meta/meta.dart';
class JustBlogModel extends JustBlog{



  JustBlogModel({@required String version,
    @required String user_comment,
    @required String home_page_url,
    @required String feed_url,
    @required String title,
    @required String description,
    @required List<Items> items}): super(version: version, user_comment: user_comment, home_page_url: home_page_url, feed_url: feed_url, title: title, description: description, items: items );


  factory JustBlogModel.fromJson(Map<String, dynamic> json){


    var list = json['items'] as List;

    List<Items> itemList = list.map((i) => Items.fromJson(i)).toList();



    return JustBlogModel(

        version : json['varsion'] as String,
        user_comment : json['user_comment']  as String,

        home_page_url : json['home_page_url'] as String,

        feed_url : json['feed_url'] as String,

        title : json['title'] as String,

        description : json['description'] as String,

        items: itemList


    );
  }



  Map<String, dynamic> toJson(){


    return{
      'version': version,
      'user_comment': user_comment,
      'home_page_url': home_page_url,
      'feed_url': feed_url,
      'title': title,
      'description': description,
      'items': items

    };


  }


}


class Items{

  String id;
  String url;
  String title;
  String content_html;
  String content_text;
  String date_published;
  String date_modified;
  Author author;
  String image;

  Items({this.id, this.url, this.title, this.content_html, this.content_text,
    this.date_published, this.date_modified, this.author, this.image});


  factory Items.fromJson(Map<String, dynamic> json){

    return Items(
      id : json['id'],
      url : json['url'],
      title : json['title'],
      content_html : json['content_html'],
      content_text : json['content_text'],
      date_published : json['date_published'],
      date_modified : json['date_modified'],
      author : Author.fromJson(json['author']),
      image: json['image'] as String,

    );
  }


}

class Author{
  String name;
  String url;
  String avatar;

  Author({this.name, this.url, this.avatar});


  factory Author.fromJson(Map<String, dynamic> json){
    return Author(
      name : json['name'],
      url : json['url'],
      avatar : json['avatar'],
    );
  }


}