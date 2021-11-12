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

class LargResultado extends StatelessWidget {
  const LargResultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Row(
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
      ),
    );
  }
}
