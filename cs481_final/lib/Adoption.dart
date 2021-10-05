import 'package:final_app/adoptmap.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Adopt extends StatefulWidget {
  @override
  _Adopt createState() => _Adopt();
}

class _Adopt extends State<Adopt> {

  List<PageViewModel> getPages(){
    return[
        PageViewModel(
          image: Image.asset('images/slide1.png'),
          title: 'Why Adopt?',
          body: 'There are many reasons you should adopt a dog but the real question is why not?',
          footer: Text('Scroll to find out why adoption is important'),
        ),
      PageViewModel(
        image: Image.asset('images/slide2.jpg'),
        title: 'Adoption Saves Lives',
        body: '670,000 dogs are euthanized in shelters across the United States every year!',
        footer: Text('Adoption gives these dogs a second chance'),
      ),
      PageViewModel(
        image: Image.asset('images/slide3.gif'),
        title: 'Adopting Costs Less!',
        body: 'Sheltered dogs are all microchiped, spayed or neutered, vacinated and dewormed! This is typically covered by the adoption fee.',
        footer: Text('A breeder is far more expensive than a shelter'),
      ),
      PageViewModel(
        image: Image.asset('images/slide4.jpg'),
        title: 'You Want A Purebred?',
        body: 'Well your in luck because 25% of shelter dogs are in fact purebred!',
        footer: Text('You should always start at a shelter'),
      ),
      PageViewModel(
        image: Image.asset('images/slide5.jpg'),
        title: 'How To Adopt',
        body: 'All shelters have a process that typically involves an application, an interview and an initial meet with the dog.',
        footer: Text('So give a dog a second chance!'),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Adoption Matters", style: TextStyle(fontSize: 18)),
            backgroundColor: Colors.cyan,
         ),
          body: IntroductionScreen(
            done: Text('View Adoption Centers', style: TextStyle(color: Colors.black)),
          onDone: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdoptMap()));
          },
        pages: getPages(),
        ),
      );
   }
}