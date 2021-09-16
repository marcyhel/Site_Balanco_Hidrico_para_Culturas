import 'package:flutter/material.dart';

class ImputTabela extends StatefulWidget {
  Function func;
  String valor;
  ImputTabela({
    Key? key,
    required this.func,
    required this.valor,
  }) : super(key: key);

  @override
  _ImputTabelaState createState() => _ImputTabelaState();
}

class _ImputTabelaState extends State<ImputTabela> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: TextFormField(
        initialValue: widget.valor,
        onChanged: (e) {
          widget.func(e);
        },
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
