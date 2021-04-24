import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget()),
        
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/jose.jpg')
                  )
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
