import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var email = TextEditingController();
  var senha = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: TextFormField(
                  obscureText: true,
                  controller: senha,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text('Entrar'),
                    onPressed: () {
                      setState(() {
                        loginPaciente(email.text, senha.text);
                      });
                    }),
              ),
            ],
          ),
        ),
      )),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  void loginPaciente(String email, String senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) => {
              Navigator.pushReplacementNamed(
                context,
                '/tela_funcionalidades',
              ).catchError((erro) {
                var mensagem = '';
                var codigoErro = erro.code;
                switch (codigoErro) {
                  case 'user-not-found':
                    mensagem = 'Erro: Usuario não encontrado';
                    break;
                  case 'wrong-password':
                    mensagem = 'Erro: Senha inválida';
                    break;
                  case 'invalid-email':
                    mensagem = 'Erro: E-mail inválido';
                    break;
                  default:
                    mensagem = 'Erro: ${erro.message}';
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('$mensagem'),
                  duration: Duration(seconds: 3),
                ));
              })
            });
  }
}
