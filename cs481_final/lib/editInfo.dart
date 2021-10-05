import 'package:flutter/material.dart';
import 'global.dart';
import 'dart:ui';

class changeInfo extends StatefulWidget {
  @override
  _changeInfo  createState() => _changeInfo();
}

class _changeInfo  extends State<changeInfo > {

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return Scaffold(
        appBar: AppBar( title: Text("Update Info")),
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Container(
                        child:  new TextField(
                          //controller: nameController,
                          decoration: new InputDecoration(hintText: "Enter Name"),
                          onSubmitted: (String str) {
                            setState(() {
                              userName = str;
                            });
                          },
                        ),
                      ),
                      Divider(),

                      Container(
                        child:  new TextField(
                          //controller: nameController,
                          decoration: new InputDecoration(hintText: "Enter Phone Number"),
                          onSubmitted: (String str) {
                            setState(() {
                              userPhone = str;
                            });
                          },
                        ),
                      ),
                      Divider(),

                      Container(
                        child:  new TextField(
                          //controller: nameController,
                          decoration: new InputDecoration(hintText: "Enter Address"),
                          onSubmitted: (String str) {
                            setState(() {
                              userAddr = str;
                            });
                          },
                        ),
                      ),
                      Divider(),

                      Container(
                        child:  new TextField(
                          //controller: nameController,
                          decoration: new InputDecoration(hintText: "Enter Email"),
                          onSubmitted: (String str) {
                            setState(() {
                              userEmail = str;
                            });
                          },
                        ),
                      ),
                      Divider(),

                      Container(
                        child: Text("Please click the check button after every input!",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                      ),
                      Divider(),

                      Expanded(
                          child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: MaterialButton(
                                  color: Colors.grey[300],
                                  onPressed: () {Navigator.pop(context);},
                                  //onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => personalInfo())),
                                  //onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => personalInfo()));},
                                  child: Text('Update Info', style: TextStyle(fontSize: 24)))
                          )
                      )
                    ]
                )
            )
        )
    );
  }

}