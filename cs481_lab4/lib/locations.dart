import 'package:flutter/material.dart';
import 'dart:ui';
import 'location1.dart';
import 'location2.dart';
import 'location3.dart';
import 'location4.dart';
import 'globals.dart';


class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: myLocation(),
    );
  }

  Widget myLocation() {
    List<String> images = ['images/locations/location1.jpg','images/locations/location2.jpg','images/locations/location3.jpg','images/locations/location4.jpg'];
    List<String> text = ['Santa Monica', 'San Diego', 'San Francisco', 'Los Angeles'];
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemBuilder: (BuildContext context, int index){
        return Container(
          child: Stack(
            children: <Widget>[
             Container(
               child: Image.asset(images[index],
                   height: 200,
                   width: 200,
                   fit: BoxFit.contain),
             ),
              Container(
                  alignment: Alignment.topCenter,
                  child: Text(text[index],
                      style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20))
              ),
              Positioned(
                child: Align(
                  alignment: Alignment(1.25,-1.15),
                  child:myLocationMenu(context, index),
                ),
              )
            ]
          )
        );
      }
    );
  }

  Widget myLocationMenu(BuildContext context, int index) {
    return PopupMenuButton(
          itemBuilder: (context) {
          var list = List<PopupMenuEntry<Object>>();
          list.add(CheckedPopupMenuItem(
            child: Text("Set Default Location"),
            value: 1,
          ),
          );
          list.add(CheckedPopupMenuItem(
            child:Text("Call"),
            value: 2,
          ),);
          list.add(CheckedPopupMenuItem(
            child: Text("Read Reviews"),
            value: 3,
          ),);
          return list;
        },
        onSelected: (value) {
          if(index == 0){
            if(value == 1){
              dropDown = 'Santa Monica';
            }
          }
          if(index == 1){
            if(value == 1){
              dropDown = 'San Diego';
            }
          }
          if(index == 2){
            if(value == 1){
              dropDown = 'San Francisco';
            }
          }
          if(index == 3){
            if(value == 1){
              dropDown = 'Los Angeles';
            }
          }

            if(value == 2){
              _settingModalBottomSheet(context, index);
            }
          if (index == 0) {
            if (value == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Location1()));
            }
          }
          if (index == 1) {
            if (value == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Location2()));
            }
          }
          if (index == 2) {
            if (value == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Location3()));
            }
          }
          if (index == 3) {
            if (value == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Location4()));
            }
          }
        });
  }

  void _settingModalBottomSheet(BuildContext context, int index){
    List<String> numbers = ['858-776-2345', '619-633-2323', '858-952-2321', '760-232-3523'];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return Container(
          child: new Wrap(
            children: <Widget>[
             new ListTile(
               leading: new Icon(Icons.call),
               title: new Text('Calling ' + numbers[index]),
               onTap: () => {}),
              ]
             )
          );
      }
    );

  }


}
