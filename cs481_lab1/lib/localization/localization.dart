import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization{
  final Locale locale;

  Localization(this.locale);

  static Localization of(BuildContext context){
    return Localizations.of<Localization>(context, Localization);
  }

  Map<String, String> _localziedValues;

  Future load()async{
    String jsonStringValues =
        await rootBundle.loadString('lib/languages/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localziedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslation(String key){
    return _localziedValues[key];
  }

  static const LocalizationsDelegate<Localization> delegate = LocalizationDelegate();
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {

  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale){
    return['en','es','ar','fr',].contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) async {
   Localization localization = new Localization(locale);
   await localization.load();
   return localization;
  }

  @override
  bool shouldReload(LocalizationDelegate old)=>false;
}