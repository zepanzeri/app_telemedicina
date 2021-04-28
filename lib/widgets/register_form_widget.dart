import 'package:flutter/material.dart';

class RegisterFormWidget extends StatefulWidget {
  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  var login = TextEditingController();
  var senha = TextEditingController();
  var registerFormKey = GlobalKey<FormState>();

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
                  labelText: 'Nome',                            
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: TextFormField(
                obscureText: true,
                controller: senha,
                decoration: InputDecoration(
                  labelText: 'Email',                  
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