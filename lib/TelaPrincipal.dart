import 'package:app_telemedicina/TelaCriarConta.dart';
import 'package:app_telemedicina/TelaSobre.dart';
import 'package:flutter/material.dart';
import 'TelaLogin.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 60, right: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: ElevatedButton(                
                child: Text('Login'),
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaLogin()),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: ElevatedButton(
                  child: Text('Criar conta'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaCriarConta()),
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: ElevatedButton(
                  child: Text('Sobre'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaSobre()),
                    );
                  }),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
