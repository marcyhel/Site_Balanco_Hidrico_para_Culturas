import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/clima/comp/pickr_data.dart';
import 'package:plat11/screen/clima/comp/tabela.dart';

import 'button_custon.dart';
import 'dialog.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class LargClima extends StatefulWidget {
  const LargClima({Key? key}) : super(key: key);

  @override
  State<LargClima> createState() => _LargClimaState();
}

class _LargClimaState extends State<LargClima> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).backgroundColor,
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
                    children: [
                      //PikerData(func: mob.setDataStart),
                      //PikerData(func: mob.setDataEnd),
                      SizedBox(width: 50)
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: 20, left: MediaQuery.of(context).size.width / 9),
                      child: Tabela()),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Observer(builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: 90,
                          left: MediaQuery.of(context).size.width / 80),
                      child: Custon_button(
                        text: "printar",
                        carrega: mob.carrega,
                        func: () {
                          setState(() {
                            print("ds");
                          });
                          //mob.calcula();
                        },
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: 90,
                          left: MediaQuery.of(context).size.width / 80),
                      child: Custon_button(
                        text: "Manual",
                        carrega: mob.carrega,
                        func: () {
                          if (mob.carregaManual()) {
                            print('certo');
                          } else {
                            print('algo de errado');
                          }
                        },
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: 20,
                          left: MediaQuery.of(context).size.width / 80),
                      child: Custon_button(
                          text: "Sincronizar",
                          carrega: mob.carrega,
                          func: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogCuston();
                                });
                          } /*() async {
                          //await Future.delayed(Duration(seconds: 2));
                          await mob.carregar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 1),
                              content:
                                  Text('Yay! Flutter Collapsible Sidebar!')));
                        },*/
                          ),
                    );
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
