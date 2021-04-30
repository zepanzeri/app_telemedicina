import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterFormWidget extends StatefulWidget {
  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();
  var senhaCheck = TextEditingController();
  var registerFormKey = GlobalKey<FormState>();
  bool emailValidado;

  @override
  Widget build(BuildContext context) {
    return Align(
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
                    if(value.isEmpty || RegExp("/^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+/").hasMatch(value))
                      return 'Insira um nome vádido.';
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
                  validator: (String value){
                    this.emailValidado = EmailValidator.validate(value);
                    return this.emailValidado ? null : 'Email com formato inválido.';              
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
                  validator: (String value) => value.length<=3 ? 'Sua senha deve conter no minimo 4 dígitos.' : null,
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
                  validator: (String value) => value !=  this.senha.text ? 'As senhas não conferem.' : null,                 
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text('Criar conta'),
                  onPressed: (){ 
                    if (registerFormKey.currentState.validate()){
                      setState(() {
                        dialogBox();
                      });                    
                    }     
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

    dialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Conta criada'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bem vindo(a), ${nome.text}.'),
              Text('Sua conta foi criada com sucesso!')
            ],
          ),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}