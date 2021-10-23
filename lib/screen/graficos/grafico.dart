import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/mobx/dados_grafico.dart';
import 'package:plat11/screen/graficos/componentes/grafic_1.dart';
import 'package:plat11/screen/graficos/componentes/grafic_2.dart';
import 'package:plat11/screen/graficos/componentes/grafic_3.dart';
import 'package:plat11/screen/graficos/componentes/grafic_4.dart';
import 'package:plat11/screen/widgets/responsive.dart';

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
        child: ResponsiveWidget.isSmallScreen(context) ? Small() : Larg(),
      ),
    );
  }
}

class Small extends StatelessWidget {
  const Small({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Grafico1(),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Grafico2(),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Grafico3(),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

class Larg extends StatelessWidget {
  const Larg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Grafico4(),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Grafico1(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.25,
              child: Grafico2(),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.25,
              child: Grafico3(),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
