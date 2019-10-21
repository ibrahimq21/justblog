import 'package:justblog/features/justblog/data/models/author.dart';
import 'package:justblog/features/justblog/data/models/items.dart';
import 'package:justblog/features/justblog/data/models/root.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiService {
  static String _url = "https://infiloopers-justblog.000webhostapp.com/json";

  static Future<Author> getAuthor(int index) async {
    List<Items> root = await getItems();

    Author author = root[index].author;

    return author;
  }

  static Future<List<Items>> getItems() async {
    Root root = await getRoot();

    List<Items> items = root.items;

    return items;
  }

  static Future<Root> getRoot() async {
    final res = await http.get(_url);

    try {
      if (res.statusCode == 200) {
        var responceJson = convert.jsonDecode(res.body);

        Root root = Root.fromJson(responceJson);
        return root;
      } else {
        return null;
      }
    } catch (ex) {
      print(ex.toString());
    }
    return null;
  }
}
