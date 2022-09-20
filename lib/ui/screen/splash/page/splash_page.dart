

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/data/datasource/remote/common_api.dart';
import 'package:pos/data/repository/common_repository.dart';
import 'package:pos/injection/main_injection.dart';
import 'package:pos/ui/screen/splash/bloc/splash_bloc.dart';
import 'package:pos/ui/screen/splash/page/splash_view.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt.get<SplashBloc>(),
    child: SplashView(),);
  }
}