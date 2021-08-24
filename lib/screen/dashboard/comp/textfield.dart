import 'package:flutter/material.dart';

class CustonTextField extends StatefulWidget {
  const CustonTextField({Key? key}) : super(key: key);

  @override
  _CustonTextFieldState createState() => _CustonTextFieldState();
}

class _CustonTextFieldState extends State<CustonTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 1.8,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
