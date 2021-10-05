import 'package:flutter/material.dart';
import 'package:lab1_project/localization/localization.dart';

class Simple extends StatefulWidget {
  @override
  _SimpleState createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleDialog(
        title: Text(Localization.of(context).getTranslation('simple_main'), textAlign: TextAlign.center),
            children: <Widget>[
              Text(Localization.of(context).getTranslation('simple_box'), textAlign: TextAlign.center),
        SizedBox(height:10,),
        SimpleDialogOption(
          onPressed: () {Navigator.pushReplacementNamed(context, '/');},
          child: Text(Localization.of(context).getTranslation('simple_1box')),
        ),
        SimpleDialogOption(
          onPressed: () {Navigator.pushReplacementNamed(context, '/');},
          child: Text(Localization.of(context).getTranslation('simple_2box')),
        ),
        SimpleDialogOption(
          onPressed: () {Navigator.pushReplacementNamed(context, '/');},
          child: Text(Localization.of(context).getTranslation('simple_3box')),
        ),
        ],
      ),
    );
  }
}