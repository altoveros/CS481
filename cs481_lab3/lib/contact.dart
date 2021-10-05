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
                  child: Text('David Harrison', style: TextStyle(
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
                              title: Text("422-877-4899")),
                          Divider(color: Colors.black),
                          ListTile(leading: Icon(Icons.home, color: Colors.black),
                              title: Text("1250 Chestnut St, San Francisco, CA 94133")),
                          Divider(color: Colors.black),
                          ListTile(leading: Icon(Icons.email, color: Colors.black),
                              title: Text("Harrison2522@gmail.com")),
                          Divider(color: Colors.black),
                          Divider(color: Colors.white, height: 40),
                          Text('Payment Method', style: TextStyle(fontSize:20)),
                          ListTile(leading: Icon(Icons.credit_card, color: Colors.black),
                              title: Text("7253 9278 1725 7728", style: TextStyle(color: Colors.black)),
                              trailing: Text("EXP: 11/24", style: TextStyle(fontWeight: FontWeight.bold))),
                          ListTile(title: Text("Security Number", style: TextStyle(color: Colors.black)),
                              subtitle: Text("521", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))
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