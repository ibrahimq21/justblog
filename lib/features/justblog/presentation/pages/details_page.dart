import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:justblog/core/util/date_util.dart';
import 'package:justblog/features/justblog/data/models/justblog_models.dart';



class DetailPage extends StatefulWidget {
  final int index;
  final Items items;
  final String title;

  const DetailPage({Key key, this.items, this.index, this.title})
      : super(key: key);

  _DetailPageState createState() =>
      _DetailPageState(this.items, this.index, this.title);
}

class _DetailPageState extends State<DetailPage> {
  int index;
  Items item;
  String title;

  _DetailPageState(this.item, this.index, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(6.0),
          child: ListView(
            children: <Widget>[
              Hero(
                tag: "${item.title}",
                child: _getImageNetwork("${item.image}"),
              ),
              _getBody("${item.title}", "${item.date_published}",
                  "${item.content_text}", "${item.author.name}", context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImageNetwork(String s) {
    return Container(
        height: 200.0,
        child: Image(image: NetworkImageWithRetry(s), fit: BoxFit.cover));
  }

  Widget _getBody(String title, String date, String description, String origin,
      BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          _getTitle(title),
          _getDate(date, origin),
          _getDescription(description),
          _getAntLink(),
          _getLink(context)
        ],
      ),
    );
  }

  Widget _getAntLink() {
    return new Container(
      margin: new EdgeInsets.only(top: 30.0),
      child: new Text(
        "Ful detail:",
        style:
            new TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),
      ),
    );
  }

  Widget _getLink(BuildContext context) {
    return new GestureDetector(
      child: new Text(
        "${item.url}",
        style: new TextStyle(color: Colors.blueAccent),
      ),
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }

  Widget _getDescription(String des) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Text(des),
    );
  }

  Widget _getTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    );
  }

  Widget _getDate(String date, String origin) {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            new DateUtil().buildDate(date),
            style: TextStyle(fontSize: 10.0, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}
