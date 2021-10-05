import 'package:intl/intl.dart'; //for currency formatting
import 'package:flutter/material.dart';
import 'item_objects.dart';

// ignore: must_be_immutable
class Menu extends StatelessWidget {
  final ValueSetter<Item> _valueSetter;

  Menu(this._valueSetter);

  List<Item> _items = <Item>[
    //THIS WOULD BE BREAKFAST
    Item(
      picture: Image.asset('images/breakfast/BreakfastStack.jpg'),
      name: 'Breakfast Stack',
      category: 'A La Carte',
      price: 3.99,
    ),
    Item(
      picture: Image.asset('images/breakfast/BreakfastWrap.jpg'),
      name: 'Breakfast Wrap',
      category: 'A La Carte',
      price: 5.99,
    ),
    Item(
      picture: Image.asset('images/breakfast/BreakfastSalad.jpg'),
      name: 'Breakfast Salad',
      category: 'A La Carte',
      price: 7.99,
    ),
    Item(
      picture: Image.asset('images/breakfast/BreakfastHash.jpg'),
      name: 'Breakfast Hash',
      category: 'A La Carte',
      price: 7.99,
    ),
    Item(
      picture: Image.asset('images/breakfast/BreakfastSkillet.jpg'),
      name: 'Breakfast Skillet',
      category: 'A La Carte',
      price: 8.99,
    ),

    //THIS WOULD BE APPETIZER
    Item(
      picture: Image.asset('images/appetizer/ChipsNGuac.jpg'),
      name: 'Chips N Guac',
      category: 'A La Carte',
      price: 3.99,
    ),
    Item(
      picture: Image.asset('images/appetizer/FishNChips.jpg'),
      name: 'Fish N Chips',
      category: 'A La Carte',
      price: 4.99,
    ),
    Item(
      picture: Image.asset('images/appetizer/GrilledCorn.jpg'),
      name: 'Grilled',
      category: 'A La Carte',
      price: 4.99,
    ),
    Item(
      picture: Image.asset('images/appetizer/AvocadoEggroll.jpg'),
      name: 'Avocado Eggroll',
      category: 'A La Carte',
      price: 7.99,
    ),


    //THIS WOULD BE ENTREES
    Item(
      picture: Image.asset('images/entree/burrito.jpg'),
      name: 'Plain Burrito',
      category: 'A La Carte',
      price: 5.99,
    ),
    Item(
      picture: Image.asset('images/entree/DoubleChickenBurrito.jpg'),
      name: 'Double Chicken Burrito',
      category: 'A La Carte',
      price: 8.99,
    ),
    Item(
      picture: Image.asset('images/entree/CheesyBurrito.jpg'),
      name: 'Cheesy Burrito',
      category: 'A La Carte',
      price: 8.99,
    ),
    Item(
      picture: Image.asset('images/entree/BeanBurrito.jpg'),
      name: 'Bean Burrito',
      category: 'A La Carte',
      price: 6.99,
    ),
    Item(
      picture: Image.asset('images/entree/AsadaFries.jpg'),
      name: 'AsadaFries',
      category: 'A La Carte',
      price: 9.99,
    ),
    Item(
      picture: Image.asset('images/entree/MexicanRiceChicken.jpg'),
      name: 'Mexican Rice Chicken',
      category: 'A La Carte',
      price: 9.99,
    ),
    Item(
      picture: Image.asset('images/entree/PolloAsadaTaco.jpg'),
      name: 'Pollo Asada Taco',
      category: 'A La Carte',
      price: 5.49,
    ),
    Item(
      picture: Image.asset('images/entree/TripleCheeseTaco.jpg'),
      name: 'Triple Cheese Taco',
      category: 'A La Carte',
      price: 5.49,
    ),


  ];


  //Currency Formatting
  final dollar = new NumberFormat("#,##0.00", "en_US");

  List<Item> cart = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: _items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
            crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              print(_items[index].name);
              _valueSetter(_items[index]);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                    duration: Duration(seconds: 1),
                    content: Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(width: 20),
                        Expanded(
                            child: Text(
                                _items[index].name + ' was added to order')
                        )
                      ],
                    )
                ),
              );
            },
            child: Container(
              child: Stack(
                  children: <Widget>[
                    Container(
                        child: _items[index].picture,
                    ),
                    Container(
                        alignment: Alignment.topCenter,
                        child: Text(_items[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white, fontSize: 20))
                    )
                  ]
              ),
            ),
          );
        },
      ),
    );
  }
}