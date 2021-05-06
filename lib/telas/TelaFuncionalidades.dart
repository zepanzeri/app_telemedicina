import 'package:app_telemedicina/telas/TelaCriarConta.dart';
import 'package:app_telemedicina/widgets/avatar_widget.dart';
import 'package:app_telemedicina/widgets/side_drawer_widget.dart';
import 'package:flutter/material.dart';

class TelaFuncionalidades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Usuario usuario = ModalRoute.of(context).settings.arguments;
    

    return Scaffold(
      drawer: SideDrawerWidget(),
      appBar: AppBar(title: Text('', style: Theme.of(context).textTheme.headline1),
      leading: Builder(
        builder: (context)=>IconButton(
        icon: Icon(Icons.menu),
        color: Colors.white,
        onPressed: () => Scaffold.of(context).openDrawer()),
      ),     
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      AvatarWidget('assets/images/user.png'),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Bem vindo(a),\n${usuario.nome}',style: TextStyle(fontSize: 22, color: Theme.of(context).primaryColor),),
                      )
                    ],
                  ),
                ],
              ),              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('Agendar consulta'),
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/tela_especialidades',
                        arguments: usuario
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      child: Text('Meus agendamentos'),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/tela_agendamentos');
                      }),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red[500]),
                      child: Text('Sair'),
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }),
                ),
              ),              
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
