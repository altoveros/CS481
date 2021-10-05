import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dogs.dart';
import 'doginfo.dart';
import 'dart:async';

class DataSearch extends SearchDelegate<String> {
  final dogs = [
    "Small Dogs",
    "Medium Dogs",
    "Big Dogs",
  ];

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
    final list = dogs;
    //show when someone searches for something
    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(
          leading: Icon(Icons.pets),
          title: Text(list[index]),
          onTap: () {if (list[index] == "Big Dogs")
            DataSearch();
          else close(context, null);}
        ),
      itemCount: list.length,
    );
  }
}
