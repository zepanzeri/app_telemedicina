import 'package:app_telemedicina/widgets/avatar_widget.dart';
import 'package:app_telemedicina/widgets/side_drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaFuncionalidades extends StatefulWidget {
  @override
  _TelaFuncionalidadesState createState() => _TelaFuncionalidadesState();
}

class _TelaFuncionalidadesState extends State<TelaFuncionalidades> {
  late String idPaciente = FirebaseAuth.instance.currentUser!.uid;
  late var paciente;

  void getNomePaciente() async {
    print('chamada funcao');
    await FirebaseFirestore.instance
        .collection("pacientes")
        .doc(idPaciente)
        .get()
        .then((value) {
      final String nomePaciente = value.get('nome');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Bem-vindo(a), $nomePaciente'),
        duration: Duration(seconds: 10),
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNomePaciente();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawerWidget(),
      appBar: AppBar(
        title: Text('', style: Theme.of(context).textTheme.headline1),
        leading: Builder(
          builder: (context) => IconButton(
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
                        Navigator.pushNamed(context, '/tela_agendamentos');
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
