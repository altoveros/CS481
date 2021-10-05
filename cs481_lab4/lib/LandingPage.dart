import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState(){
    _animationController= AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000)
    );
    _animationController.forward();
    super.initState();
    Timer(Duration(seconds: 5), ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
                opacity: 1,
                child: Image.asset('images/background.jpg',
                    fit: BoxFit.cover,
                  height: 800,
                ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(.05,1),
                end: Offset(.05,.4),
                ).animate(_animationController),
            child: FadeTransition(
              opacity: _animationController,
               child: Container(
                   child: Image.asset('images/animation.gif',
                      )
               ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0,-4),
                end: Offset(0,-3),
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: Container(
                    child: Image.asset('images/sombrero.png',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 150,
                    )
                ),
              ),
            ),
          SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1,0),
                end: Offset(0,-1.8),
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: Container(
                    child: Image.asset('images/mustache.png',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 150,
                    )
                ),
              ),
          ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1,-1.20),
                end: Offset(.05,-1.20),
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: Container(
                    child: Image.asset('images/mariachis.png',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 300,
                    )
                ),
              ),
            ),
            ]
           ),
        ),
      );
  }
}


