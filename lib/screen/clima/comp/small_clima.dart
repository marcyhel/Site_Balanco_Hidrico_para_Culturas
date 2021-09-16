import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/clima/comp/pickr_data.dart';
import 'package:plat11/screen/clima/comp/tabela.dart';

import 'button_custon.dart';
import 'dialog.dart';

class SmallClima extends StatefulWidget {
  const SmallClima({Key? key}) : super(key: key);

  @override
  _SmallClimaState createState() => _SmallClimaState();
}

final Mob_dados mob = GetIt.I<Mob_dados>();

class _SmallClimaState extends State<SmallClima> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              /* Container(
                width: MediaQuery.of(context).size.width / 1.55,
                child: PikerData(func: mob.setDataStart),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.55,
                child: PikerData(func: mob.setDataEnd),
              ),*/
              Observer(
                builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 1.55,
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Custon_button(
                      text: "Sincronizar",
                      carrega: mob.carrega,
                      func: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DialogCuston();
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Tabela(),
            ],
          ),
        ),
      ),
    );
  }
}
