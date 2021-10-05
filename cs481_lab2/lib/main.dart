//
// Group 5: CJ Trujillo, Ian Altoveros, Gintas Kazlauskas, Howard Tep
// 10/20/20
// CS 481 Lab 2
// Navigation Bar and Bottom Sheets
// Select contacts to have contact info show in a bottom sheet
// In progress: create cupertino & simple dialogs, assign them to buttons,
//    switch between contacts, recent and new contact in the navbar,
//    select menu button and contact settings to have contact settings popup
//    in bottom sheet
//
// Citation: api.flutter.dev
//
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const String _title = 'Lab 2 Sample';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyHomePage(),
    );
  }
}



class NewContact extends StatefulWidget{
  @override
  _NewContact createState() => _NewContact();
}


class _NewContact extends State<NewContact>
{
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Contact Field Empty!';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phone Number',
            ),
            validator: (value){
              if(value.isEmpty){
                return 'Phone Number is Empty!';
              }
              return null;
            },

          ),
          Padding(
            padding: const
            EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Contact successfully added!')));
                }
              },
              child: Text('Add Contact', style: TextStyle(fontWeight: FontWeight.bold)),
              color: Colors.blue[100],
            ),
          ),
        ],
      ),
    );
  }
}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 35, fontWeight: FontWeight.bold, fontStyle:FontStyle.italic, color: Colors.white);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    //EditContacts(),
    /*Text(
          'Contacts',
          style: TextStyle(color: Colors.black),
        ),*/
    ViewRecents(),
    /*Text(
          'Recents',
          style: TextStyle(color: Colors.black),
        ),*/
    NewContact(),
    // _newContact(),


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group 5's Contact List"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (result){
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.blue[100],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Contacts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black38)),
                          RaisedButton(
                            child: const Text('View Contacts'),
                            onPressed: () => null,                //this would lead to contact list
                            color: Colors.blue[300],
                          ),
                          RaisedButton(
                            child: const Text('Edit Contacts'),
                            onPressed: () => null,                //this would lead to edit contacts list
                            color: Colors.blue[300],
                            //onPressed: () {Navigator.pushReplacementNamed(context, '/');},
                          ),
                          RaisedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                            color: Colors.blue[300],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text("Contact Settings"),
              ),
            ],
          ),
        ],
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        iconSize: 30,
        unselectedFontSize: 13,
        selectedFontSize: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar),
            title: Text('Contacts'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.autorenew),
            title: Text('Recents'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create_new_folder),
            title: Text('New Contact'),
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class ViewRecents extends StatefulWidget {
  @override
  _ViewRecentsState createState() => _ViewRecentsState();
}
class _ViewRecentsState extends State<ViewRecents> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildRecent(Icons.call_received, "760-475-5741"),
        _buildRecent(Icons.call_made, "855-541-4712"),
        _buildRecent(Icons.call_missed, "1-800-875-8582"),
        _buildRecent(Icons.call_received, "619-578-5423"),
      ],
    );
  }
  ListTile _buildRecent(IconData icon, String name) {
    return ListTile(
      leading: Icon(icon, size: 50),
      title: Text(name),
      onTap: () => _showBottomSheetCallback(),
    );
  }
  void _showBottomSheetCallback() {
    Scaffold.of(context).showBottomSheet<void>((BuildContext context) {
      return Container(
        height: 200,
        color: Colors.blue,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.phone, size: 50,),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.textsms, size: 50,),
                color: Colors.white,
              ),
            ],
          ),
        ),
      );
    });
  }


}

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
        ListTile(
          leading: Icon(Icons.account_circle, size:50),
          title: Text('CJ Trujillo'),
          onTap: () => _onButtonPressed(),
        ),
        new Divider(
          height: 1.0,
          indent: 1.0,
        ),
        ListTile(
          leading: Icon(Icons.account_circle, size:50),
          title: Text('Gintas'),
          onTap: () => _onButtonPressed2(),
        ),
        new Divider(
          height: 1.0,
          indent: 1.0,
        ),
        ListTile(
          leading: Icon(Icons.account_circle, size:50),
          title: Text('Howard Tep'),
          onTap: () => _onButtonPressed3(),
        ),
        new Divider(
          height: 1.0,
          indent: 1.0,
        ),
        ListTile(
          leading: Icon(Icons.account_circle, size:50),
          title: Text('Ian Altoveros'),
          onTap: () => _onButtonPressed4(),
        ),
      ]

    );
  }

  ListTile _buildContact(IconData icon, String name) {
    return ListTile(
      leading: Icon(icon, size: 50),
      title: Text(name),
      onTap: () => _onButtonPressed(),
    );
  }

  void _onButtonPressed()
  {
    showModalBottomSheet(
    context: context,
        builder: (context){
      return Container(
        child: Container(
          child: _buildBottomNavigationMenu(),
        ),
      );
    });
  }

  Column _buildBottomNavigationMenu(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Center(
          child: Icon(Icons.account_box, size: 200, color: Colors.grey,),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('858-123-4567')
        ),
      ]
    );
  }


  void _onButtonPressed2()
  {
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            child: Container(
              child: _buildBottomNavigationMenu2(),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu2(){
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Icon(Icons.account_box, size: 200, color: Colors.grey,),
          ),
          ListTile(
              leading: Icon(Icons.phone),
              title: Text('240-543-6667')
          ),
        ]
    );
  }

  void _onButtonPressed3()
  {
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            child: Container(
              child: _buildBottomNavigationMenu3(),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu3(){
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Icon(Icons.account_box, size: 200, color: Colors.grey,),
          ),
          ListTile(
              leading: Icon(Icons.phone),
              title: Text('619-777-5232')
          ),
        ]
    );
  }

  void _onButtonPressed4()
  {
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            child: Container(
              child: _buildBottomNavigationMenu4(),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu4(){
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Icon(Icons.account_box, size: 200, color: Colors.grey,),
          ),
          ListTile(
              leading: Icon(Icons.phone),
              title: Text('760-156-7135')
          ),
        ]
    );
  }

}


class Contacts{
  final int id;
  final String name;
  final int number;

  Contacts(this.id, this.name, this.number);
}
