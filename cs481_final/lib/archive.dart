import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dogs.dart';
import 'doginfo.dart';
import 'dart:async';

class DataSearch extends SearchDelegate<String> {

  List <Dog> _dog = List<Dog>();

  Future<List<Dog>> fetchDog() async {
    var url = 'https://bitbucket.org/cs481group5/doggydex/raw/e75c3c49f55fdcf63044e89d85ab512affb87483/doggydexx.json';
    var response = await http.get(url);
    var dog = List<Dog>();
    if (response.statusCode == 200) { //if returned
      var dogJson = json.decode(response.body);
      for (var dogJson in dogJson) {
        dog.add(Dog.fromJson(dogJson));
      }
    }
    return dog;
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [IconButton(icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some results based on the selection

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    fetchDog().then((value) {
      _dog.addAll(value);
      //getDog();
    });
    //show when someone searches for something
    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(
          leading: Image.asset(_dog[index].image),
          title: Text(_dog[index].breed),
        ),
      itemCount: _dog.length,
    );
  }
}

class getDog extends StatefulWidget {
  @override
  _getDogState createState() => _getDogState();
}

class _getDogState extends State<getDog> {
  @override
  Widget build(BuildContext context) {
    List <Dog> _dog = List<Dog>();

    Future<List<Dog>> fetchDog() async {
      var url = 'https://bitbucket.org/cs481group5/doggydex/raw/e75c3c49f55fdcf63044e89d85ab512affb87483/doggydexx.json';
      var response = await http.get(url);
      var dog = List<Dog>();
      if (response.statusCode == 200) { //if returned
        var dogJson = json.decode(response.body);
        for (var dogJson in dogJson) {
          dog.add(Dog.fromJson(dogJson));
        }
      }
      return dog;
    }
  }




}