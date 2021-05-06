import 'package:app_telemedicina/telas/TelaEspecialidades.dart';
import 'package:flutter/material.dart';

class TelaAgendamentos extends StatefulWidget {
  @override
  _TelaAgendamentosState createState() => _TelaAgendamentosState();
}



    

class _TelaAgendamentosState extends State<TelaAgendamentos> {
  Agendamento agenda;
  @override
void initState(){
  Future.delayed(Duration.zero,(){
      setState(() {
        agenda =  ModalRoute.of(context).settings.arguments;
      });
    });
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    if(agenda == null) return Scaffold();
    return Scaffold(
          body: Container(
        child: Center(
          child:Text('Especialidade: ${agenda.especialidade} Data: ${agenda.data}')
        ),
      ),
    );
  }
}