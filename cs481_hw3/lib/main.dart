import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;

    Column _buildButton(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         _buildButton(color, Icons.favorite_border, 'Favorite')
        ],
      ),

    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Do you find this funny?', style:TextStyle(
                  fontWeight: FontWeight.bold,),
                ),
                ),
                Text('Yes or No', style:TextStyle(
                  color: Colors.red[500],)
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Widget textSection2 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Do you find this Cute?', style:TextStyle(
                    fontWeight: FontWeight.bold,),
                  ),
                ),
                Text('Yes or No', style:TextStyle(
                  color: Colors.red[500],)
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Widget textSection3 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Is this food or animals?', style:TextStyle(
                    fontWeight: FontWeight.bold,),
                  ),
                ),
                Text('Yes or No', style:TextStyle(
                  color: Colors.red[500],)
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Widget textSection4 = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Do you find this pretty?', style:TextStyle(
                    fontWeight: FontWeight.bold,),
                  ),
                ),
                Text('Yes or No', style:TextStyle(
                  color: Colors.red[500],)
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    return MaterialApp(
        title: 'Homework 3',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Interactable Homework'),
            ),
            body: ListView(
              children:[
                Image.asset(
                  'Images/funny.jpg',
                      width: 600,
                      height: 200,
                  fit: BoxFit.cover
                ),
                textSection,
                Image.asset(
                  'Images/cute.jpg',
                    width: 600,
                    height: 200,
                  fit: BoxFit.cover
                ),
                textSection2,
                Image.asset(
                  'Images/Misleading.jpg',
                  width: 600,
                  height: 200,
                  fit: BoxFit.cover

                ),
                textSection3,
                Image.asset(
                  'Images/pretty.jpg'
                ),
                textSection4,



          ]
            ),

        ),
    );
  }

}

class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}



class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 39;
  @override


  Widget build(BuildContext context) {
    void _toggleFavorite() {
      setState(() {
        if (_isFavorited) {
          _favoriteCount -= 1;
          _isFavorited = false;
        } else {
          _favoriteCount += 1;
          _isFavorited = true;
        }
      });
    }
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (_isFavorited ? Icon(Icons.favorite) : Icon(
                  Icons.favorite_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
            ),
          ),
          SizedBox(
              width: 18,
              child: Container(
                child: Text('$_favoriteCount'),
              )
          )
        ]
    );
  }


}




