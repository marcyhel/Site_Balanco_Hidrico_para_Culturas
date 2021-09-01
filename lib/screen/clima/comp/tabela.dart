import 'package:flutter/material.dart';
import 'dart:ui';

class Tabela extends StatelessWidget {
  Tabela({Key? key}) : super(key: key);
  int conta = 0;

  int index = 0;

  int indeCo = 1;
  List<List<String>> dados = [
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '5', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '5', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '5', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '5', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '5', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '5', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '5', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '2', '3'],
    ["1", '5', '3'],
    ["1", '2', '3'],
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
            top: 20, left: MediaQuery.of(context).size.width / 9),
        width: MediaQuery.of(context).size.width / 1.95,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.black26, offset: Offset(0, 0))
            ]),
        child: DataTable(
          dividerThickness: 0.1,
          columns: [
            DataColumn(
                label: Expanded(
                    child: Text(
              "Data",
              textAlign: TextAlign.center,
            ))),
            DataColumn(
                label: Expanded(
                    child: Text(
              "Temperatura",
              textAlign: TextAlign.center,
            ))),
            DataColumn(
                label: Expanded(
                    child: Text(
              "data",
              textAlign: TextAlign.center,
            )))
          ],
          rows: dados.map((e) {
            conta = 0;
            index++;
            return DataRow(
              color: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                indeCo++;

                if (indeCo % 2 == 0) {
                  return Theme.of(context).bottomAppBarColor;
                }
                return Theme.of(context).cardColor;
              }),
              cells: e.map((i) {
                return DataCell(
                  Center(child: Text(i)),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
