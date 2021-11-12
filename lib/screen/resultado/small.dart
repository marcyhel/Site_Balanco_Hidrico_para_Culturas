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
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: Divider(
              thickness: 1,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(tx2)
        ],
      ),
    );
  }
}

final Mob_dados mob = GetIt.I<Mob_dados>();

class SmallResultado extends StatelessWidget {
  SmallResultado({Key? key}) : super(key: key);
  double space = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                    color: Colors.black45,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Linhas(tx1: "Estabelecimento", tx2: mob.some_y1.toString()),
                  Linhas(tx1: "Des. Vegetativo", tx2: mob.some_y2.toString()),
                  Linhas(tx1: "Florescimento", tx2: mob.some_y3.toString()),
                  Linhas(tx1: "Frutificação", tx2: mob.some_y4.toString()),
                  Linhas(tx1: "Maturação", tx2: mob.some_y5.toString()),
                ],
              ),
            ),
            Container(
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
            Container(
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
                      SizedBox(height: 5),
                      Text("Des. Vegetativo"),
                      SizedBox(height: 5),
                      Text("Florescimento"),
                      SizedBox(height: 5),
                      Text("Frutificação"),
                      SizedBox(height: 5),
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: IntrinsicWidth(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              IntrinsicWidth(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Numero\nde dias"),
                                    SizedBox(width: space),
                                    const Text("1-(Eta/Etm)\nMédio"),
                                    SizedBox(width: space),
                                    const Text("ky"),
                                    SizedBox(width: space),
                                    const Text("Produtividade\nRelativa"),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(mob.final_est_num.toStringAsFixed(1)),
                                  SizedBox(width: space + 20),
                                  Text(mob.final_est_eta.toStringAsFixed(3)),
                                  SizedBox(width: space),
                                  Text(mob.final_est_ky.toStringAsFixed(2)),
                                  SizedBox(width: space + 5),
                                  Text(mob.final_est_prod.toStringAsFixed(1)),
                                  SizedBox(width: space),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(mob.final_des_num.toStringAsFixed(1)),
                                  SizedBox(width: space + 20),
                                  Text(mob.final_des_eta.toStringAsFixed(3)),
                                  SizedBox(width: space),
                                  Text(mob.final_des_ky.toStringAsFixed(2)),
                                  SizedBox(width: space + 5),
                                  Text(mob.final_des_prod.toStringAsFixed(1)),
                                  SizedBox(width: space),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(mob.final_flo_num.toStringAsFixed(1)),
                                  SizedBox(width: space + 20),
                                  Text(mob.final_flo_eta.toStringAsFixed(3)),
                                  SizedBox(width: space),
                                  Text(mob.final_flo_ky.toStringAsFixed(2)),
                                  SizedBox(width: space + 5),
                                  Text(mob.final_flo_prod.toStringAsFixed(1)),
                                  SizedBox(width: space),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(mob.final_fru_num.toStringAsFixed(1)),
                                  SizedBox(width: space + 20),
                                  Text(mob.final_fru_eta.toStringAsFixed(3)),
                                  SizedBox(width: space),
                                  Text(mob.final_fru_ky.toStringAsFixed(2)),
                                  SizedBox(width: space + 5),
                                  Text(mob.final_fru_prod.toStringAsFixed(1)),
                                  SizedBox(width: space),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(mob.final_mat_num.toStringAsFixed(1)),
                                  SizedBox(width: space + 20),
                                  Text(mob.final_mat_eta.toStringAsFixed(3)),
                                  SizedBox(width: space),
                                  Text(mob.final_mat_ky.toStringAsFixed(2)),
                                  SizedBox(width: space + 5),
                                  Text(mob.final_mat_prod.toStringAsFixed(1)),
                                  SizedBox(width: space),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                children: [
                  Linhas(
                      tx1: 'Total de Dias',
                      tx2: mob.final_total_dias.toString()),
                  Linhas(
                      tx1: 'Quebra de produtividade',
                      tx2: mob.final_quebra_produ.toString()),
                  Linhas(
                      tx1: 'Produtividade Real',
                      tx2: mob.final_mat_prod.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
