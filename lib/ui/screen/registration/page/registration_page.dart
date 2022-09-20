import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/ui/screen/registration/bloc/registration_bloc.dart';
import 'package:pos/ui/screen/registration/page/registration_view.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: RegistrationView(),
    );
  }
}
