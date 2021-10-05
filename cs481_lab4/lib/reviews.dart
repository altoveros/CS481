import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'globals.dart' as globals;
import 'globals.dart';

class Reviews extends StatefulWidget {
  _Reviews createState() => _Reviews();
}

class _Reviews extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rating :)'),
        ),
        body: reviews(context),
        floatingActionButton: FloatingActionButton.extended(
            label: Text("Submit"),
            icon: Icon(Icons.thumb_up),
            backgroundColor: Colors.orange,
            onPressed: () {
              if(dropDown == 'Santa Monica') {
                location1.add(myController.text);
                myController.clear();
              }
              if(dropDown == 'San Diego') {
                location2.add(myController.text);
                myController.clear();
              }
              if(dropDown == 'San Francisco') {
                location3.add(myController.text);
                myController.clear();
              }
              if(dropDown == 'Los Angeles') {
                location4.add(myController.text);
                myController.clear();
              }
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Thank you!"),
                    );
                  });
            }
            ));
  }

  // String dropdownValue = 'Santa Monica';
  final myController = TextEditingController();

  Widget reviews(BuildContext context) {


    @override
    void dispose(){
      myController.dispose();
      super.dispose();
    }

    return Column(
        children: <Widget>[
      Card(
        color: Colors.grey,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
                maxLines: 8,
                decoration: InputDecoration.collapsed(
                    hintText: "Leave a review here!"),
              controller: myController,
            )),
      ),
      Container(
          padding: const EdgeInsets.fromLTRB(0, 12, 200, 4),
          child: DropdownButton<String>(
            value: dropDown,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black),
            underline: Container(height: 2, color: Colors.deepOrange),
            onChanged: (String newValue) {
              setState(() {
                dropDown = newValue;
              });
            },
            items: <String>['Santa Monica', 'San Diego', 'San Francisco', 'Los Angeles']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

      ),

    ]
    );
  }
}

