import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';

import 'package:plat11/screen/widgets/responsive.dart';

import 'comp/larg_dash.dart';
import 'comp/small_dash.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final Mob_dados mob = GetIt.I<Mob_dados>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? SmallDashBord()
          : LargDashBord(),
    );
  }
}
