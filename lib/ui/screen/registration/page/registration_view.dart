import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/ui/screen/registration/bloc/registration_bloc.dart';
import 'package:pos/ui/widget/container_widget.dart';
import 'package:pos/ui/widget/text_field_widget.dart';

class RegistrationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationViewState();
  }
}

class RegistrationViewState extends State<RegistrationView> {
  bool _isSwitchEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: BlocConsumer<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  MediumMarginContainer(
                      child: CommonTextField(
                    label: "Name",
                    inputType: TextInputType.name,
                    onChanged: (text) {},
                    onFocusChanged: (hasFocus, text) {},
                  )),
                  MediumMarginContainer(
                      child: CommonTextField(
                    label: "Mobile Number",
                    inputType: TextInputType.phone,
                    onChanged: (text) {},
                    onFocusChanged: (hasFocus, text) {},
                  )),
                  MediumMarginContainer(
                      child: CommonTextField(
                    label: "Email",
                    inputType: TextInputType.emailAddress,
                    onChanged: (text) {},
                    onFocusChanged: (hasFocus, text) {},
                  )),
                  MediumMarginContainer(
                      child: CommonTextField(
                    label: "Password",
                    inputType: TextInputType.text,
                    isPassword: true,
                    onChanged: (text) {},
                    onFocusChanged: (hasFocus, text) {},
                  )),
                  MediumMarginContainer(
                      child: CommonTextField(
                    label: "Password Confirmation",
                    inputType: TextInputType.text,
                    isPassword: true,
                    onChanged: (text) {},
                    onFocusChanged: (hasFocus, text) {},
                  )),
                  Row(children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          _isSwitchEnable = !_isSwitchEnable;
                        });
                      },
                      activeColor: Colors.blue,
                      value: _isSwitchEnable,
                    ),
                    Text("Send me news letter!s")
                  ]),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Sign Up"),
                    ),
                  )
                ],
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
