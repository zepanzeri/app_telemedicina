import 'dart:js';

import 'package:app_telemedicina/Model/Agendamento.dart';
import 'package:app_telemedicina/telas/TelaEspecialidades.dart';
import 'package:app_telemedicina/widgets/side_drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class TelaAgendamentos extends StatefulWidget {
  @override
  _TelaAgendamentosState createState() => _TelaAgendamentosState();
}

class _TelaAgendamentosState extends State<TelaAgendamentos> {
  late CollectionReference agendamentos;
  final formatoData = new DateFormat("dd/MM/yyyy hh:mm");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    agendamentos = FirebaseFirestore.instance.collection('agendamentos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawerWidget(),
      appBar: AppBar(
        title: Text('Meus agendamentos',
            style: Theme.of(context).textTheme.headline1),
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: StreamBuilder<QuerySnapshot>(
            stream: agendamentos.snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: Text('Erro ao conectar ao Firestore'));
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  final dados = snapshot.requireData;

                  return ListView.builder(                    
                      itemCount: dados.size,
                      itemBuilder: (context, index) {
                        return exibirAgendamento(dados.docs[index], context);
                      });
              }
            },
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget exibirAgendamento(item, BuildContext context) {
    //Converter um DOCUMENTO em um OBJETO
    Agendamento agendamento = Agendamento.fromJson(item.data(), item.id);

    return Container(
      padding: EdgeInsets.all(5),
      child: ListTile(
        title: Text(agendamento.especialidade, style: TextStyle(fontSize: 24)),
        subtitle: Text('${agendamento.data}', style: TextStyle(fontSize: 22)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {          
            agendamentos.doc(agendamento.id).delete();
          },
        ),
        onTap: ()=>{        


          
            DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      currentTime: DateTime.now(),
                      locale: LocaleType.pt,
                      theme: DatePickerTheme(
                        backgroundColor: Theme.of(context).backgroundColor,
                        itemStyle: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                        cancelStyle: TextStyle(color: Colors.red[300])
                      ),
                      onConfirm: (DateTime date) {
                      String dataFormatada = formatoData.format(date);
                       atualizaAgendamento(agendamento.id, dataFormatada);
                      },                              
                    )
   
                       
        },
      ),
    );
  }

  void atualizaAgendamento(String id, String novaData) {
      var db = FirebaseFirestore.instance;
      db.collection('agendamentos').doc(id).update({
       'data' : novaData
      });
  }      
}
