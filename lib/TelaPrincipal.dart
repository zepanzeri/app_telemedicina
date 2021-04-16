import 'package:flutter/material.dart';
import 'TelaLogin.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(   
        color: Colors.purple[500],  
        alignment: Alignment.center,   
        child: Column(             
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,                         
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(40),              
              child: ElevatedButton(                                                                           
                child: Text('Login'),                            
                onPressed:(){
                  Navigator.push(
                    context,              
                    MaterialPageRoute(
                      builder: (context) => TelaLogin()                    
                    ),                  
                  );
                }              
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}