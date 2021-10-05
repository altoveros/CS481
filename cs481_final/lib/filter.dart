import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'filterResult.dart';

class DataFilter extends SearchDelegate<String> {
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
    final list = dogs.where((p)=>p.startsWith(query)).toList();
    //show when someone searches for something
    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(
            leading: Icon(Icons.pets),
            title: RichText(text: TextSpan(
                text: list[index].substring(0,query.length),
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [TextSpan(
                    text: list[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)
                )]
            )),//Text(list[index]),
            onTap: () {
              if (list[index] == "Small Dogs") {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>
                    smallDog()));
              }
              else if (list[index] == "Medium Dogs") {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>
                    mediumDog()));
              }
              else if (list[index] == "Big Dogs") {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>
                    bigDog()));
              }
              else close(context, null);}
        ),
      itemCount: list.length,
    );
  }
}
