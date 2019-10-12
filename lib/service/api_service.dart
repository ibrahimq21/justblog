import 'package:justblog/model/items.dart';
import 'package:justblog/model/root.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiService {
  static String _url = "http://42.201.185.138/wordpress/feed/json/";



  static Future<List<Items>> getItems() async{


    Root root = await getRoot();

    List<Items> items = root.items;

    return items;

  }


  static Future<Root> getRoot() async {
    final res = await http.get(_url);


    try{
        if (res.statusCode == 200) {
        var responceJson = convert.jsonDecode(res.body);

        Root root = Root.fromJson(responceJson);
        return root;
      } else {
        return null;
      }
    } catch(ex){
      print(ex.toString());
    }
    return null;
  }
}
