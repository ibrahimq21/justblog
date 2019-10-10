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

  Items(this.id, this.url, this.title, this.content_html, this.content_text,
      this.date_published, this.date_modified, this.author);


}