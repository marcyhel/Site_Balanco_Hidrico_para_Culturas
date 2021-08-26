import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  String texto = "";
  TextLabel({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 0),
      child: Text(
        texto,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class TextLabelTitle extends StatelessWidget {
  String texto = "";
  TextLabelTitle({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 0),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
