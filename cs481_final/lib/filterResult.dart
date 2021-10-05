import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dogs.dart';
import 'doginfo.dart';
import 'search.dart';


class smallDog extends StatefulWidget {
  @override
  _smallDogState createState() => _smallDogState();
}

class _smallDogState extends State<smallDog> {

  var url = "https://bitbucket.org/cs481group5/doggydex/raw/e75c3c49f55fdcf63044e89d85ab512affb87483/doggydexx.json";


  DogHub dogHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    dogHub = DogHub.fromJson(decodedJson);
    print(dogHub.toJson());
    setState(() {

    });
  }

  @override
  bool isSmall = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Small Search",
              style: TextStyle(fontSize: 18, wordSpacing: 125)),
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ]
      ),
      body: dogHub == null ? Center(child: CircularProgressIndicator()) :
      GridView.count(
        crossAxisCount: 2,
        children: dogHub.dog
            .map((dog) =>
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      DogDetail(
                        dog: dog,
                      )));
                },
                child: Hero(
                  tag: dog.image,
                  child: Card(
                      elevation: 3.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: dog.size != 'small' ? null : Colors.yellow,
                                image: DecorationImage(
                                    image: NetworkImage(dog.image)),
                              ),
                            ),
                            Text(
                                dog.breed, style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                          ]
                      )
                  ),
                ),
              ),
            )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}


class mediumDog extends StatefulWidget {
  @override
  _mediumDogState createState() => _mediumDogState();
}

class _mediumDogState extends State<mediumDog> {

  var url = "https://bitbucket.org/cs481group5/doggydex/raw/e75c3c49f55fdcf63044e89d85ab512affb87483/doggydexx.json";


  DogHub dogHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    dogHub = DogHub.fromJson(decodedJson);
    print(dogHub.toJson());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Medium Search",
              style: TextStyle(fontSize: 18, wordSpacing: 125)),
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ]
      ),
      body: dogHub == null ? Center(child: CircularProgressIndicator()) :
      GridView.count(
        crossAxisCount: 2,
        children: dogHub.dog
            .map((dog) =>
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      DogDetail(
                        dog: dog,
                      )));
                },
                child: Hero(
                  tag: dog.image,
                  child: Card(
                      elevation: 3.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: dog.size != 'medium' ? null : Colors.yellow,
                                image: DecorationImage(
                                    image: NetworkImage(dog.image)),
                              ),
                            ),
                            Text(
                                dog.breed, style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                          ]
                      )
                  ),
                ),
              ),
            )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class bigDog extends StatefulWidget {
  @override
  _bigDogState createState() => _bigDogState();
}

class _bigDogState extends State<bigDog> {

  var url = "https://bitbucket.org/cs481group5/doggydex/raw/e75c3c49f55fdcf63044e89d85ab512affb87483/doggydexx.json";


  DogHub dogHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    dogHub = DogHub.fromJson(decodedJson);
    print(dogHub.toJson());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Big Search",
              style: TextStyle(fontSize: 18, wordSpacing: 125)),
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ]
      ),
      body: dogHub == null ? Center(child: CircularProgressIndicator()) :
      GridView.count(
        crossAxisCount: 2,
        children: dogHub.dog
            .map((dog) =>
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      DogDetail(
                        dog: dog,
                      )));
                },
                child: Hero(
                  tag: dog.image,
                  child: Card(
                      elevation: 3.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: dog.size != 'big' ? null : Colors.yellow,
                                image: DecorationImage(
                                    image: NetworkImage(dog.image)),
                              ),
                            ),
                            Text(
                                dog.breed, style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                          ]
                      )
                  ),
                ),
              ),
            )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}