import 'package:awesome_dropdown/awesome_dropdown.dart';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:smart_dropdown/smart_dropdown.dart';

class GrupoCultura extends StatefulWidget {
  GrupoCultura({Key? key}) : super(key: key);

  @override
  _GrupoCulturaState createState() => _GrupoCulturaState();
}

var UF = ["Grupo 1", "Grupo 2", "Grupo 3", "Grupo 4"];
final Mob_dados mob = GetIt.I<Mob_dados>();

class _GrupoCulturaState extends State<GrupoCultura> {
  String selec = UF[0];
  List<SmartDropdownMenuItem> items = [];
  SmartDropdownMenuItem getItem(dynamic value, String item) {
    return SmartDropdownMenuItem(
        value: value,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    items = [];
    var cont = 0;
    UF.forEach((e) {
      cont++;
      items.add(
        getItem(cont, e),
      );
    });
    /*items = [
      getItem(1, "Item 1"),
      getItem(2, "Item 2"),
      getItem(3, "Item 3"),
      getItem(4, "Item 4"),
      getItem(5, "Item 5"),
    ];*/
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 1.8,
      height: 40,
      child: SmartDropDown(
        items: items,
        hintText: mob.grup_culura == "" ? "Grupo" : mob.grup_culura,
        borderRadius: 10,
        maxListHeight: 150,
        borderColor: Theme.of(context).primaryColor,
        expandedColor: Theme.of(context).primaryColor,
        onChanged: (e) {
          mob.setGrup_cultura(UF[e - 1]);
          print(mob.grup_culura);
        },
      ),
    );
  }
}
