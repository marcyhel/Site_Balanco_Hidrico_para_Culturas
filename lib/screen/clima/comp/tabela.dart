import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'dart:ui';

import 'package:plat11/screen/widgets/responsive.dart';

import 'imput_tabela.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class Tabela extends StatelessWidget {
  Tabela({Key? key}) : super(key: key);
  int conta = 0;

  int index = 0;

  int indeCo = 1;

  int indexDado = 0;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Container(
          width: ResponsiveWidget.isSmallScreen(context)
              ? MediaQuery.of(context).size.width / 1.55
              : MediaQuery.of(context).size.width / 1.95,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5, color: Colors.black26, offset: Offset(0, 0))
              ]),
          child: DataTable(
            columnSpacing: 2,
            dividerThickness: 0.1,
            columns: [
              DataColumn(
                  label: Expanded(
                child: Text(
                  "Data",
                  textAlign: TextAlign.center,
                ),
              )),
              DataColumn(
                  label: Expanded(
                child: Text(
                  "T",
                  textAlign: TextAlign.center,
                ),
              )),
              DataColumn(
                  label: Expanded(
                child: Text(
                  "p",
                  textAlign: TextAlign.center,
                ),
              ))
            ],
            rows: mob.result_tabela.map((element) {
              conta = 0;
              index++;
              indexDado++;
              return DataRow(
                  color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    indeCo++;

                    if (indeCo % 2 == 0) {
                      return Theme.of(context).bottomAppBarColor;
                    }
                    return Theme.of(context).cardColor;
                  }),
                  cells: [
                    DataCell(
                      Center(
                        child: ResponsiveWidget.isSmallScreen(context)
                            ? Text(
                                DateFormat('dd/MM/yy').format(element.dataEnd!),
                                style: TextStyle(fontSize: 15),
                              )
                            : Text(
                                DateFormat('dd/MM/yy')
                                        .format(element.dataStrat!) +
                                    " - " +
                                    DateFormat('dd/MM/yy')
                                        .format(element.dataEnd!),
                                style: TextStyle(fontSize: 15),
                              ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: ImputTabela(
                            func: (e) {
                              element.t = double.parse(e);
                              print(e);
                            },
                            valor: element.t.toStringAsFixed(
                                2)), //Text(element.t!.toStringAsFixed(2)),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: ImputTabela(
                            func: (e) {
                              element.p = e;
                            },
                            valor: element.p!.toStringAsFixed(
                                2)), //Text(element.p!.toStringAsFixed(2)),
                      ),
                    ),
                  ]);
            }).toList(),
          ),
        ),
      );
    });
  }
}
