import 'package:app_telemedicina/Model/Paciente.dart';
import 'package:app_telemedicina/widgets/avatar_widget.dart';
import 'package:app_telemedicina/widgets/side_drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaFuncionalidades extends StatefulWidget {

 
  @override
  _TelaFuncionalidadesState createState() => _TelaFuncionalidadesState();
}

late String userId = FirebaseAuth.instance.currentUser!.uid;
   late String nomePaciente = '';

    void getPaciente(String id)async{
        await FirebaseFirestore.instance.collection("pacientes")
        .doc(userId).get().then((value){
          nomePaciente = value.get('nome');
          print('Chamada da func $nomePaciente');
        });
    }

class _TelaFuncionalidadesState extends State<TelaFuncionalidades> {
   
 @override
  void initState() {
    print('inicio init');
    // TODO: implement initState
    super.initState();
    print('inicio super init');
    getPaciente(userId);
    print('fim init');
  }

  @override
  Widget build(BuildContext context) {
    // var idPaciente = ModalRoute.of(context)?.settings.arguments;
    print('Ola $nomePaciente');
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
                        child: Text('Bem vindo(a)',style: TextStyle(fontSize: 22, color: Theme.of(context).primaryColor),),
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
