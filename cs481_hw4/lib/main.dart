import 'package:flutter/material.dart';







void main() => runApp(LogoApp());


class LogoApp extends StatefulWidget{
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Animation<double> animation2;


  void initState(){
    super.initState();
        controller =
            AnimationController(duration: const Duration(seconds:1), vsync: this);
        animation = CurvedAnimation(parent:controller, curve: Curves.bounceIn)
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        controller.forward();

      }

    })
    ..addStatusListener((state) => print('$state'));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation:animation);





  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }
}




class AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 50, end: 350);




  AnimatedLogo({Key key, Animation<double> animation})
      :super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: Image.asset(
              'images/spongebob.jpg'

          ),
        ),
      ),

    );
  }
}



