import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';

class Linhas extends StatelessWidget {
  String tx1 = '';
  String tx2 = '';
  Linhas({
    Key? key,
    required this.tx1,
    required this.tx2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tx1),
          SizedBox(
            width: 10,
          ),
          // ignore: prefer_const_constructors
          Expanded(
            flex: 1,
            child: Divider(
              thickness: 1,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(tx2)
        ],
      ),
    );
  }
}

final Mob_dados mob = GetIt.I<Mob_dados>();

class LargResultado extends StatelessWidget {
  const LargResultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double space = MediaQuery.of(context).size.width / 50;
    print(space);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        color: Theme.of(context).backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).backgroundColor,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            color: Colors.black26,
                          ),
                        ]),
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: const [
                            SizedBox(height: 5),
                            Text("Fazes",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 25),
                            Text("Estabelecimento"),
                            SizedBox(height: 10),
                            Text("Des. Vegetativo"),
                            SizedBox(height: 10),
                            Text("Florescimento"),
                            SizedBox(height: 10),
                            Text("Frutificação"),
                            SizedBox(height: 10),
                            Text("Maturação"),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                          height: 150,
                          child: Expanded(
                            child: VerticalDivider(
                              thickness: 1,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: IntrinsicWidth(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text("Numero\nde dias"),
                                      SizedBox(width: space),
                                      const Text("1-(Eta/Etm)\nMédio"),
                                      SizedBox(width: space),
                                      const Text("ky"),
                                      (MediaQuery.of(context).size.width > 1050)
                                          ? SizedBox(width: space / 3)
                                          : SizedBox(width: space),
                                      const Text("Produtividade\nRelativa"),
                                      (MediaQuery.of(context).size.width > 1050)
                                          ? SizedBox(width: space)
                                          : SizedBox(width: 0),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          mob.final_est_num.toStringAsFixed(1)),
                                      SizedBox(width: space + 20),
                                      Text(
                                          mob.final_est_eta.toStringAsFixed(3)),
                                      SizedBox(width: space),
                                      Text(mob.final_est_ky.toStringAsFixed(2)),
                                      SizedBox(width: space + 5),
                                      Text(mob.final_est_prod
                                          .toStringAsFixed(1)),
                                      SizedBox(width: space),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          mob.final_des_num.toStringAsFixed(1)),
                                      SizedBox(width: space + 20),
                                      Text(
                                          mob.final_des_eta.toStringAsFixed(3)),
                                      SizedBox(width: space),
                                      Text(mob.final_des_ky.toStringAsFixed(2)),
                                      SizedBox(width: space + 5),
                                      Text(mob.final_des_prod
                                          .toStringAsFixed(1)),
                                      SizedBox(width: space),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          mob.final_flo_num.toStringAsFixed(1)),
                                      SizedBox(width: space + 20),
                                      Text(
                                          mob.final_flo_eta.toStringAsFixed(3)),
                                      SizedBox(width: space),
                                      Text(mob.final_flo_ky.toStringAsFixed(2)),
                                      SizedBox(width: space + 5),
                                      Text(mob.final_flo_prod
                                          .toStringAsFixed(1)),
                                      SizedBox(width: space),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          mob.final_fru_num.toStringAsFixed(1)),
                                      SizedBox(width: space + 20),
                                      Text(
                                          mob.final_fru_eta.toStringAsFixed(3)),
                                      SizedBox(width: space),
                                      Text(mob.final_fru_ky.toStringAsFixed(2)),
                                      SizedBox(width: space + 5),
                                      Text(mob.final_fru_prod
                                          .toStringAsFixed(1)),
                                      SizedBox(width: space),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          mob.final_mat_num.toStringAsFixed(1)),
                                      SizedBox(width: space + 20),
                                      Text(
                                          mob.final_mat_eta.toStringAsFixed(3)),
                                      SizedBox(width: space),
                                      Text(mob.final_mat_ky.toStringAsFixed(2)),
                                      SizedBox(width: space + 5),
                                      Text(mob.final_mat_prod
                                          .toStringAsFixed(1)),
                                      SizedBox(width: space),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).backgroundColor,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            color: Colors.black26,
                          ),
                        ]),
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 50),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Linhas(
                            tx1: 'Total de Dias',
                            tx2: mob.final_total_dias.toString()),
                        Linhas(
                            tx1: 'Quebra de produtividade',
                            tx2: (mob.final_quebra_produ.isNaN)
                                ? '0'
                                : mob.final_quebra_produ.toString()),
                        Linhas(
                            tx1: 'Produtividade Real',
                            tx2: mob.final_mat_prod.toString()),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).backgroundColor,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            color: Colors.black26,
                          ),
                        ]),
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      //(mob.some_y1 + mob.some_y2 + mob.some_y3 + mob.some_y4 + mob.some_y5)
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "FASES",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Proditividade\nRelativa',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Linhas(
                            tx1: "Estabelecimento",
                            tx2: mob.some_y1.toString()),
                        Linhas(
                            tx1: "Des. Vegetativo",
                            tx2: mob.some_y2.toString()),
                        Linhas(
                            tx1: "Florescimento", tx2: mob.some_y3.toString()),
                        Linhas(
                            tx1: "Frutificação", tx2: mob.some_y4.toString()),
                        Linhas(tx1: "Maturação", tx2: mob.some_y5.toString()),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).backgroundColor,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            color: Colors.black26,
                          ),
                        ]),
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 50),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Linhas(
                            tx1: 'Peso Seco',
                            tx2: mob.produtividade_potencial_peso.toString()),
                        Linhas(
                            tx1: 'Peso Úmido',
                            tx2: mob.produtividade_potencial_total.toString()),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
