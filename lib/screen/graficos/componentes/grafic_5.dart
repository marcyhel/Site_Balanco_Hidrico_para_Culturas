import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/mobx/dados_grafico.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class Grafico5 extends StatefulWidget {
  Grafico5({
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

class _GraficoState extends State<Grafico5> {
  final Mob_Grafico mob_graf = Mob_Grafico();

  int index = -1;

  @override
  Widget build(BuildContext context) {
    ChartSeriesController? _chartSeriesController;

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black45, offset: Offset(2, 3), blurRadius: 10)
          ]),
      margin: EdgeInsets.all(10),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Tempo')),
        primaryYAxis: NumericAxis(title: AxisTitle(text: 'mm')),
        // Chart title
        title: ChartTitle(text: 'CAD e ARM Médios Mensais'),
        // Enable legend
        legend: Legend(
            isVisible: true,
            orientation: LegendItemOrientation.horizontal,
            position: LegendPosition.bottom),

        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<dynamic, String>>[
          SplineSeries<dynamic, String>(
            dataSource: mob_graf.dados4[0].cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.fases.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.fases[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              print(mob_graf.dados4[0].length);
              return mob_graf.dados4[0][index];
            },
            name: 'Kc',
            color: Colors.red[300],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          SplineSeries<dynamic, String>(
            dataSource: mob_graf.dados4[0].cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.fases.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.fases[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return mob_graf.dados4[1][index];
            },
            name: 'Kcdd',
            color: Colors.amber[300],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          SplineSeries<dynamic, String>(
            dataSource: mob_graf.dados4[0].cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.fases.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.fases[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return mob_graf.dados4[2][index];
            },
            name: 'Kcss',
            color: Colors.green[300],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
        ],
      ),
    );
  }
}
