import 'package:justblog/model/author.dart';

class Items{

  String id;
  String url;
  String title;
  String content_html;
  String content_text;
  String date_published;
  String date_modified;
  Author author;

  Items({this.id, this.url, this.title, this.content_html, this.content_text,
    this.date_published, this.date_modified, this.author});


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
    );
  }


}