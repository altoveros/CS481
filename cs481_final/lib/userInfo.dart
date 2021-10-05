import 'package:flutter/material.dart';
import 'global.dart';
import 'dart:ui';
import 'editInfo.dart';
import 'authentication_service.dart';

class personalInfo extends StatefulWidget {
  @override
  _personalInfo createState() => _personalInfo();
}

class _personalInfo extends State<personalInfo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Info'), backgroundColor: Colors.red,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: ListTile(
                      leading: userName == null ? Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)) :
                      Text(userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                      trailing: RaisedButton.icon(icon: Icon(Icons.edit), label: Text("Edit"), color: Colors.red[100],
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => changeInfo())).then((value) {
                            setState(() {});
                          });}
                        //onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => changeInfo()));}
                      ),
                    )),

                Divider(color: Colors.red[100], thickness: 2.5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                        spacing: 10.0,
                        children: <Widget>[
                          ListTile(leading: Tooltip(message: 'Phone Number', child: Icon(Icons.phone, color: Colors.black),),
                            title: userPhone == null ? Text("Phone Number") :
                            Text(userPhone),),
                          Divider(color: Colors.red[100]),

                          ListTile(leading: Tooltip(message: 'Address', child: Icon(Icons.home, color: Colors.black)),
                            title: userAddr == null ? Text(/*16221 Beverly Capital, Los Angeles, CA 94133*/"Address") :
                            Text(userAddr),),
                          Divider(color: Colors.red[100]),

                          ListTile(leading: Tooltip(message: 'Email', child: Icon(Icons.mail, color: Colors.black)),
                              title: userEmail == null ? Text("Email") :
                              Text(userEmail)),
                          Divider(color: Colors.red[100]),

                          Divider(color: Colors.white, height: 40),
                          Text('Hobbies', style: TextStyle(fontSize:20)),
                          Divider(),
                          hobby(),
                          Divider(),
                          hobby2(),
                          Divider(),
                          hobby3(),
                        ]
                    ),
                  ),
                ),
                //Divider(color: Colors.black),
              ],
            ),
          )
      ),
    );
  }

}


class hobby extends StatefulWidget {
  @override
  _hobby createState() => _hobby();
}

class _hobby extends State<hobby> {
  bool running = false;
  bool biking = false;
  bool travel = false;
  bool tool = false;

  @override

  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Running',
                  child: IconButton(icon: running ? Icon(Icons.directions_run, color: Colors.red) :
                  Icon(Icons.directions_run, color: Colors.grey), onPressed: toggleRunning)
              )
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Biking',
                  child: IconButton(icon: biking ? Icon(Icons.directions_bike, color: Colors.red) :
                  Icon(Icons.directions_bike, color: Colors.grey), onPressed: toggleBiking)
              )
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Traveling',
                  child: IconButton(icon: travel ? Icon(Icons.card_travel, color: Colors.red) :
                  Icon(Icons.card_travel, color: Colors.grey), onPressed: toggleTravel)
              )
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Building',
                  child: IconButton(icon: tool ? Icon(Icons.build, color: Colors.red) :
                  Icon(Icons.build, color: Colors.grey), onPressed: toggleTool)
              )
          )
        ]
    );
  }


  void toggleRunning() {
    setState(() {
      if (running) running = false;
      else running = true;
    });
  }

  void toggleBiking() {
    setState(() {
      if (biking) biking = false;
      else biking = true;
    });
  }

  void toggleTravel() {
    setState(() {
      if (travel) travel = false;
      else travel = true;
    });
  }

  void toggleTool() {
    setState(() {
      if (tool) tool = false;
      else tool = true;
    });
  }
}

class hobby2 extends StatefulWidget {
  @override
  _hobby2 createState() => _hobby2();
}

class _hobby2 extends State<hobby2> {
  bool bake = false;
  bool shop = false;
  bool read = false;
  bool film = false;

  bool game = false;
  bool investing = false;
  bool sleeping = false;
  bool music = false;
  @override

  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Baking',
                  child: IconButton(icon: bake ? Icon(Icons.cake, color: Colors.red) :
                  Icon(Icons.cake, color: Colors.grey), onPressed: toggleBake)
              )
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Shopping',
                  child: IconButton(icon: shop ? Icon(Icons.shopping_cart, color: Colors.red) :
                  Icon(Icons.shopping_cart, color: Colors.grey), onPressed: toggleShop)
              )
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Reading',
                  child: IconButton(icon: read ? Icon(Icons.book, color: Colors.red) :
                  Icon(Icons.book, color: Colors.grey), onPressed: toggleRead)
              )
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Filming',
                  child: IconButton(icon: film ? Icon(Icons.video_call, color: Colors.red) :
                  Icon(Icons.video_call, color: Colors.grey), onPressed: toggleFilm)
              )
          )
        ]
    );
  }


  void toggleBake() {
    setState(() {
      if (bake) bake = false;
      else bake = true;
    });
  }

  void toggleShop() {
    setState(() {
      if (shop) shop = false;
      else shop = true;
    });
  }

  void toggleRead() {
    setState(() {
      if (read) read = false;
      else read = true;
    });
  }

  void toggleFilm() {
    setState(() {
      if (film) film = false;
      else film = true;
    });
  }
}

class hobby3 extends StatefulWidget {
  @override
  _hobby3 createState() => _hobby3();
}

class _hobby3 extends State<hobby3> {
  bool game = false;
  bool invest = false;
  bool sleep = false; //hotel
  bool music = false; //listening to music
  @override

  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Gaming',
                  child: IconButton(icon: game ? Icon(Icons.videogame_asset, color: Colors.red) :
                  Icon(Icons.videogame_asset, color: Colors.grey), onPressed: toggleGame)
              )
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Investing',
                  child: IconButton(icon: invest ? Icon(Icons.attach_money, color: Colors.red) :
                  Icon(Icons.attach_money, color: Colors.grey), onPressed: toggleInvest)
              )
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Listening to Music',
                  child: IconButton(icon: music ? Icon(Icons.music_note, color: Colors.red) :
                  Icon(Icons.music_note, color: Colors.grey), onPressed: toggleMusic)
              )
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Tooltip(
                  message: 'Sleeping',
                  child: IconButton(icon: sleep ? Icon(Icons.hotel, color: Colors.red) :
                  Icon(Icons.hotel, color: Colors.grey), onPressed: toggleSleep)
              )
          )
        ]
    );
  }


  void toggleGame() {
    setState(() {
      if (game) game = false;
      else game = true;
    });
  }

  void toggleInvest() {
    setState(() {
      if (invest) invest = false;
      else invest = true;
    });
  }

  void toggleMusic() {
    setState(() {
      if (music) music = false;
      else music = true;
    });
  }

  void toggleSleep() {
    setState(() {
      if (sleep) sleep = false;
      else sleep = true;
    });
  }
}