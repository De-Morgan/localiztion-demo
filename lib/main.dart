

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization_helper.dart';

void main() {
  runApp(LocalizationDemo());
}

class LocalizationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Localization Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
      home: HomePage(),
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
