import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class Checkout extends StatelessWidget {
  final cart;
  double sum;
  //date formatting
  final DateTime now = DateTime.now();

  Checkout(this.cart, this.sum);
  //currency formatting
  final dollar = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cart[index].name),
            subtitle: Text(cart[index].category),
            trailing: Chip(
              avatar: Icon(Icons.attach_money, color: Colors.green),
              label: Text("${dollar.format(cart[index].price)}"),
              backgroundColor: Colors.grey.shade500,
            ),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        shrinkWrap: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Total: \$${dollar.format(sum)}"),
        onPressed: (){
          if (sum == 0){
            showDialog(
                context: context,
                builder: (BuildContext context) => new CupertinoAlertDialog(
                  title: Text("Cart Is Empty"),
                  actions: [
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text("Close"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
            );
          }else{
            showDialog(
                context: context,
                builder: (BuildContext context) => new CupertinoAlertDialog(
                  title: Text("Checkout"),
                  content: Text("Proceed to make payment of \$${dollar.format(sum)}?"),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("Proceed"),
                      onPressed: (){
                        Navigator.of(context).pop();
                        cart.clear();
                        sum = 0;
                        Navigator.push(
                          context,
                            MaterialPageRoute(builder: (context)=>MyHomePage()));
                      },
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text("Close"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
            );
          }
        },
      ),
    );
  }
}
