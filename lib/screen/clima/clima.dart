import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/clima/comp/pickr_data.dart';

import 'comp/button_custon.dart';
import 'comp/tabela.dart';

class Clima extends StatefulWidget {
  const Clima({Key? key}) : super(key: key);

  @override
  _ClimaState createState() => _ClimaState();
}

final Mob_dados mob = GetIt.I<Mob_dados>();

class _ClimaState extends State<Clima> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
          child: Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [PikerData(), PikerData(), SizedBox(width: 50)],
                ),
                Tabela(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: 90, left: MediaQuery.of(context).size.width / 80),
                    child: Custon_button(
                      text: "Sincronizar",
                      carrega: mob.carrega,
                      func: () async {
                        //await Future.delayed(Duration(seconds: 2));
                        await mob.carregar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Yay! Flutter Collapsible Sidebar!')));
                      },
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: 20, left: MediaQuery.of(context).size.width / 80),
                    child: Custon_button(
                      text: "Sincronizar",
                      carrega: mob.carrega,
                      func: () async {
                        //await Future.delayed(Duration(seconds: 2));
                        await mob.carregar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 1),
                            content:
                                Text('Yay! Flutter Collapsible Sidebar!')));
                      },
                    ),
                  );
                })
              ],
            )
          ],
        ),
      )),
    );
  }
}
