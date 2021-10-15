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
              Observer(builder: (_) {
                return Container(
                  width: MediaQuery.of(context).size.width / 1.55,
                  margin: EdgeInsets.only(
                    top: 20,
                  ), //left: MediaQuery.of(context).size.width / 80),
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
              Observer(builder: (_) {
                return Container(
                  width: MediaQuery.of(context).size.width / 1.55,
                  margin: EdgeInsets.only(
                    top: 20,
                  ), //left: MediaQuery.of(context).size.width / 80),
                  child: Custon_button(
                    text: "Calcular",
                    carrega: mob.carrega,
                    func: () {
                      setState(() {
                        mob.calcula()
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    backgroundColor: Colors.green[400],
                                    duration: Duration(seconds: 2),
                                    content: Text('Calculado com sucesso !! ')))
                            : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(seconds: 2),
                                content: Text(
                                    'Ouve algum erro durante os calculos.')));
                        //Navigator.of(context).pop();
                        //print("ds");
                      });
                      //mob.calcula();
                    },
                  ),
                );
              }),
              SizedBox(height: 20),
              Tabela(),
            ],
          ),
        ),
      ),
    );
  }
}
