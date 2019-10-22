import 'package:flutter/material.dart';
import 'package:justblog/features/justblog/data/models/justblog_models.dart';

import 'details_page.dart';



class PostList extends StatefulWidget {
  final BuildContext context;
  final Items item;
  final int index;

  PostList(this.context, this.item, this.index);

  @override
  _PostListState createState() => _PostListState(this.item, this.index);
}

class _PostListState extends State<PostList> {
  Items item;
  int index;
  _PostListState(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      items: item,
                      index: index,
                      title: item.title,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: Container(
          height: 150.0,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                width: 140.0,
                height: 150.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${item.image}"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(width: 4.0),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 175.0,
                        child: Text(
                          item.title,
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),

                  /*Container(
                    width: 175.0,
                    child: Text(
                      item.content_text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0),
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
