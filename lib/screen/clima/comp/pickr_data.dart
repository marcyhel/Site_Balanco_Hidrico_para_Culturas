import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/widgets/responsive.dart';

class PikerData extends StatelessWidget {
  Function func;
  PikerData({
    Key? key,
    required this.func,
  }) : super(key: key);
  final Mob_dados mob = GetIt.I<Mob_dados>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 5, color: Colors.black26, offset: Offset(0, 0))
          ]),
      padding: EdgeInsets.all(10),
      margin: ResponsiveWidget.isSmallScreen(context)
          ? EdgeInsets.only(top: 20)
          : EdgeInsets.only(
              top: 20, left: MediaQuery.of(context).size.width / 9),
      width: MediaQuery.of(context).size.width / 5,
      height: 50,
      child: Row(
        children: [
          Icon(Icons.event),
          SizedBox(width: 15),
          Expanded(
            child: DateTimePicker(
              dateMask: 'd MMM, yyyy',
              initialValue: '',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: '',
              icon: Icon(Icons.event),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
              ),
              onChanged: (val) {
                func(DateTime.parse(val));
                //print(mob.dataStart);
                print(val);
              },
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) {
                print(val);
              },
            ),
          ),
        ],
      ),
    );
  }
}
