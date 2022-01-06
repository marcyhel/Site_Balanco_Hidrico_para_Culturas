// ignore_for_file: sized_box_for_whitespace

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:plat11/screen/home/card_expanded.dart';
import 'package:plat11/screen/home/larg_home.dart';
import 'package:plat11/screen/home/small_home.dart';
import 'package:plat11/screen/widgets/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? const SmallHomePage()
        : const LargHomePage();
  }
}
