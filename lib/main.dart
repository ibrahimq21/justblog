import 'package:flutter/material.dart';
import 'package:infinite_view_pager/infinite_view_pager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: InfiniteViewPagerDemo(),
    );
  }
}

class InfiniteViewPagerDemo extends StatefulWidget {
  @override
  _InfiniteViewPagerDemoState createState() => _InfiniteViewPagerDemoState();
}

class _InfiniteViewPagerDemoState extends State<InfiniteViewPagerDemo> {
  int index = 0;

  Widget _buildPage(BuildContext context, int direction) {
    return Container(
      padding: EdgeInsets.all(100.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        child: Center(
          child: Text(
            (index + direction).toString(),
            style: Theme.of(context).textTheme.display4,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InfiniteViewPager(
        onPageChanged: (direction) {
          index += direction;
        },
        pageBuilder: _buildPage,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}