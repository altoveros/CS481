import 'package:flutter/material.dart';
import 'item_objects.dart';
import 'menu.dart';
import 'checkout.dart';


class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<String> images = ['images/breakfast/BreakfastWrap.jpg', 'images/breakfast/BreakfastStack.jpg', 'images/breakfast/BreakfastSkillet.jpg',
    'images/breakfast/BreakfastHash.jpg', 'images/breakfast/BreakfastSalad.jpg', 'images/appetizer/GrilledCorn.jpg', 'images/appetizer/FishNChips.jpg',
    'images/appetizer/ChipsNGuac.jpg', 'images/appetizer/AvocadoEggroll.jpg', 'images/entree/AsadaFries.jpg', 'images/entree/burrito.jpg',
    'images/entree/BeanBurrito.jpg', 'images/entree/CheesyBurrito.jpg', 'images/entree/PolloAsadaTaco.jpg', 'images/entree/DoubleChickenBurrito.jpg',
    'images/entree/MexicanRiceChicken.jpg', 'images/entree/TripleCheeseTaco.jpg'];

    List<String> text = ['Breakfast Wrap', 'Breakfast Stack', 'Breakfast Skillet', 'Breakfast Hash', 'Breakfast Salad', 'Grilled Corn', 'Fish N Chips',
    'Chips N Guac', 'Avocado Eggroll', 'Asada Fries', 'Plain Burrito', 'Bean Burrito', 'Cheesy Burrito', 'Pollo Asada Taco', 'Double Chicken Burrito',
    'Mexican Rice Chicken', 'Triple Cheese Taco'];

    return Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
        ),
      backgroundColor: Colors.yellow[100],
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
          crossAxisSpacing: 1, mainAxisSpacing: 1),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image.asset(images[index])
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(text[index],
                            style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white, fontSize: 20))
                      )
              ]
            ));
          },
        ),
      ),
    );
  }
}