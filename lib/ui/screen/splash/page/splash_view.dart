import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/ui/screen/login/page/login_page.dart';
import 'package:pos/ui/screen/splash/bloc/splash_bloc.dart';

class SplashView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashViewState();
  }

}

class SplashViewState extends State<SplashView> {

  @override
  void initState() {
    context.read<SplashBloc>().add(SplashEventInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(builder: (context, state) {

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("My Point of Sales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
            ,
            SizedBox(height: 30,),
            Center(
              child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2),),
            )

          ],
        );
      }, listener: (context, state) {
        if(state is SplashStateFinish) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              }
          ));
        }
      }),
    );
  }
}
