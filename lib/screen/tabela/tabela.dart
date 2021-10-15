import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/tabela/componentes/larg_tabela.dart';

import 'package:plat11/screen/widgets/responsive.dart';

class TabelaDados extends StatelessWidget {
  TabelaDados({Key? key}) : super(key: key);
  final Mob_dados mob = GetIt.I<Mob_dados>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child:
          ResponsiveWidget.isSmallScreen(context) ? LargTabela() : LargTabela(),
    );
  }
}
