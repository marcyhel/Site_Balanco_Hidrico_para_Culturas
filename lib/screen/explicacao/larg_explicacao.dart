import 'package:flutter/material.dart';

class CustonLinha extends StatelessWidget {
  String texto;
  String sigla;
  String cor;
  CustonLinha({
    Key? key,
    required this.texto,
    required this.sigla,
    required this.cor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 7, bottom: 7),
      child: Row(
        children: [
          SizedBox(
              width: 50,
              child: Text(
                sigla,
                style: cor == '1'
                    ? TextStyle(color: Theme.of(context).canvasColor)
                    : null,
              )),
          Text(
            texto,
            style: cor == '1'
                ? TextStyle(color: Theme.of(context).canvasColor)
                : null,
          ),
        ],
      ),
    );
  }
}

class LargExplicacao extends StatelessWidget {
  LargExplicacao({Key? key}) : super(key: key);
  List<List<String>> list1 = [
    [
      'Qo',
      'Radiação Solar diária no topo da atmosfera - Evaporação Equivalente no 15o dia do mês correspondente',
      '0'
    ],
    ['T', 'Temperatura - oC', '1'],
    ['P', 'Precipitação - mm ', '1'],
    ['ETP', 'Evapotranspiração Potencial - mm (milímetros)', '1'],
    [
      'Kc',
      'Coeficiente de cultura - Varia de acordo com as fases fenológicas da cultura( é função do IAF-Índica de Área Foliar)',
      '1'
    ],
    [
      'CAD',
      'Capacidade de Água Disponível - ( do solo pode ser calculado com CAD=0,01x(CC%-PM%)xDxZ, em que : CC% = Capacidade\nde Campo, PM%= Ponto de murcha permanente,D=Densidade Aparente do Solo,Z=Profundidade do Sistema Radicular)',
      '1'
    ],
    ['GDi', 'Graus-Dia - do período(GDi=(Tmédida-Tbase da cultura))', '1'],
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                const Text('Blanço Hidrico\ncom CAD\ne Kc Variavel'),
                IntrinsicWidth(
                  child: Expanded(
                    child: Container(
                      color: Colors.amber,
                      width: 3,
                      //height: 600,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 20,
                      height: 3,
                      //height: 600,
                    ),
                    ...List<Widget>.generate(
                        list1.length,
                        (int index) => CustonLinha(
                              sigla: list1[index][0],
                              texto: list1[index][1],
                              cor: list1[index][2],
                            )).toList(),
                    Container(
                      color: Colors.amber,
                      width: 20,
                      height: 3,
                      //height: 600,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
