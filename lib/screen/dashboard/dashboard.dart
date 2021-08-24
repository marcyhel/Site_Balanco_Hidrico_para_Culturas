import 'package:flutter/material.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:plat11/screen/dashboard/comp/drop.dart';
import 'package:plat11/screen/dashboard/comp/textfield.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
          child: Column(
        children: [DropDown(), CustonTextField()],
      )),
    );
  }
}
