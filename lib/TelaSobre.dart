import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget()),
        
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('Tela Sobre'),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
