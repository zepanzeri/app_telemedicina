import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Usuario {
  final String email;
  final String nome;
  final String senha;
  Usuario(this.email, this.nome, this.senha);
}

class TelaCriarConta extends StatefulWidget {
  @override
  _TelaCriarContaState createState() => _TelaCriarContaState();
}

class _TelaCriarContaState extends State<TelaCriarConta> {
  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();
  var senhaCheck = TextEditingController();
  var registerFormKey = GlobalKey<FormState>();
  bool emailValidado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget('Criar conta')),
      body: SingleChildScrollView(
          child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Form(
            key: registerFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: nome,
                    validator: (String value) {
                      if (value.isEmpty) return 'Insira um nome vádido.';
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (String value) {
                      this.emailValidado = EmailValidator.validate(value);
                      return this.emailValidado
                          ? null
                          : 'Email com formato inválido.';
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: senha,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                    validator: (String value) => value.length <= 3
                        ? 'Sua senha deve conter no minimo 4 dígitos.'
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: TextFormField(
                    obscureText: true,
                    controller: senhaCheck,
                    decoration: InputDecoration(
                      labelText: 'Confirme sua senha',
                    ),
                    validator: (String value) => value != this.senha.text
                        ? 'As senhas não conferem.'
                        : null,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text('Criar conta'),
                    onPressed: () {
                      if (registerFormKey.currentState.validate()) {
                        setState(() {
                          var usuario = Usuario(
                              this.email.text, this.nome.text, this.senha.text);
                          print(usuario.nome + usuario.email + usuario.senha);
                          dialogBox(
                              'Bem vindo(a), ${usuario.nome}!\n\nVocê já pode realizar o login com sua conta.',
                              usuario);
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  dialogBox(String msg, Usuario usuario) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Conta criada'),
          content: Text(msg),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.pushNamed(context, '/tela_login', arguments: usuario);
              },
            )
          ],
        );
      },
    );
  }
}
