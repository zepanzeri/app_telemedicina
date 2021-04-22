import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tituloAppBar = ModalRoute.of(context).settings.arguments;
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(tituloAppBar, style: Theme.of(context).textTheme.headline1),
        automaticallyImplyLeading: false,
    );
  }
}