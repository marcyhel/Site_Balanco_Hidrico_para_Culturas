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

  int index = -1;
  int index1 = -1;

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
          SplineSeries<dynamic, String>(
            dataSource: mob_graf.dados1.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.meses.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.meses[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return mob.result_tabela[index].eta;
            },
            name: 'ETa',
            color: Colors.blueGrey,
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          SplineSeries<dynamic, String>(
            dataSource: mob_graf.dados1.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.meses.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.meses[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return mob.result_tabela[index].etm;
            },
            name: 'ETm',
            color: Colors.blueGrey[100],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          SplineSeries<dynamic, String>(
            dataSource: mob_graf.dados1.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.meses.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.meses[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return mob.result_tabela[index].etp;
            },
            name: 'ETP',
            color: Colors.blue[300],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          ColumnSeries<dynamic, String>(
            dataSource: mob_graf.dados1.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.meses.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.meses[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return (mob.dados_ocultos[index].logica2 == 1) ? -8 : 0;
            },
            name: '1',
            color: Colors.red[300],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          ColumnSeries<dynamic, String>(
            dataSource: mob_graf.dados1.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.meses.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.meses[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return (mob.dados_ocultos[index].logica2 == 2) ? -8 : 0;
            },
            name: '2',
            color: Colors.green[300],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          ColumnSeries<dynamic, String>(
            dataSource: mob_graf.dados1.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.meses.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.meses[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return (mob.dados_ocultos[index].logica2 == 3) ? -8 : 0;
            },
            name: '3',
            color: Colors.yellow[300],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          ColumnSeries<dynamic, String>(
            dataSource: mob_graf.dados1.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.meses.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.meses[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return (mob.dados_ocultos[index].logica2 == 4) ? -8 : 0;
            },
            name: '4',
            color: Colors.purple[300],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
          ColumnSeries<dynamic, String>(
            dataSource: mob_graf.dados1.cast<dynamic>(),
            xValueMapper: (dynamic sales, _) {
              if (index < mob_graf.meses.length - 1) {
                index++;
              } else {
                index = 0;
              }
              return mob_graf.meses[index].toString();
            },
            yValueMapper: (dynamic sales, _) {
              return (mob.dados_ocultos[index].logica2 == 5) ? -8 : 0;
            },
            name: '5',
            color: Colors.pink[300],
            dataLabelSettings: DataLabelSettings(isVisible: false),
          ),
        ],
      ),
    );
  }
}
