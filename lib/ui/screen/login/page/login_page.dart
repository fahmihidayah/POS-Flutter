import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/injection/main_injection.dart';
import 'package:pos/ui/screen/login/bloc/login_bloc.dart';
import 'package:pos/ui/screen/login/page/login_view.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => getIt.get<LoginBloc>()),
    ], child: LoginView());
  }
}
