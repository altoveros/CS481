import 'package:flutter/material.dart';

class TabThree extends StatelessWidget {
  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/Background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ProfilePic.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(90.0),
          border: Border.all(
            color: Colors.white,
            width: 5.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    return Text('My Name', style: TextStyle(fontSize: 18));
  }

  Widget _buildBio(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'This is an example of a user profile',
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 18)
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 150),
                  _buildProfileImage(),
                  _buildFullName(),
                  SizedBox(height: 50.0),
                  _buildBio(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}