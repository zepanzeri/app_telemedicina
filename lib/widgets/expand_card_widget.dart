import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class ExpandCardWidget extends StatefulWidget {
  final String titulo;
  final String corpo;
  ExpandCardWidget(this.titulo, this.corpo);

  @override
  _ExpandCardWidgetState createState() => _ExpandCardWidgetState();
}


class _ExpandCardWidgetState extends State<ExpandCardWidget> {
  
  Widget _widgetCardIcon = Icon(
    Icons.arrow_circle_down,
    color: Colors.blue[300],
    size: 30,
  );

  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      onExpansionChanged: (bool expanded) => {
        setState(() {
          if (expanded)
            this._widgetCardIcon = Icon(
              Icons.arrow_circle_up,
              color: Colors.blue[300],
              size: 30,
            );
          else
            this._widgetCardIcon = Icon(
              Icons.arrow_circle_down,
              color: Colors.blue[300],
              size: 30,
            );
        })
      },
      trailing: _widgetCardIcon,
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.titulo,
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 3)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.corpo,
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).primaryColor)),
          ),
        ),
      ],
    );
  }
}
