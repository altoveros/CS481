//
// Group 5: CJ Trujillo, Ian Altoveros, Gintas Kazlauskas, //TODO: Add your names
// 10/13/20
// CS 481 Lab 1
// Internationalization, localization & dialog
// Select buttons to show dialog boxes, use corner button to change languages
//  default language english
// In progress: create cupertino & simple dialogs, assign them to buttons
//      add languages & strings
// Citation:
//    Dialogboxes: Group 1's Slideshow
//    Localization: flutter.dev/docs, PodCoder https://www.youtube.com/watch?v=leUDOBak2NA
//    Buttons: api.flutter.dev
//

import 'dart:ffi';
import 'localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'cupertino.dart';
import 'alert.dart';
import 'simple.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale locale){
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}
  // this widget is the root of your application.

class _MyAppState extends State<MyApp>{
  Locale _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: _locale,
      localizationsDelegates: [
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en','US'),
        const Locale('es','MX'),
        const Locale('ar','AE'),
        const Locale('fr','FR'),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales){
        for(var locale in supportedLocales){
          if(locale.languageCode == deviceLocale.languageCode && locale.countryCode == deviceLocale.countryCode){
            return deviceLocale;
          }
        }

        return supportedLocales.first;
      },

      home: MyHomePage(title: 'Lab 1: Group 5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void changeLanguage(Language language){
    Locale _temp;
    switch(language.languageCode) {
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;
      case 'es':
        _temp = Locale(language.languageCode, 'MX');
        break;
      case 'ar':
        _temp = Locale(language.languageCode, 'AE');
        break;
      case 'fr':
        _temp = Locale(language.languageCode, 'FR');
        break;
      default:
        _temp = Locale(language.languageCode, 'US');
    }

    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(padding: EdgeInsets.all(8.0),
          child: DropdownButton(
            onChanged: (Language language){
              changeLanguage(language);
            },
            underline: SizedBox(),
            icon: Icon(Icons.language, color: Colors.white,
            ),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                   value: lang,
                   child: Row(
                   children: <Widget>[Text(lang.name)],
                   ),
                  ))
            .toList(),
           ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Localization.of(context).getTranslation('main_text'),
            ),
            ButtonTheme(
              minWidth: 150.0,
              height: 40.0,
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Alert();
                    },
                  );
                },
                child: Text(Localization.of(context).getTranslation('alert_dialog')),
                textColor: Colors.white,
              ),
            ),
            ButtonTheme(
              minWidth: 150.0,
              height: 40.0,
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Cupertino();
                    },
                  );
                },
                child: Text(Localization.of(context).getTranslation('cupertino_dialog')),
                textColor: Colors.white,
              ),
            ),
            ButtonTheme(
              minWidth: 150.0,
              height: 40.0,
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Simple();       //TODO: point to Simple dialog not alert
                    },
                  );
                },
                child: Text(Localization.of(context).getTranslation('simple_dialog')),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Language {
  final int id;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> languageList(){
    return<Language>[
      Language(1, 'English', 'en'),
      Language(2, 'Spanish', 'es'),
      Language(3, 'Arabic', 'ar'),
      Language(3, 'French', 'fr'),
    ];
  }
}


