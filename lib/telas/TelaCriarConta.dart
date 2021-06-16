import 'package:app_telemedicina/Model/Paciente.dart';
import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  late bool emailValidado;

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
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Insira um nome vádido.';
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
                    validator: (String? value) {
                      this.emailValidado = EmailValidator.validate(value!);
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
                    validator: (String? value) => value!.length <= 3
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
                    validator: (String? value) => value != this.senha.text
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
                      if (registerFormKey.currentState!.validate()) {
                        setState(() {                                                
                          criarConta(this.nome.text, this.email.text, this.senha.text);
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

  void criarConta(nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      var db = FirebaseFirestore.instance;
      db.collection('pacientes').doc(value.user!.uid).set({
        'nome': nome,
        'email': email,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Cadastro realizado com sucesso'),
            duration: Duration(seconds: 3)));
        Navigator.pop(context);
      });
    }).catchError((erro) {
      if (erro.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('E-mail já cadastrado'),
            duration: Duration(seconds: 3)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Erro: ${erro.message}'),
            duration: Duration(seconds: 3)));
      }
    });
  }
}
