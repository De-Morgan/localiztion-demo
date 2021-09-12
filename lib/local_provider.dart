

import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

enum SupportedLocale { en, fr, ar }

extension SupportedLocalExtension on SupportedLocale {
  String get name {
    String name;
    switch (this) {
      case SupportedLocale.en:
        name = 'English';
        break;
      case SupportedLocale.fr:
        name = 'French';
        break;
      case SupportedLocale.ar:
        name = 'Arabic';
        break;
    }
    return name;
  }
}

final supportedLocaleProvider = StateProvider<SupportedLocale>((ref)=>SupportedLocale.en);


final localeProvider = Provider<Locale>((ref){
  final supportedLocale = ref.watch(supportedLocaleProvider);
  Locale locale;
  switch(supportedLocale.state){
    case SupportedLocale.en:
      locale = Locale('en');
      break;
    case SupportedLocale.fr:
      locale = Locale('fr');
      break;
    case SupportedLocale.ar:
      locale = Locale('ar');
      break;
  }
  return  locale;
});