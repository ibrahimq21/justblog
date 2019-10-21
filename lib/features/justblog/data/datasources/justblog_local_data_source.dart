import 'dart:convert';

import 'package:justblog/features/justblog/data/models/justblog_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class JustBlogLocalDataSource{





  Future<JustBlogModel> getLastConcretePage();


  Future<void> cacheJustBlog(JustBlogModel justBlogTocache);




}


const CACHED_JUST_BLOG = 'CACHED_JUST_BLOG';


class JustBlogLocalDataSourceImpl implements JustBlogLocalDataSource{

  final SharedPreferences sharedPreferences;



  JustBlogLocalDataSourceImpl({@required this.sharedPreferences});




  @override
  Future<void> cacheJustBlog(JustBlogModel justBlogTocache) {
    // TODO: implement cacheJustBlog
    return sharedPreferences.setString(CACHED_JUST_BLOG, json.encode(justBlogTocache.toJson()));
  }

  @override
  Future<JustBlogModel> getLastConcretePage() {
    // TODO: implement getLastConcretePage
    return null;
  }





}