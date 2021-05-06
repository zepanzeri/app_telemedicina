import 'package:app_telemedicina/telas/TelaCriarConta.dart';
import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var login = TextEditingController();
  var senha = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), child: AppBarWidget('Login')),
      body: SingleChildScrollView(
        child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: login,
                  validator: (var value) => value == null ? 'Informe seu e-mail' : null,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: TextFormField(
                  obscureText: true,
                  controller: senha,
                  validator: (var senha) => senha.isEmpty  ? 'Informe sua senha' : null,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text('Entrar'),
                  onPressed: () {
                    if (login.text == usuario.email && senha.text == usuario.senha)
                      Navigator.pushNamed(context, '/tela_funcionalidades',arguments: usuario);
                     else{
                      showDialog(context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Erro'),
                          content: Text('Credenciais inválidas.'),
                          actions: [
                            TextButton(
                              child: Text('Fechar'),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ));}
                  }
                ),
              ),
            ],
          ),
        ),
      )),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
