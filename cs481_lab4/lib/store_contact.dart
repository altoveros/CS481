import 'package:flutter/material.dart';

class StoreContact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Info'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text('Group 5\'\s Mexican Restaurant', style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                //Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Wrap(
                        spacing: 10.0,
                        children: <Widget>[
                          ActionChip(
                              avatar: CircleAvatar(
                                backgroundColor: Color.fromARGB(
                                    0, 250, 250, 250),
                                foregroundColor: Colors.black,
                                child: Icon(Icons.phone),
                              ),
                              label: Text('Call'),
                              tooltip: 'Call the provider',
                              onPressed: () {
                                print('Calling Provider');
                              }
                          ),
                          ActionChip(
                              avatar: CircleAvatar(
                                backgroundColor: Color.fromARGB(
                                    0, 250, 250, 250),
                                foregroundColor: Colors.black,
                                child: Icon(Icons.email),
                              ),
                              label: Text('Email'),
                              tooltip: 'Email the provider',
                              onPressed: () {
                                print('Processing Email');
                              }
                          ),
                          ActionChip(
                              avatar: CircleAvatar(
                                backgroundColor: Color.fromARGB(
                                    0, 250, 250, 250),
                                foregroundColor: Colors.black,
                                child: Icon(Icons.tv),
                              ),
                              label: Text('Website'),
                              clipBehavior: Clip.hardEdge,
                              tooltip: 'Visit the website',
                              onPressed: () {
                                print('Visiting The Website');
                              }
                          ),
                        ]
                    ),
                  ),
                ),
                Divider(color: Colors.black),
              ],
            ),
          )
      ),
    );
  }
}