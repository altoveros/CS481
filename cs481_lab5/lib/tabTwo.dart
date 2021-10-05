import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class TabTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(children: <Widget>[
              Container(
                child: Image.asset('images/Puppy.jpg', width: 800, height: 400, fit: BoxFit.cover)
              ),
              Container(child: Row(children: <Widget> [
                Container(
                  margin: EdgeInsets.all(25),
                  child: Tooltip(
                    message: 'High Quality',
                    child: Icon(Icons.high_quality, size: 50, color: Colors.yellow[900])
                   )),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Tooltip(
                    message: 'Full Screen',
                    child: Icon(Icons.fullscreen, size: 50, color: Colors.red[900]),
                  )),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Tooltip(
                    message: 'Filter',
                    child: Icon(Icons.filter, size: 40, color: Colors.blue)
                   )),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Tooltip(
                    message: 'Share',
                    child: FlatButton(
                      child: Icon(
                        Icons.share, size: 40, color: Colors.black),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              color: Colors.blueGrey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text('Share', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                                    RaisedButton.icon(
                                      icon: Icon(Icons.email),
                                      label: Text('Email'),
                                      onPressed: () => null,
                                    ),
                                    RaisedButton.icon(
                                      icon: Icon(Icons.textsms),
                                      label: Text('Text'),
                                      onPressed: () => null,
                                    ),
                                    RaisedButton(
                                      child: const Text('Close'),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ))
                ),
              ]
              ),
              ),
            ])
        )
    );
  }
}
