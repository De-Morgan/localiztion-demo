
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/shared_pref.dart';
import 'localization_helper.dart';
import 'local_provider.dart';
import 'supported_locale.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreference.init();
  runApp(ProviderScope(child: LocalizationDemo()));

}

class LocalizationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context,
          T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
        final locale = watch(localeProvider);
        return MaterialApp(
          title: 'Localization Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          locale: locale,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('fr', 'FR'),
            Locale('ar'),
          ],
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            LocalizationHelper.delegate
          ],
          home: child,
        );
      },
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static const imageLocation = 'images/home_image.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${LocalizationHelper.of(context).appName}'),
        actions: [
          PopupMenuButton<SupportedLocale>(
            itemBuilder: (context) {
              return SupportedLocale.values
                  .map<PopupMenuEntry<SupportedLocale>>((e) => PopupMenuItem(
                        child: Text('${e.name}'),
                        value: e,
                      ))
                  .toList();
            },
            onSelected: (locale) {
              context.read(localeProvider.notifier).changeLanguage(locale);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 3,
            ),
            Image.asset(
              imageLocation,
              fit: BoxFit.cover,
            ),
            Spacer(),
            Text('${LocalizationHelper.of(context).description}',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline5),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}