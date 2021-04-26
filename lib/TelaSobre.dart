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
  Widget _widgetCardIcon = Icon(Icons.arrow_circle_down, color: Colors.blue[300], size: 30,);

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
              onExpansionChanged: (bool expanded)=> {
                setState((){
                  if(expanded)
                    this._widgetCardIcon = Icon(Icons.arrow_circle_up, color: Colors.blue[300], size: 30,);
                  else
                    this._widgetCardIcon  =Icon(Icons.arrow_circle_down, color: Colors.blue[300], size: 30,);
                })               
              },
              trailing: _widgetCardIcon,
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Theme.of(context).primaryColor,width: 3)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis. Quem num gosta di mé, boa gentis num é. Manduma pindureta quium dia nois paga. Mé faiz elementum girarzis, nisi eros vermeio.",
                      style: TextStyle(
                        fontSize:16, color: Theme.of(context).primaryColor)
                    ),
                  ),
                ),
              ],
            ),
             ExpansionCard(
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Objetivo do App",
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Theme.of(context).primaryColor,width: 3)
                  ),
                  child:Text("Mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent. Atirei o pau no gatis, per gatis num morreus. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose. ",
                    style: TextStyle(fontSize:16, color: Theme.of(context).primaryColor)
                  ),
                ),
              ],
            ),
            
          ]),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
