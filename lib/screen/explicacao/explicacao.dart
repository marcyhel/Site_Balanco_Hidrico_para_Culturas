import 'package:flutter/material.dart';
import 'package:plat11/screen/explicacao/larg_explicacao.dart';
import 'package:plat11/screen/widgets/responsive.dart';

class Explicacao extends StatelessWidget {
  const Explicacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: ResponsiveWidget.isSmallScreen(context)
              ? Container()
              : LargExplicacao(),
        ));
  }
}
