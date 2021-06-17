import 'package:app_telemedicina/Model/Agendamento.dart';
import 'package:app_telemedicina/Model/Especialidades.dart';
import 'package:app_telemedicina/widgets/side_drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class TelaEspecialidades extends StatefulWidget {
  @override
  _TelaEspecialidadesState createState() => _TelaEspecialidadesState();
}

class _TelaEspecialidadesState extends State<TelaEspecialidades> {
  late CollectionReference especialidades;
  @override
  void initState() {
    // TODO: implement initState
    especialidades = FirebaseFirestore.instance.collection('especialidades');
  }

  @override
  Widget build(BuildContext context) {
    late String idPaciente = FirebaseAuth.instance.currentUser!.uid;
    final formatoData = new DateFormat('dd/MM/yyyy HH:mm');

    return Scaffold(
      drawer: SideDrawerWidget(),
      appBar: AppBar(
        title: Text('Agendamento de consulta',
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
        padding: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: especialidades.snapshots(),
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
                      return exibirEspecialidades(
                          dados.docs[index], context, idPaciente, formatoData);
                    });
            }
          },
        ),
      )),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  void criarAgendamento(Agendamento agenda) {
    var db = FirebaseFirestore.instance;
    db.collection('agendamentos').add({
      'idPaciente': agenda.idPaciente,
      'especialidade': agenda.especialidade,
      'data': agenda.data
    }).then((value) {
      db.collection('agendamentos').doc(value.id).update({'id': value.id});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Agendamento realizado com sucesso'),
          duration: Duration(seconds: 3)));
      Navigator.pop(context);
    });
  }

  Widget exibirEspecialidades(
      item, BuildContext context, String idPaciente, DateFormat formatoData) {
    Especialidade especialidade = Especialidade.fromJson(item.data(), item.id);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () => {
          DatePicker.showDateTimePicker(
            context,
            showTitleActions: true,
            minTime: DateTime.now(),
            currentTime: DateTime.now(),
            locale: LocaleType.pt,
            theme: DatePickerTheme(
                backgroundColor: Theme.of(context).backgroundColor,
                itemStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
                cancelStyle: TextStyle(color: Colors.red[300])),
            onConfirm: (DateTime date) {
              String dataFormatada = formatoData.format(date);
              Agendamento agenda = new Agendamento(idPaciente,
                  especialidade.descricao, dataFormatada.toString());
              criarAgendamento(agenda);
            },
          )
        },
        child: Card(
          elevation: 5,
          child: Container(
            width: 150,
            height: 150,
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
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                          'assets/images/${especialidade.descricao}.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                      child: Text(especialidade.descricao,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sans Serif'))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
