import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos/util/logger/logger.dart';

class CommonTextField extends StatefulWidget {
  final String label;
  final TextInputType inputType;
  final bool isPassword;
  String? _errorMessage;
  void Function(String value) _onChanged;
  void Function(bool value, String text) _onFocusChanged;
  bool _isPasswordVisible = false;
  TextEditingController textController = TextEditingController();

  CommonTextField(
      {required this.label,
        String text = "",
      this.inputType = TextInputType.text,
      this.isPassword = false,
      required void Function(String value) onChange,
      required void Function(bool value, String text)  onFocusChanged,
      String? errorMessage = null})
      : _onChanged = onChange,
        _onFocusChanged = onFocusChanged,
        _isPasswordVisible = isPassword ? true : false {
    if(errorMessage?.isNotEmpty == true) {
      this._errorMessage = errorMessage;
    }
    if(text.isNotEmpty) {
      this.textController.text = text;
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
        onFocusChange: (hasFocus) {
          if(hasFocus) {
            logger().d("text value ${widget.textController.text.length}");
            Future.delayed(Duration(milliseconds: 5), () {
              widget.textController.selection = TextSelection.collapsed(offset: widget.textController.text.length);
            });
          }
          widget._onFocusChanged(hasFocus, widget.textController.text);
        },
        child: TextField(
            controller: widget.textController,
            keyboardType: widget.inputType,
            onChanged: (text) {
              widget._onChanged(text);
            },
            obscureText: widget._isPasswordVisible,
            decoration: InputDecoration(

                errorText: widget._errorMessage,
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
