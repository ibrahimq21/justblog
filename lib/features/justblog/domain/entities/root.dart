



import 'package:justblog/features/justblog/data/models/justblog_models.dart';

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




}