import 'package:flutter/material.dart';

class SideDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:[
          DrawerHeader(
            child: Center(
              child: Text(
                'Menu',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),         
          ListTile(
            leading: Icon(Icons.view_agenda),
            title: Text('Agendar consulta'),
            onTap: () => {Navigator.pushNamed(context, '/tela_especialidades')},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Meus agendamentos'),
            onTap: () => {Navigator.pushNamed(context, '/tela_agendamentos')},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () => {Navigator.of(context).popUntil((route) => route.isFirst)},
          ),
        ],
      ),
    );
  }
}