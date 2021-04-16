import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: (){
            Navigator.pop(context);            
          },
        ),
        title: Text('Login', style: Theme.of(context).textTheme.headline1),
        automaticallyImplyLeading: false,        
      ),
      body: Container(
        child: Column(
          children: [
            Text('Tela de Login'),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}