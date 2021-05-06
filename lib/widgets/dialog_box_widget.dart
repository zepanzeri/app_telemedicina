import 'package:flutter/material.dart';


class DialogBoxWidget extends StatelessWidget {
  final String titulo;
  final String texto;
  DialogBoxWidget(this.titulo, this.texto);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AlertDialog(
      title: Text(this.titulo),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(this.texto),       
        ],
      ),
      actions: [
        TextButton(
          child: Text('Fechar'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    ));
  }
}
