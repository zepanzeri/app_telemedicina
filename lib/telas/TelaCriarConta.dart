import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class TelaCriarConta extends StatefulWidget {
  @override
  _TelaCriarContaState createState() => _TelaCriarContaState();
}

class _TelaCriarContaState extends State<TelaCriarConta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget()),
    
      body: Text('Sobre'),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}