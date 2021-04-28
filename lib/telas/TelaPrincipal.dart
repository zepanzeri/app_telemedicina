import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  String tituloAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('Login'),
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {
                      tituloAppBar = 'Login';
                      Navigator.pushNamed(
                        context,
                        '/tela_login',
                        arguments: tituloAppBar);
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      child: Text('Criar conta'),
                      onPressed: () {
                        tituloAppBar = 'Criar conta';
                        Navigator.pushNamed(
                          context,
                          '/tela_criar_conta',
                          arguments: tituloAppBar);
                      }),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      child: Text('Sobre'),
                      onPressed: () {
                        tituloAppBar = 'Sobre';
                        Navigator.pushNamed(
                          context,
                          '/tela_sobre',
                          arguments: tituloAppBar);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
