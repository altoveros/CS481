//bare bones for the alert dialog
// needs: custom text

import 'package:flutter/material.dart';
import 'package:lab1_project/localization/localization.dart';
//import 'generated/l10n.dart';       //for localization?

class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: Text(Localization.of(context).getTranslation('alert_title')),                 //TODO: change text
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(Localization.of(context).getTranslation('alert_box')),         //TODO: change text
              SizedBox(height: 10,),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(Localization.of(context).getTranslation('alert_close')),                     //TODO: change text for localization
            onPressed: () {
              Navigator.of(context).pop();      //closes dialog box?
            },
          ),
        ],
      ),
    );
  }
}