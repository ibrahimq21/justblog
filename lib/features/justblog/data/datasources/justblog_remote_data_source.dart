import 'dart:convert';

import 'package:justblog/core/error/exceptions.dart';
import 'package:justblog/features/justblog/data/models/justblog_models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
abstract class JustBlogRemoteDataSource{

  Future<JustBlogModel> getListOfPages();


  Future<JustBlogModel> getConcretePages(String search);



}



class JustBlogRemoteDataSourceImpl implements JustBlogRemoteDataSource{



  final http.Client client;



  JustBlogRemoteDataSourceImpl({@required this.client});






  @override
  Future<JustBlogModel> getConcretePages(String search) {
    // TODO: implement getConcretePages
    return _getBlogFromUrl('https://infiloopers-justblog.000webhostapp.com/json/?s=$search');
  }

  @override
  Future<JustBlogModel> getListOfPages() {
    // TODO: implement getListOfPages
    return _getBlogFromUrl('https://infiloopers-justblog.000webhostapp.com/json');
  }



  Future<JustBlogModel> _getBlogFromUrl(String url)async{


    final response = await client.get(url, headers: {'Content-Type': 'application/json'});

    if(response.statusCode == 200){


      return JustBlogModel.fromJson(json.decode(response.body));
    }else{

      throw ServerException();
    }



  }





}