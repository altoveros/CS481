import 'package:flutter/material.dart';
import 'dogs.dart';

class DogDetail extends StatelessWidget{

final Dog dog;

DogDetail({this.dog});


bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
    Positioned(
      height: MediaQuery.of(context).size.height/1.5,
      width: MediaQuery.of(context).size.width - 20,
      left: 10.0,
      top: MediaQuery.of(context).size.height * 0.1,
      child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
    ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(dog.breed, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            Text("Height: ${dog.height}"),
            Text("Weight: ${dog.weight}"),
            Text("Size: ${dog.size}"),
            Text("Colors", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: dog.color.map((t) => FilterChip(
                  backgroundColor: Colors.orange,
                  label: Text(t),
                  onSelected: (b){}),
            ).toList(),
            ),
            Text("Personality", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: dog.personality.map((t) => FilterChip(
                  backgroundColor: Colors.red,
                  label: Text(t),
                  onSelected: (b){}),
              ).toList(),
            ),
            Text("Fur Type", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: dog.furType.map((t) => FilterChip(
                  backgroundColor: Colors.green,
                  label: Text(t),
                  onSelected: (b){}),
              ).toList(),
            ),
          ]
        )
      ),
    ),
    Align(
      alignment: Alignment.topCenter,
      child: Hero(tag: dog.image, child: Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
              image: NetworkImage(dog.image)),
        ),
      ))
    )
  ]
);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(dog.breed),
      ),

      body: bodyWidget(context),

    );
  }
}