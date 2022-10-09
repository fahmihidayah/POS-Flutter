import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pos/config/extensions/context_extensions.dart';
import 'package:pos/ui/screen/login/bloc/login_bloc.dart';
import 'package:pos/ui/screen/registration/page/registration_page.dart';
import 'package:pos/ui/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          print("state ${state.email} ${state.password}");
          return Form(
              key: _formKey,
              child: Column(
                key: UniqueKey(),
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    key: UniqueKey(),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Point of sales",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    key: UniqueKey(),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: CommonTextField(
                      key: ObjectKey("email"),
                      label: context.string.email,
                      text: state.email ?? "",
                      inputType: TextInputType.emailAddress,
                      isPassword: false,
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .add(LoginEventEmailChanged(text: value ?? ""));
                      },
                      onValidate: ValidationBuilder().email().build(),
                      enableAutoValidate: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: CommonTextField(
                      key: ObjectKey("password"),
                      label: context.string.password,
                      text: state.password ?? "",
                      inputType: TextInputType.text,
                      isPassword: true,
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .add(LoginEventPasswordChanged(text: value ?? ""));
                      },
                      onSaved: (value) {
                        context
                            .read<LoginBloc>()
                            .add(LoginEventPasswordChanged(text: value ?? ""));
                      },
                      onValidate: ValidationBuilder().minLength(8).build(),
                      enableAutoValidate: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            context.read<LoginBloc>().add(LoginEventSubmit());
                          }
                        },
                        child: state.isProgress == true
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text("login")), //Text("Login")),
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
              ));
        },
        listener: (context, state) {
          if (state.isSuccess == true) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.userResponse?.message ?? "")));
          } else if (state.isSuccess == false) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.userResponse?.message ?? "")));
          }
        },
      ),
    );
  }
}
