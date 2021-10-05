// Citation: Currency formatting- https://stackoverflow.com/questions/14865568/currency-format-in-dart
import 'package:intl/intl.dart'; //for currency formatting
import 'package:flutter/material.dart';
import 'item_objects.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final ValueSetter<Item> _valueSetter;

  Home(this._valueSetter);

  List<Item> _items = <Item>[
    Item(
      icon: Icons.fastfood,
      name: 'Potato Chips',
      brand: 'Lays',
      price: 3.99,
    ),
    Item(
      icon: Icons.fastfood,
      name: 'BBQ Chips',
      brand: 'Lays',
      price: 3.99,
    ),
    Item(
      icon: Icons.fastfood,
      name: 'Tortilla Chips',
      brand: 'Lays',
      price: 4.99,
    ),
    Item(
      icon: Icons.fastfood,
      name: 'Cookies',
      brand: 'First Street',
      price: 2.99,
    ),
    Item(
      icon: Icons.local_pharmacy,
      name: 'Aspirin',
      brand: 'Tylenol',
      price: 7.99,
    ),
    Item(
      icon: Icons.local_pharmacy,
      name: 'Aspirin',
      brand: 'Ibuprofen',
      price: 8.99,
    ),
    Item(
      icon: Icons.local_pharmacy,
      name: 'Bandages',
      brand: 'Band-Aid',
      price: 4.99,
    ),
    Item(
      icon: Icons.pets,
      name: 'Kitty Litter',
      brand: 'Scoop-Away',
      price: 9.99,
    ),
    Item(
    icon: Icons.pets,
   name: 'Dog Kibble',
    brand: 'Barkley',
    price: 29.99,
    ),

  ];

  final _formKey = GlobalKey<FormState>();

  //Currency Formatting
  final dollar = new NumberFormat("#,##0.00", "en_US");

  List<Item> cart = [];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return ListTile(
          leading: Icon(_items[index].icon, size: 30,),
          title: Text(_items[index].name),
          subtitle: Text(_items[index].brand),
          trailing: ActionChip(
            avatar: Icon(Icons.shopping_cart),
            label: Text("\$${dollar.format(_items[index].price)}"),
            onPressed: () {
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
                                _items[index].name + ' was added to the cart'))
                      ],
                    )),
              );
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
