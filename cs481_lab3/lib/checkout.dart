import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'history.dart';
import 'main.dart';

// ignore: must_be_immutable
class Checkout extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  final cart;
  double sum;

  //date formatting
  final DateTime now = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  Checkout(this.cart, this.sum);

  //currency formatting
  final dollar = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new RefreshIndicator(
        child: ListView.separated(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cart[index].name),
              subtitle: Text(cart[index].brand),
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
        onRefresh: _handleRefresh,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Total: \$${dollar.format(sum)}"),
        onPressed: () {
          if (sum == 0) {
            showDialog(
                context: context,
                builder: (BuildContext context) =>
                new CupertinoAlertDialog(
                  title: Text("Cart Is Empty"),
                  actions: [
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) =>
                new CupertinoAlertDialog(
                  title: Text("Checkout"),
                  content: Text(
                      "Proceed to make payment of \$${dollar.format(sum)}?"),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("Proceed"),
                      onPressed: () {
                        cart.forEach((index) =>
                            history.add(History(
                                date: DateFormat('yyyy/MM/dd').format(now),
                                item: index.name,
                                price: "\$${dollar.format(index.price)}")));
                        cart.clear();
                        Navigator.of(context).pop();
                        sum = 0;
                      },
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
          }
        },
      ),
    );

  }

  Future<Null> _handleRefresh() async {
    Completer<Null> completer = new Completer<Null>();

    new Future.delayed(new Duration(seconds: 1)).then((_) {
      completer.complete();
      setState((){

      }
    });

    return completer.future;
  }
}
