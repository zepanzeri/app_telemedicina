import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  var login = TextEditingController();
  var senha = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(                            
                controller: login,  
                validator: (value){
                  
                },             
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  border: OutlineInputBorder(                  
                    borderRadius: BorderRadius.circular(20)
                  ),            
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: TextFormField(
                controller: senha,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text('Entrar'),
                onPressed: (){       
                  print('${login.text} : ${senha.text}');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}