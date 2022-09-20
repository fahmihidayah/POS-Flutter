import 'package:flutter/material.dart';
import 'package:pos/app.dart';
import 'package:pos/data/datasource/remote/common_api.dart';
import 'package:pos/injection/main_injection.dart';

void main() {
  mainInitial();
  final commonApi = getIt.get<CommonApi>();
  debugPrint("is api null ${commonApi}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PosApp();
  }
}