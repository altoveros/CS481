import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;


    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('This is my cat', style: TextStyle(
                    fontWeight: FontWeight.bold,),
                  ),
                ),
                Text('My Cat lived up to 16 years old', style: TextStyle(
                  color: Colors.grey[500],),
                ),

              ],
            ),
          ),
          Icon(Icons.favorite_border, color: Colors.red[500],),
          Text('16'),
        ],

      ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label){
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top:8),
              child: Text(
                label,
                style:TextStyle(
                  fontSize:12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        );
      }

    Widget buttonSection = Container(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          _buildButtonColumn(color, Icons.fastfood, 'Food'),
          _buildButtonColumn(color, Icons.account_balance_wallet, 'Wallet'),
          _buildButtonColumn(color, Icons.airplanemode_active, 'Airplane Mode'),
          _buildButtonColumn(color, Icons.airport_shuttle, "Airport Shuttle")
        ],

      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'This is my cat Smokey, she was a very old cat of mine.  '
            'I loved her very much and I miss her every single day.  '
            'She was the best thing that has ever happened to me.  '
            'When she passed away I got a tattoo of her paw print on me. '
            'I will never forget her',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Layout Homework',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Layout Homework'),
          ),
        body: ListView(
          children: [
            Image.asset(
              'images/smokey.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ]
        )
      )
    );
  }
}