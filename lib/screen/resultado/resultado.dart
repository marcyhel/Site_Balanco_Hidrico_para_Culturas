import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/clima/comp/larg_clima.dart';
import 'package:plat11/screen/resultado/larg.dart';
import 'package:plat11/screen/resultado/small.dart';
import 'package:plat11/screen/widgets/responsive.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class ResultadoFinal extends StatelessWidget {
  ResultadoFinal({Key? key}) : super(key: key);
  double space = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? SmallResultado()
          : LargResultado(),
    );
  }
}
