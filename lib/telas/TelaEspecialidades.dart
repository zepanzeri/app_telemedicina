import 'package:flutter/material.dart';

class TelaEspecialidades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> especialidades = ['Clinico geral', 'Psicólogo', 'Nutricionista', 'Educador físico'];

    return Scaffold(
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(60),
          child:ListView.builder(
            itemCount: especialidades.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width:250,
                  height:150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          1.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox( width:50, height: 50, child: Image.asset('assets/images/${especialidades[index]}.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Expanded(child: Text('${especialidades[index]}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sans Serif'))
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          )
        )
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}