import 'dart:ui';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _Home createState() => _Home();
}


class _Home extends State<Home>
{
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context)
  {
    return ListView(
      children: <Widget>[
        _buildContact(Icons.account_circle, "CJ Trujillo"),
        _buildContact(Icons.account_circle, "Gintas"),
        _buildContact(Icons.account_circle, "Howard Tep"),
        _buildContact(Icons.account_circle, "Ian A."),
      ],
    );
  }

  ListTile _buildContact(IconData icon, String name) {
    return ListTile(
      leading: Icon(icon, size: 50),
      title: Text(name),
      onTap: () {print(name);},    //TODO: open bottom sheet
    );
  }
}
