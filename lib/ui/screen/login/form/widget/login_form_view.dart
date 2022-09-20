import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pos/ui/screen/login/form/bloc/login_form_bloc.dart';
import 'package:pos/ui/widget/text_widget.dart';
import 'package:pos/util/logger/logger.dart';

class LoginFormView extends StatefulWidget {


  @override
  State createState() {
    return LoginFormViewState();
  }
}

class LoginFormViewState extends State<LoginFormView> {

  final _emailValidation = ValidationBuilder().email().build();
  final _passwordValidation = ValidationBuilder().minLength(8).build();

  String? _emailErrorMessage = "";
  String? _passwordErrorMessage = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(builder: (context, state) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: CommonTextField(
              label: "Email",
              text: context.read<LoginFormBloc>().email,
              inputType: TextInputType.emailAddress,
              isPassword: false,
              onChange: (text) {
                context.read<LoginFormBloc>().add(LoginFormEmailEvent(text));
              },
              onFocusChanged: (hasFocus, text) {
                if(!hasFocus) {
                  setState(() {
                    _emailErrorMessage = _emailValidation(text);
                  });
                }
              },
              errorMessage: _emailErrorMessage,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: CommonTextField(
              label: "Password",
              text: context.read<LoginFormBloc>().password,
              inputType: TextInputType.text,
              isPassword: true,
              onChange: (text) {
                context.read<LoginFormBloc>().add(LoginFormPasswordEvent(text));
              },
              onFocusChanged: (hasFocus, text) {
                if(!hasFocus) {
                  setState(() {
                    _passwordErrorMessage = _passwordValidation(text);
                  });
                }
              },
              errorMessage: _passwordErrorMessage,
            ),
          ),
        ],
      );
    });
  }
}
