import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:app_telemedicina/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget()),
        
      body: Center(
        child: LoginFormWidget(),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
