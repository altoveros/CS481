import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lab1_project/localization/localization.dart';


class Cupertino extends StatefulWidget {
  @override
  _CupertinoState createState() => _CupertinoState();
}

class _CupertinoState extends State<Cupertino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoAlertDialog(
        title: Text(Localization.of(context).getTranslation('cupertino_title')),      //TODO: change text
        content: SingleChildScrollView(
          child: ListBody(
          children: <Widget>[
            Text(Localization.of(context).getTranslation('cupertino_box')),                 //TODO: change text
            SizedBox(height: 10),
          ],
        ),
      ),
    actions: <Widget>[
      FlatButton(
        child: Text(Localization.of(context).getTranslation('cupertino_close')),                 //TODO: update for localization
        onPressed: (){
          Navigator.of(context).pop();
        },
      )
    ],
      ),
    );
  }
}
