import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/mobx/dados_grafico.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class Grafico1 extends StatefulWidget {
  Grafico1({
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

class _GraficoState extends State<Grafico1> {
  final Mob_Grafico mob_graf = Mob_Grafico();
  List<dynamic> dados = [];
  int index = -1;
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
          primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Anos')),
          primaryYAxis: NumericAxis(title: AxisTitle(text: 'VPL (R\$)')),
          // Chart title
          title: ChartTitle(text: 'Fluxo de Caixa Livre (FCL)'),
          // Enable legend
          legend: Legend(
              isVisible: true,
              orientation: LegendItemOrientation.horizontal,
              position: LegendPosition.bottom),

          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<dynamic, String>>[
            ColumnSeries<dynamic, String>(
              // onRendererCreated: (ChartSeriesController controller) {
              // Assigning the controller to the _chartSeriesController.
              //  mob.chartSeriesController = controller;
              //},
              dataSource: mob_graf.dados1.cast<dynamic>(),

              xValueMapper: (dynamic sales, _) {
                if (index < mob_graf.meses.length - 1) {
                  index++;
                } else {
                  //index = 0;
                }

                return mob_graf.meses[index].toString().split('-')[0];
              },
              yValueMapper: (dynamic sales, _) => sales,
              name: 'Fluxo de Caixa',
              color: Colors.blueGrey,
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: false),
            ),
          ]),
    );
  }
}
