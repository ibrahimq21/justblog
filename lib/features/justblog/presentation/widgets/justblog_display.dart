

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justblog/core/util/ColorHex.dart';
import 'package:justblog/features/justblog/presentation/bloc/justblog_bloc.dart';
import 'package:justblog/features/justblog/presentation/bloc/justblog_state.dart';
import 'package:justblog/features/justblog/presentation/pages/post_list.dart';

import 'loading_widgets.dart';
import 'message_display.dart';

class JustblogDisplay extends StatefulWidget{


  _JustblogState createState() => _JustblogState();

}

class _JustblogState extends State<JustblogDisplay> {

  ScrollController _controller;


  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }



  Widget createCircle(double height, double width, double borderRad,
      String colorHex, double opacityValue) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRad),
        color: Color(ColorHex.getColorHexFromString(colorHex))
            .withOpacity(opacityValue),
      ),
    );
  }



  Widget topNavMenuBar() {
    return Container(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
        color: Colors.white,
        iconSize: 30.0,
      ),
    );
  }

  Widget createHeader() {
    return Container(
      height: 250.0,
      width: double.infinity,
      color: Color(ColorHex.getColorHexFromString("#FDD148")),
    );
  }

  Widget titles(String title, double fontSize) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: fontSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }


  Widget displayProfile(String res) {
    return Container(
      alignment: Alignment.topLeft,
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
            color: Colors.white, style: BorderStyle.solid, width: 2.0),
        image: new DecorationImage(image: NetworkImage(res)),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(5.0),
        child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search,
                    color: Color(ColorHex.getColorHexFromString('#FEDF62')),
                    size: 30.0),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                hintText: 'Search',
                hintStyle:
                TextStyle(color: Colors.grey, fontFamily: 'Quicksand'))),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocBuilder<JustBlogBloc, JustBlogState>(
          builder: (context, state){
          if(state is Empty){
            return MessageDisplay(
              message: 'Start searching!',
            );
          } else if(state is Loading){
            return LoadingWidget();
          }else if(state is Loaded){
            return ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        createHeader(),
                        Positioned(
                          bottom: 50.0,
                          right: 100.0,
                          child: createCircle(
                              400.0, 400.0, 200.0, "#FE16D", 0.4),
                        ),
                        Positioned(
                          bottom: 100.0,
                          left: 150.0,
                          child: createCircle(
                              300.0, 300.0, 150.0, "#FE16D", 0.5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 12.0),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        80.0),
                                topNavMenuBar(),
                                SizedBox(height: 15.0),
                              ],
                            ),
                            SizedBox(height: 50.0),
                            titles("${state.justblog.title}", 30.0),
                            SizedBox(height: 15.0),
                            titles("${state.justblog.description}", 23.0),
//                              SizedBox(height: 15.0),
////                              searchBar(),
////                              SizedBox(height: 10.0),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Column(
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            controller: _controller,
                            itemCount: state.justblog.items.length,
                            itemBuilder: (context, index) {
                              return PostList(
                                  context, state.justblog.items[index], index);
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }else if(state is Error){
            return MessageDisplay(
              message: state.message,
            );
          }


          return null;
          },



      ),

    );
  }
}