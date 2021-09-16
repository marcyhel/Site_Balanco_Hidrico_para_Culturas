import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/clima/comp/dialog.dart';
import 'package:plat11/screen/clima/comp/larg_clima.dart';
import 'package:plat11/screen/clima/comp/pickr_data.dart';
import 'package:plat11/screen/clima/comp/small_clima.dart';
import 'package:plat11/screen/widgets/responsive.dart';

import 'comp/button_custon.dart';
import 'comp/tabela.dart';

class Clima extends StatefulWidget {
  const Clima({Key? key}) : super(key: key);

  @override
  _ClimaState createState() => _ClimaState();
}

final Mob_dados mob = GetIt.I<Mob_dados>();

class _ClimaState extends State<Clima> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          ResponsiveWidget.isSmallScreen(context) ? SmallClima() : LargClima(),
    );
  }
}
