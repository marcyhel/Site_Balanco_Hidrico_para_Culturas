// ignore: file_names
import 'package:flutter/material.dart';

class LargTabela extends StatelessWidget {
  LargTabela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      interactive: true,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Scrollbar(
          interactive: true,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              showCheckboxColumn: true,
              columns: [
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
                  ],
                  onSelectChanged: (bool? value) {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
