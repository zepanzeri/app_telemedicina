import 'package:app_telemedicina/telas/TelaCriarConta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Agendamento{
  final String nome;
  final String especialidade;
  final DateTime data;
  Agendamento(this.nome, this.especialidade, this.data);
}

class TelaEspecialidades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Usuario usuario = ModalRoute.of(context).settings.arguments;
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
                child: InkWell(
                  onTap: ()=>{
                    DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              onConfirm: (DateTime date) {
                                Agendamento agenda = new Agendamento(usuario.nome,especialidades[index],date);
                                Navigator.pushNamed(context, '/tela_agendamentos', arguments: agenda);
                              },
                              currentTime: DateTime.now(),
                              locale: LocaleType.pt)
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                      width:250,
                      height:150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                       
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