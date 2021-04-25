import 'package:app_telemedicina/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';

class TelaSobre extends StatefulWidget {
  @override
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  double _width = 100;
  double _height = 100;
  bool _isClicked = false;

  void _updateStateExpandir(){
    setState(() {
      if(_isClicked){
        _width = 100;
        _height = 100;
        _isClicked = !_isClicked;
      }
      else{
        _width = 200;
        _height = 200;
        _isClicked = !_isClicked;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppBarWidget()),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            Row(
              children: [
                InkWell(
                    child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: _width,
                    height: _height,
                    curve: Curves.easeIn,
                    decoration: BoxDecoration(               
                      image: DecorationImage(image: AssetImage('assets/images/jose.jpg')),
                      borderRadius: BorderRadius.circular(120),
                      border: Border.all(
                        color:Theme.of(context).primaryColor,
                        width:5,
                      )
                    ),
                  ),
                  onTap: ()=> _updateStateExpandir(),                
                ),
              ],              
            ),
             ExpansionCard(
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sobre o Desenvolvedor",
                      style: TextStyle(
                        fontSize:24,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
              ),
              children:[
                Text("Nome: José Henrique Panzeri Juns",
                  style: TextStyle(
                    fontSize:16, color: Colors.blue[300],
                  )
                ),
              ],
            )
          ]),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
