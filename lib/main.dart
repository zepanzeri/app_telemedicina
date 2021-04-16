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
            borderRadius: BorderRadius.circular(30.0),
          )         
        ),
      ),  
    ),
    home: TelaPrincipal(),
  ));
}
