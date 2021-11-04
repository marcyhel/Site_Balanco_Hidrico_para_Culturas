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

class ResultadoFinal extends StatelessWidget {
  ResultadoFinal({Key? key}) : super(key: key);
  final Mob_dados mob = GetIt.I<Mob_dados>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
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
            padding: const EdgeInsets.all(5),
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
            padding: const EdgeInsets.all(5),
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
          )
        ],
      ),
    );
  }
}
