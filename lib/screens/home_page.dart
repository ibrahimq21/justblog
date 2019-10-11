import 'package:flutter/material.dart';
import 'package:justblog/utils/ColorHex.dart';
class HomePage extends StatefulWidget{


  _HomePageState createState() => _HomePageState();


}

class _HomePageState extends State<HomePage>{






  Widget createCircle(double height, double width, double borderRad, String colorHex, double opacityValue){


    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRad),
        color: Color(ColorHex.getColorHexFromString(colorHex)).withOpacity(opacityValue),
      ),
    );

  }

  Widget topNavBar(){
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


  Widget createHeader(){



    return Container(

      height: 250.0,
      width: double.infinity,
      color: Color(ColorHex.getColorHexFromString("#FDD148")),


    );

  }





  Widget displayProfile(String res){
    return Container(

      alignment: Alignment.topLeft,
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Colors.white,
          style: BorderStyle.solid,
          width: 2.0
        ),
        image: DecorationImage(image: AssetImage(res)),
      ),


    );

  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
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

                          SizedBox(width: MediaQuery.of(context).size.width - 120.0),
                          topNavBar(),
                          SizedBox(height: 15.0),


                        ],
                      ),

                      SizedBox(height: 50.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Website name',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 15.0),



                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}