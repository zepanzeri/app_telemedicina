import 'package:app_telemedicina/telas/TelaEspecialidades.dart';
import 'package:app_telemedicina/widgets/side_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TelaAgendamentos extends StatefulWidget {
  @override
  _TelaAgendamentosState createState() => _TelaAgendamentosState();
}

class _TelaAgendamentosState extends State<TelaAgendamentos> {
  Agendamento agenda;
  final fmt = new DateFormat("dd/MM/yyyy hh:mm");

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        agenda = ModalRoute.of(context).settings.arguments;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (agenda == null)
      return Scaffold(
        drawer: SideDrawerWidget(),
        appBar: AppBar(title: Text('Meus agendamentos', style: Theme.of(context).textTheme.headline1),
          leading: Builder(
            builder: (context)=>IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () => Scaffold.of(context).openDrawer()),
          ),     
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
                elevation: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Nenhum agendamento encontrado.',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Sans Serif',
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic)),
                  ],
                ))
          ],
        )),
        backgroundColor: Theme.of(context).backgroundColor,
      );
    return Scaffold(
      drawer: SideDrawerWidget(),
        appBar: AppBar(title: Text('Meus agendamentos', style: Theme.of(context).textTheme.headline1),
          leading: Builder(
            builder: (context)=>IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () => Scaffold.of(context).openDrawer()),
          ),     
        ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
              elevation: 5,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Especialidade: ${agenda.especialidade}',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sans Serif',
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic)),
                     Text('Data: ${fmt.format(agenda.data)}',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sans Serif',
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ))
        ],
      )),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
