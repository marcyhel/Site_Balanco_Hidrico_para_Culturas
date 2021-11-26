import 'package:flutter/cupertino.dart';
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
      margin: const EdgeInsets.only(left: 50, top: 7, bottom: 7),
      width: MediaQuery.of(context).size.width / 1.8,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Expanded(
              child: Text(
                sigla,
                style: cor == '1'
                    ? TextStyle(color: Theme.of(context).canvasColor)
                    : null,
              ),
            ),
          ),
          Expanded(
            child: Text(
              texto,
              style: cor == '1'
                  ? TextStyle(color: Theme.of(context).canvasColor)
                  : null,
            ),
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
    ['ΣGDi', 'Somatório de Graus-Dia', '0'],
    ['Etm', 'Evapotranspiração máxima da Cultura', '0'],
    ['Δ CAD', 'Variação da CAD', '0'],
    [
      'Neg-Acumulado',
      'Soma dos Negativos Acumulados de P-ETm (A coluna Temporário só e utilizada para os cáculos.)',
      '0'
    ],
    [
      'ARM',
      'Armazenamento de água nas plantas (A coluna Temporário só é utilizada para os cáculos)',
      '0'
    ],
    ['ALT', 'Alteração do Armazenamento', '0'],
    ['ETa', 'Evapotranspiração Atual ou Real', '0'],
    ['DEF', 'Deficiência Hídrica da Cultura', '0'],
    ['EXC', 'Excedente Hídrico da Cultura', '0'],
  ];
  List<List<String>> list2 = [
    ['ETa/ETm', 'Evapotranspiração Relativa', '0'],
    [
      'Ky',
      'Fator de Resposta da Cultura - Deduzido para diferentes culturas de acordo com a fase fenológica',
      '1'
    ],
    ['1-(ETa/ETm)', 'Déficit de Evapotranspiração Relativa', '0'],
  ];
  List<List<String>> list3 = [
    [
      'a & b',
      'Coeficientes para o cálculo da Rad. Global (Rs = ( a+bxn / N )xQo. { Caso desconheca utilize vlrs Médios : a=0,25 b=0,50 }',
      '1'
    ],
    ['N', 'Fotoperíodo em horas', '0'],
    ['n', 'Número de Horas de Brilho Solar', '1'],
    ['IAF', 'Índice de Área Foliar', '1'],
    [
      'Yo',
      'Taxa de produção de matéria seca máxima de uma cultura para um dado local e dia nublado(p/temperaturas padronizadas). kg/ha.dia',
      '0'
    ],
    [
      'Yc',
      'Taxa de produção de matéria seca máxima de uma cultura para um dado local e dia claro(p/ temperaturas padronizadas). kg/ha.dia',
      '0'
    ],
    ['CTO', 'Fator de correção para dias nublados', '0'],
    ['CTC', 'Fator de correção para dias Claros', '0'],
    [
      'Rse',
      'Disponibilidade Máxima de radiação fotossinteticamente ativa em dias limpos. cal/cm2.dia',
      '0'
    ],
    ['Qg', 'Radiação Global (cal/cm2.dia)', '0'],
    [
      'F',
      'Fator de correção correspondente a fração de energia disponível',
      '0'
    ],
    ['cH', 'Correção ou Índice de colheita', '0'],
    ['cL', 'Correção da fotossíntese em função da superfície foliar', '0'],
    ['cN', 'Correção para efeitos de temperatura na taxa de respiração', '0'],
    ['Yp', 'Produtividade Potencial - Kg/ha.período', '0'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Instruções Gerai',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: const EdgeInsets.only(left: 200),
            width: MediaQuery.of(context).size.width * 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const Text(
                    'Preencha os dados necessários na telas de Dados iniciais e Dados do clima'),
                const Text(
                    'Todos os cálculos são dependentes do preenchimento correto dos dados para o cálculo do Balanço Hídrico'),
                const SizedBox(height: 20),
                Container(
                    margin: const EdgeInsets.only(left: 25),
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Divider()),
                const Text(
                  'Verifique o valor do grupo de culturas adequado      (Temp=oC)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Text(
                      'Grupo 1',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(' - '),
                    Expanded(
                      child: Text(
                          'Plantas C3 de Inverno : Feijão, Repolho, Grão de Bico,ervilha, Bata e Trigo ...(3<Temp<30)'),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Grupo 2',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(' - '),
                    Expanded(
                      child: Text(
                          'Plantas C3 de Verão:  Alfafa, Cítricos, Algodão,Amendoim,Pimentão,Arroz,açafrão,Soja,Girassol,Tabaco,Tomate, ...(15<Temp<40)'),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Grupo 3',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(' - '),
                    Expanded(
                        child: Text(
                            'Algumas Variedades de Milho e Sorgo(10<Temp<30)'))
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Grupo 4',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(' - '),
                    Expanded(
                      child: Text(
                          'Plantas C4: Milho, Sorgo Cana de Açúcar,....(14<Temp<40)'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 25),
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Divider()),
                const Text(
                  'Simbologia utilizada',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  children: const [
                    Text(
                      'Obs:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(' '),
                    Expanded(
                      child: Text(
                          'Dados que deverão ser fornecidos pelo usuário estão em vermelho.'),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.only(right: 50, left: 50),
                    child: const Text('Blanço Hidrico\ncom CAD\ne Kc Variavel'),
                  ),
                ),
                IntrinsicWidth(
                  child: Expanded(
                    child: Container(
                      color: Colors.blueGrey[400],
                      width: 3,
                      //height: 600,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.blueGrey[400],
                      width: 30,
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
                      color: Colors.blueGrey[400],
                      width: 30,
                      height: 3,
                      //height: 600,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.only(right: 50, left: 50),
                    child: const Text('Produtividade\nReal'),
                  ),
                ),
                IntrinsicWidth(
                  child: Expanded(
                    child: Container(
                      color: Colors.blueGrey[400],
                      width: 3,
                      //height: 600,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.blueGrey[400],
                      width: 30,
                      height: 3,
                      //height: 600,
                    ),
                    ...List<Widget>.generate(
                        list2.length,
                        (int index) => CustonLinha(
                              sigla: list2[index][0],
                              texto: list2[index][1],
                              cor: list2[index][2],
                            )).toList(),
                    Container(
                      color: Colors.blueGrey[400],
                      width: 30,
                      height: 3,
                      //height: 600,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.only(right: 50, left: 50),
                    child: const Text('Produtividade\nPotencial'),
                  ),
                ),
                IntrinsicWidth(
                  child: Expanded(
                    child: Container(
                      color: Colors.blueGrey[400],
                      width: 3,
                      //height: 600,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.blueGrey[400],
                      width: 30,
                      height: 3,
                      //height: 600,
                    ),
                    ...List<Widget>.generate(
                        list3.length,
                        (int index) => CustonLinha(
                              sigla: list3[index][0],
                              texto: list3[index][1],
                              cor: list3[index][2],
                            )).toList(),
                    Container(
                      color: Colors.blueGrey[400],
                      width: 30,
                      height: 3,
                      //height: 600,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
