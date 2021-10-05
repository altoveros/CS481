//
// Group 5: CJ Trujillo, Ian Altoveros, Gintas Kazlauskas, Howard Tep
// 11/3/20
// CS 481 Lab 3
// Lists, Grid Lists, & Menu
// Mexican Restaurant app
//
// Citation: api.flutter.dev

import 'dart:async';

import 'package:flutter/material.dart';
import 'item_objects.dart';
import 'menu.dart';
import 'checkout.dart';
import 'contact.dart';
import 'locations.dart';
import 'order.dart';
import 'store_contact.dart';
import 'reviews.dart';
import 'LandingPage.dart';

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
      home: SplashScreen()
      //home: MyHomePage(),
    );
  }
}
/*
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 3), ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage())));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen()
      //home: MyHomePage(),
    );
  }
}
*/
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> cart = [];
  double sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Group 5 Lab 4"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Menu",
                ),
                Tab(
                  text: "Order",
                ),
              ],
            ),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text("Account Info"),
                    ),
                    //PopupMenuItem(value: 2, child: Text("Purchase History")),
                  ],
                  onSelected: (retVal){
                    if(retVal == 1) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactInfo()));
                    }/*else if(retVal ==2) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Locations()));
                    }*/
                  },
                ),
              ]
          ),
          body: TabBarView(
            children: <Widget>[
              Menu((selectedProduct){
                setState(() {
                  cart.add(selectedProduct);
                  sum = 0;
                  cart.forEach((item){
                    sum = sum + item.price;
                  }); //cart loop
                }); //setstate
              }), //menu tab
              Checkout(cart, sum),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: null,//child: Text('Group 5\'s\ restaurant'),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    image: DecorationImage(image: AssetImage('images/DrawerHeader.jpg'), fit: BoxFit.cover),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.fastfood/*Icons.brightness_6*/, color: Colors.yellow[900]),
                  title: Text('Menu'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Order()));
                  },
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.location_on/*Icons.timelapse*/, color: Colors.blue),
                  title: Text('Locations'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Locations())); //TODO: NEED TO ADD LOCATIONS
                  },
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.black),
                  title: Text('Contact Us'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StoreContact()));
                  },
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.star, color: Colors.red),
                  title: Text('Write a Review'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Reviews())); //TODO: NEED TO ADD REVIEWS
                  },
                ),
                Divider(color: Colors.black),
              ],
            ),
          ),
        ),
    );
  }
}
