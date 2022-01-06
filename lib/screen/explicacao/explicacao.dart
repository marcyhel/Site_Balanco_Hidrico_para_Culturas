import 'package:flutter/material.dart';
import 'package:plat11/screen/explicacao/larg_explicacao.dart';
import 'package:plat11/screen/explicacao/small_explicacao.dart';
import 'package:plat11/screen/widgets/responsive.dart';

class Explicacao extends StatelessWidget {
  Explicacao({Key? key}) : super(key: key);
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          controller: _controller,
          child: ResponsiveWidget.isSmallScreen(context)
              ? SmallExplicacao()
              : LargExplicacao(),
        ));
  }
}
