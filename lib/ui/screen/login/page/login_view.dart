import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/ui/screen/login/bloc/login_bloc.dart';
import 'package:pos/ui/screen/login/form/bloc/login_form_bloc.dart';
import 'package:pos/ui/screen/login/form/widget/login_form_view.dart';
import 'package:pos/ui/screen/registration/page/registration_page.dart';
import 'package:pos/ui/widget/text_widget.dart';
import 'package:pos/util/logger/logger.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Point of sales",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              LoginFormView(),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      if (state is! LoginStateProgress) {
                        final loginFormBloc = context.read<LoginFormBloc>()
                          ..validate();
                        if (loginFormBloc.isValid()) {
                          context.read<LoginBloc>().emit(LoginStateProgress());
                          context.read<LoginBloc>().add(LoginEventSubmit(
                              email: loginFormBloc.email,
                              password: loginFormBloc.password));
                        }
                      }
                    },
                    child: state is LoginStateProgress ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ): Text("login") ), //Text("Login")),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return RegistrationPage();
                    }));
                  },
                  child: Text("Sign Up"),
                ),
              )
            ],
          );
        },
        listener: (context, state) {
          if (state is LoginStateResponse) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.userResponse?.message ?? "")));
          }
        },
      ),
    );
  }
}
