import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:app_telemedicina/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppBarWidget('Sobre')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              AvatarWidget('assets/images/jose.jpg'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Olá, me chamo José Henrique Panzeri Juns.\n\n' +
                            'Atualmente estou cursando Análise e Desenvolvimento de Sistemas na Fatec Ribeirão Preto.',
                        style: TextStyle(
                            fontSize: 16, color: Theme.of(context).primaryColor)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Aplicativo Mobile para Telemedicina\n\n\n' +
                            'Este app tem por finalidade permitir que os usuários se comuniquem com médicos de forma remota, seja por chat ou videoconferência.\n\n' +
                            'Com o uso da telemedicina ambos paciente e médico podem se comunicar sem a necessidade de estar presencialmente em um consultório.\n\n' +
                            'Com base na comunicação, o médico pode determinar se é necessário a realizar um diagnóstico mais detalhado ou procedimento de forma presencial, porém dependendo dos sintomas do paciente, ou da especialidade médica, como psicólogos, nutricionistas, entre outros, a consulta pode ser feita de forma totalmente remota e com geração de atestados, receitas médicas, e inclusive, no cenário atual, evitar a exposição dos médicos e pacientes ao vírus COVID-19.',
                        style: TextStyle(
                            fontSize: 16, color: Theme.of(context).primaryColor)),
                  ),
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
