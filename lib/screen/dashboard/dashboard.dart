import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            height: 500,
            width: 50,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            height: 500,
            width: 50,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            height: 500,
            width: 50,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            height: 500,
            width: 50,
          ),
        ],
      )),
    );
  }
}
