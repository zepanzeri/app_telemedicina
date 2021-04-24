import 'package:app_telemedicina/TelaCriarConta.dart';
import 'package:app_telemedicina/TelaLogin.dart';
import 'package:app_telemedicina/TelaSobre.dart';
import 'package:flutter/material.dart';

import 'TelaPrincipal.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'TELEMEDICINA',
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue[300],
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      )),
      primaryColor: Colors.blue[300],
      backgroundColor: Colors.blue[50],
      fontFamily: 'Sans Serif',
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue[300],           
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
        ),
      ),  
    ),
    initialRoute: '/tela_principal',
    routes: {
      '/tela_principal': (context) => TelaPrincipal(),
      '/tela_login': (context) => TelaLogin(),
      '/tela_criar_conta': (context) => TelaCriarConta(),
      '/tela_sobre': (context) => TelaSobre()
    },
  ));
}
