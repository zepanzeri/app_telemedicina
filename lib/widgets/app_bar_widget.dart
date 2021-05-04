import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String titulo;
  AppBarWidget(this.titulo);

  @override
  Widget build(BuildContext context) { 
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
        title: Text(this.titulo, style: Theme.of(context).textTheme.headline1),
        automaticallyImplyLeading: false,
    );
  }
}