import 'package:flutter/material.dart';
import 'dart:ui';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfo createState() => _ContactInfo();
}

class _ContactInfo extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Info'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Billy Johnson', style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                Divider(color: Colors.black, thickness: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                        spacing: 10.0,
                        children: <Widget>[
                          ListTile(leading: Icon(Icons.phone, color: Colors.black),
                              title: Text("291-552-8744")),
                          Divider(color: Colors.black),
                          ListTile(leading: Icon(Icons.home, color: Colors.black),
                              title: Text("16221 Beverly Capital, Los Angeles, CA 94133")),
                          Divider(color: Colors.black),
                          ListTile(leading: Icon(Icons.email, color: Colors.black),
                              title: Text("BillyJohn11@gmail.com")),
                          Divider(color: Colors.black),
                          Divider(color: Colors.white, height: 40),
                          Text('Payment Method', style: TextStyle(fontSize:20)),
                          ListTile(leading: Icon(Icons.credit_card, color: Colors.black),
                              title: Text("1762 6283 0577 9812", style: TextStyle(color: Colors.black)),
                              trailing: Text("EXP: 03/22", style: TextStyle(fontWeight: FontWeight.bold))),
                          ListTile(title: Text("Security Number", style: TextStyle(color: Colors.black)),
                              subtitle: Text("812", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))
                        ]
                    ),
                  ),
                ),
                //Divider(color: Colors.black),
              ],
            ),
          )
      ),
    );
  }
}