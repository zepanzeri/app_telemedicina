import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  final String imageUrl;
  AvatarWidget(this.imageUrl);

  @override
  _AvatarWidgetState createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  double _width = 100;
  double _height = 100;
  bool _isClicked = false;

  void _updateStateExpandir() {
    setState(() {
      if (_isClicked) {
        _width = 100;
        _height = 100;
        _isClicked = !_isClicked;
      } else {
        _width = 200;
        _height = 200;
        _isClicked = !_isClicked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: _width,
            height: _height,
            curve: Curves.easeIn,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.imageUrl)),
                borderRadius: BorderRadius.circular(120),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 5,
                )),
          ),
          onTap: () => _updateStateExpandir(),
        ),
      ],
    );
  }
}
