import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:app_telemedicina/widgets/dev_avatar_widget.dart';
import 'package:app_telemedicina/widgets/expand_card_widget.dart';
import 'package:flutter/material.dart';

class TelaSobre extends StatefulWidget {
  @override
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppBarWidget()),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            DevAvatarWidget(),
            ExpandCardWidget('Sobre o Desenvolvedor', 'MDiuretics paradis num copo é motivis de denguis. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Atirei o pau no gatis, per gatis num morreus. Aenean aliquam molestie leo, vitae iaculis nisl. '),
            ExpandCardWidget('Sobre o App', 'Diuretics paradis num copo é motivis de denguis. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Atirei o pau no gatis, per gatis num morreus. Aenean aliquam molestie leo, vitae iaculis nisl. Diuretics paradis num copo é motivis de denguis. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Atirei o pau no gatis, per gatis num morreus. Aenean aliquam molestie leo, vitae iaculis nisl.  Diuretics paradis num copo é motivis de denguis. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Atirei o pau no gatis, per gatis num morreus. Aenean aliquam molestie leo, vitae iaculis nisl.  ')
          ]),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
