//
// Group 5: CJ Trujillo, Ian Altoveros, Gintas Kazlauskas, Howard Tep
// 10/27/20
// CS 481 Lab 3
// Chips, Buttons, Data Tables, & Cards
// Shopping app lists products that can be added to a cart. Cart will total
//    the added products and then opens a cupertino for checkout.
//    Menu button can open customer contact info and purchase history
//
// Citation: api.flutter.dev
//    Currency formatting- https://stackoverflow.com/questions/14865568/currency-format-in-dart
//    Date formatting- https://stackoverflow.com/questions/51579546/how-to-format-datetime-in-flutter
//    Scrolling table- https://stackoverflow.com/questions/56942322/how-to-create-a-horizontally-scrolling-table-with-fixed-column-in-flutter

import 'package:flutter/material.dart';
import 'dart:ui';
import 'shopcard.dart';
import 'checkout.dart';
import 'item_objects.dart';
import 'history.dart';
import 'contact.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Group 5 Lab 3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> cart = [];
  double sum = 0;

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: Colors.black);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: "Products",
                    ),
                    Tab(
                      text: "Cart",
                    ),
                  ],
                ),
                actions: <Widget>[
                  PopupMenuButton(
                    icon: Icon(Icons.menu),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("Account Info"),
                      ),
                      PopupMenuItem(value: 2, child: Text("Purchase History")),
                    ],
                    onSelected: (retVal){
                      if(retVal == 1) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactInfo()));
                      }else if(retVal ==2) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PurchaseHistory()));
                      }
                    },
                  ),
                ]
            ),
            body: TabBarView(
              children: <Widget>[
                Home((selectedProduct) {
                  setState(() {
                    cart.add(selectedProduct);
                    sum = 0;
                    cart.forEach((item) {
                      sum = sum + item.price;
                    });
                  });
                }),
                Checkout(cart, sum),
              ],
            )));
  }
}