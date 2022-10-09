import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos/util/logger/logger.dart';

class CommonTextField extends StatefulWidget {
  final String label;
  final TextInputType inputType;
  final bool isPassword;
  void Function(String value)? onChanged;
  void Function(bool value, String text)? onFocusChanged;
  String? Function(String? value)? onValidate;
  bool _isPasswordVisible = false;
  void Function(String?)? onSaved;
  String? errorMessage;
  bool? enableAutoValidate;
  TextEditingController textController = TextEditingController();

  CommonTextField(
      {super.key,
      required this.label,
      String text = "",
      this.inputType = TextInputType.text,
      this.isPassword = false,
      this.onChanged,
      this.onFocusChanged,
      this.onValidate,
      this.onSaved,
      this.errorMessage,
      this.enableAutoValidate})
      : _isPasswordVisible = isPassword ? true : false {
    if (text.isNotEmpty) {
      textController.text = text;
    }
  }

  @override
  State createState() {
    return CommonTextFieldState();
  }
}

class CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Focus(
        key: UniqueKey(),
        onFocusChange: (hasFocus) {
          if (widget.enableAutoValidate == true && !hasFocus) {
            setState(() {
              widget.errorMessage =
                  widget.onValidate?.call(widget.textController.text);
            });
          }
          widget.onFocusChanged?.call(hasFocus, widget.textController.text);
        },
        child: TextFormField(
            key: UniqueKey(),
            controller: widget.textController,
            keyboardType: widget.inputType,
            onChanged: (text) {
              widget.onChanged?.call(text);
            },
            onSaved: widget.onSaved,
            validator: widget.onValidate,
            obscureText: widget._isPasswordVisible,
            decoration: InputDecoration(
                errorText: widget.errorMessage,
                labelText: widget.label,
                border: const OutlineInputBorder(),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(widget._isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            widget._isPasswordVisible =
                                !widget._isPasswordVisible;
                          });
                        },
                      )
                    : null)));
  }
}
