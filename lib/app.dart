import 'package:flutter/material.dart';
import 'package:pos/ui/screen/splash/page/splash_page.dart';

class PosApp extends MaterialApp {

  PosApp() : super(
    title: "Point of sales",
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: SplashPage()
  );
}