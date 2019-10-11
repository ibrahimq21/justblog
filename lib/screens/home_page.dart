import 'package:flutter/material.dart';
import 'package:justblog/model/items.dart';
import 'package:justblog/model/root.dart';
import 'package:justblog/screens/post_list.dart';
import 'package:justblog/service/api_service.dart';
import 'package:justblog/utils/ColorHex.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




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
        image: DecorationImage(image: AssetImage(res)),
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
      body: FutureBuilder<Root>(
        future: ApiService.getRoot(),
        builder: (context, snapshot){
          return ListView.separated(

            itemCount: snapshot.data.items.length,
            itemBuilder: (context, index){
              return Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      createHeader(),
                      Positioned(
                        bottom: 50.0,
                        right: 100.0,
                        child: createCircle(400.0, 400.0, 200.0, "#FE16D", 0.4),
                      ),
                      Positioned(
                        bottom: 100.0,
                        left: 150.0,
                        child: createCircle(300.0, 300.0, 150.0, "#FE16D", 0.5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 15.0),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 15.0),
                              displayProfile("asset/image/kaycee_rice.jpg"),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width - 120.0),
                              topNavMenuBar(),
                              SizedBox(height: 15.0),
                            ],
                          ),
                          SizedBox(height: 50.0),
                          titles("${snapshot.data.title}", 30.0),
                          SizedBox(height: 15.0),
                          titles("${snapshot.data.description}", 23.0),
                          SizedBox(height: 15.0),
                          searchBar(),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),

                  GestureDetector(

                    onTap: (){

                    },

                  ),
                  PostList(context, snapshot.data.items[index]),

//                  PostList(context),

                ],
              );
            },
            separatorBuilder: (context, index) => Divider(),


          );
        }
      )
    );
  }
  Widget itemCard(String title, String imgPath) {
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
                      image: AssetImage(imgPath), fit: BoxFit.cover)),
            ),
            SizedBox(width: 4.0),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
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
                    'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
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

  Widget displayPostTiles() {
    return FutureBuilder<List<Items>>(
        future: ApiService.getItems(),
        builder: (context, snapshot) {


          return ListView.builder(

              itemCount: snapshot.data.length,

              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){

                return Container(
                  width: double.infinity,
                  height: 100.0,
//                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                  padding: EdgeInsets.all(100),
                  color: Colors.blueGrey,
                  child:Text('${snapshot.data[index].title}')
                );

              }

              );





        }

        );

  }


}
