import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  var _isObscure = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }, icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off
                    )),
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    labelText: 'Password',
                  ),
                  obscureText: _isObscure,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(onPressed: () {}, child: Text("Login", style: TextStyle(fontSize: 17),)),
                )
              ]),
        ));
  }
}
