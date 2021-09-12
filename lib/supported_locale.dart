enum SupportedLocale { en, fr, ar }

extension SupportedLocalExtension on SupportedLocale {
  String get code =>this.toString().split('.').last;
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