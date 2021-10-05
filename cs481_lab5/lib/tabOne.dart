import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class TabOne extends StatelessWidget {

  double sum;


  TabOne(this.sum);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Grab a Fast Snack"),
            onPressed: (){
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Fast Snack!"),
                    duration: Duration(seconds: 1),
                  )
              );
            },
          ),
          RaisedButton(
            child: Text("Get a slow Snack"),
            onPressed: (){
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Slow Snack."),
                    duration: Duration(seconds: 4),
                  )
              );
            },
          ),
          RaisedButton(
            child: Text("Snack with dismiss"),
            onPressed: (){
              final snackBar = SnackBar (
                content: Text('Click dismiss to close'),
                duration: Duration(days: 365),
                action: SnackBarAction(
                  label: 'Dismiss',
                  onPressed: () => null,
                )
              );
              Scaffold.of(context).showSnackBar(snackBar);
            }
          )
        ],
      ),
    );
  }
}
