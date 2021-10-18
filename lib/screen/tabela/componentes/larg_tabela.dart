// ignore: file_names
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:get_it/get_it.dart';
import 'package:lazy_data_table/lazy_data_table.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/tabela/componentes/cell.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class LargTabela extends StatelessWidget {
  LargTabela({Key? key}) : super(key: key);
  final _scrollController = ScrollController();
  final _scrollController2 = ScrollController();
  @override
  List<String> headerColumn = [
    'Qo\nmm/Evapor\naos 15 dias',
    'T ºC',
    'P\nmm',
    'N\nHoras',
    'I',
    'a',
    'ETP Thornthwaite 1948',
    'Kc',
    'CAD\nmm',
    'FASES DA CULTURA',
    'Ky',
    'Número de dias de cada fase',
    'GDi',
    'ΣGDI',
    'ETm\nmm',
    'Δ CAD\nmm',
    'P-ETm\nmm',
    'Fim do periodo Neg - Acumulado\nmm',
    'Inicio do prox. periodo Neg - Acumulado\nmm',
    'Fim do periodo ARM\nmm',
    'Inicio do prox. periodo ARM\nmm',
    'ALT\nmm',
    'ETa\nmm',
    'DEF\nmm',
    'EXC\nmm',
    'Eta/ETm',
    '1-(Eta/ETm)',
    'Qo (Cal/cm2.dia)',
    'IAF',
    'Yo\nkg/ha.dia',
    'Yc\nKg/ha.dia',
    'CTO',
    'CTC',
    'Rse\ncal/cm2.dia',
    'Qg\ncal/cm2.dia',
    'F',
    'Fase\nFenológica',
    'cL',
    'cN',
    'Yp\nkg/ha.decêndio',
  ];
  Widget build(BuildContext context) {
    return LazyDataTable(
      tableTheme: LazyDataTableTheme(
        cornerColor: Theme.of(context).cardColor,
        cornerBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        columnHeaderColor: Theme.of(context).cardColor,
        rowHeaderColor: Theme.of(context).cardColor,
        rowHeaderBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        alternateRowHeaderBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        alternateRowHeaderColor: Theme.of(context).bottomAppBarColor,
        alternateCellColor: Theme.of(context).bottomAppBarColor,
        cellColor: Theme.of(context).cardColor,
        columnHeaderBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        cellBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black12)),
        alternateCellBorder: const Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black12)),
      ),
      rows: mob.result_tabela.length,
      columns: headerColumn.length,
      tableDimensions: const LazyDataTableDimensions(
        cellHeight: 30,
        cellWidth: 100,
        topHeaderHeight: 90,
        leftHeaderWidth: 40,
      ),
      topHeaderBuilder: (i) => Center(child: Text(headerColumn[i])),
      leftHeaderBuilder: (i) => Center(child: Text("${i + 1}")),
      dataCellBuilder: (i, j) => Cell(i: i, j: j),
      /*dataCellBuilder: (i, j) {
        print('$i  -   $j');
        return Center(child: Text("Cell: $i, $j"));
      },*/
      topLeftCornerWidget: const Center(child: Text("")),
    ); /*DataTable2(
      headingRowHeight: 50.0,
      dataRowHeight: 40.0,
      showCheckboxColumn: true,
      columns: const [
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
        DataColumn(
          label: Text('Year'),
        ),
      ],
      rows: List<DataRow>.generate(
        20,
        (int index) => DataRow(
          cells: <DataCell>[
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
            DataCell(
              Text('Row $index'),
            ),
          ],
          onSelectChanged: (bool? value) {},
        ),
      ),
    );*/
  }
}
