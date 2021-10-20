import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/mobx/dados_grafico.dart';
import 'package:plat11/screen/graficos/componentes/grafic_1.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class Grafico extends StatefulWidget {
  Grafico({
    Key? key,
  }) : super(key: key);

  @override
  _GraficoState createState() => _GraficoState();
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _GraficoState extends State<Grafico> {
  List<dynamic> dados = [];

  List<dynamic> data3 = [
    _SalesData('Ano 1', -30),
    _SalesData('Ano 2', 20),
    _SalesData('Ano 3', 30),
    _SalesData('Ano 4', 28),
    _SalesData('Ano 5', 30),
    _SalesData('Ano 6', 30),
  ];
  @override
  Widget build(BuildContext context) {
    ChartSeriesController? _chartSeriesController;
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Grafico1(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Grafico1(),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Grafico1(),
            ),
          ],
        ),
      ),
    );
  }
}
