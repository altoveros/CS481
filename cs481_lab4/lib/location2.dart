import 'package:flutter/material.dart';
import 'dart:ui';
import 'globals.dart';


class Location2 extends StatefulWidget{
  _Location2 createState() => _Location2();
}

class _Location2 extends State<Location2>{
  int x = 0;
  @override
  Widget build(BuildContext context){
    x = location2.length;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.thumb_up),
        title: Text('San Diego Reviews'),
      ),
      body: Container(
        color: Colors.blueGrey[400],
        child: ListView.builder(
          itemCount: x,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 55.0,
                          height: 55.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.grey,
                            backgroundImage: NetworkImage("https://i.imgur.com/giL1wvz.jpeg"),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Anonymous', style: TextStyle(color: Colors.black, fontSize: 15)),
                            Text(location2[index], style: TextStyle(color: Colors.black, fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

