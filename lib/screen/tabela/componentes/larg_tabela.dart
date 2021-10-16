// ignore: file_names
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

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
    'TempMéd Normal Decimal',
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
    'P-ETm\nmm'
  ];
  Widget build(BuildContext context) {
    return LazyDataTable(
      tableTheme: LazyDataTableTheme(
        cornerColor: Theme.of(context).cardColor,
        cornerBorder: Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        columnHeaderColor: Theme.of(context).cardColor,
        rowHeaderColor: Theme.of(context).cardColor,
        rowHeaderBorder: Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        alternateRowHeaderBorder: Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        alternateRowHeaderColor: Theme.of(context).bottomAppBarColor,
        alternateCellColor: Theme.of(context).bottomAppBarColor,
        cellColor: Theme.of(context).cardColor,
        columnHeaderBorder: Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black26)),
        cellBorder: Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black12)),
        alternateCellBorder: Border.fromBorderSide(
            BorderSide(width: 0.5, color: Colors.black12)),
      ),
      rows: 50,
      columns: headerColumn.length,
      tableDimensions: LazyDataTableDimensions(
        cellHeight: 30,
        cellWidth: 70,
        topHeaderHeight: 60,
        leftHeaderWidth: 40,
      ),
      topHeaderBuilder: (i) => Center(child: Text(headerColumn[i])),
      leftHeaderBuilder: (i) => Center(child: Text("${i + 1}")),
      dataCellBuilder: (i, j) => Center(child: Text("Cell: $i, $j")),
      topLeftCornerWidget: Center(child: Text("")),
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
