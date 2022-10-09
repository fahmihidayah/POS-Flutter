import 'package:flutter/material.dart';
import 'package:pos/ui/screen/splash/page/splash_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PosApp extends MaterialApp {

  PosApp() : super(
    title: "Point of sales",
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: SplashPage(),
    localizationsDelegates: [
      AppLocalizations.delegate
    ],
    supportedLocales: [
      Locale('en', ''),
    ]
  );
}