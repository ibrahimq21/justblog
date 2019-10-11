import 'package:flutter/material.dart';
import 'package:justblog/model/items.dart';
import 'package:justblog/utils/ColorHex.dart';
class PostList extends StatefulWidget{

  BuildContext context;
  Items item;

  PostList(this.context, this.item);


  @override
  _PostListState createState() => _PostListState(this.item);



}

class _PostListState extends State<PostList>{
  Items item;
  _PostListState(this.item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
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
                      image: AssetImage("asset/image/kaycee_rice.jpg"), fit: BoxFit.cover)),
            ),
            SizedBox(width: 4.0),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      item.title,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
                SizedBox(height: 5.0),
                Container(
                  width: 175.0,
                  child: Text(
                    item.content_text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.grey,
                        fontSize: 12.0),
                  ),
                ),


              ],
            )
          ],
        ),
      ),
    );

  }




}