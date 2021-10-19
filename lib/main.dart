import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/load.dart';
import 'package:plat11/screen/principal.dart';

import 'dart:convert'; // Contains the JSON encoder
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
import 'package:html/dom.dart';
import 'package:plat11/util/themes.dart'; // Contains DOM related classes for extracting data from elements

void main() async {
  singletonsApp();

  runApp(EasyDynamicThemeWidget(child: MyApp()));
}

void singletonsApp() {
  GetIt.I.registerSingleton(Mob_dados());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: lightThemeData,
        darkTheme: darkThemeData,
        themeMode: EasyDynamicTheme.of(context).themeMode,
        home: Load() //Principal(),
        );
  }
}
