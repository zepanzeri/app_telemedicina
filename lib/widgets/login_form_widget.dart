import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  var login = TextEditingController();
  var senha = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 200,
      child: Column(
        children: [
          TextFormField(
            controller: login,
            decoration: InputDecoration(
              labelText: 'Login'
            ),
          ),
          TextFormField(
            controller: senha,
            decoration: InputDecoration(
              labelText: 'Senha'
            ),
          )
        ],
      ),
    );
  }
}