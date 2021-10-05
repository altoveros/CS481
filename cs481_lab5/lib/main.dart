//
// Group 5: CJ Trujillo, Ian Altoveros, Gintas Kazlauskas, Howard Tep
// 11/3/20
// CS 481 Lab 5
// Snackbars, Tabs & Tooltips
// Sample App
//
// Citation: api.flutter.dev

import 'package:flutter/material.dart';
import 'tabOne.dart';
import 'tabTwo.dart';
import 'tabThree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Group 5 Demo"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Home",
                  icon: Icon(Icons.home)
                ),
                Tab(
                  text: "Social",
                  icon: Icon(Icons.alternate_email)
                ),
                Tab(
                  text: "User",
                  icon: Icon(Icons.account_box)
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TabOne(1.0),
              TabTwo(),
              TabThree(),
            ],
          )
      ),
    );
  }

}
