import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/clima/clima.dart';
import 'package:plat11/screen/load.dart';
import 'package:plat11/screen/principal.dart';

import 'dart:convert'; // Contains the JSON encoder
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
import 'package:html/dom.dart';
import 'package:plat11/util/themes.dart'; // Contains DOM related classes for extracting data from elements

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('minhaCaixa1');
  singletonsApp(box);

  runApp(EasyDynamicThemeWidget(child: MyApp()));
}

void singletonsApp(box) {
  GetIt.I.registerSingleton(Mob_dados(box));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balanço Hídrico para Culturas',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Load(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => Principal(indexx: 0),
        '/clima': (context) => Principal(indexx: 1),
        '/expecifica': (context) => Principal(indexx: 2),
        '/tabela': (context) => Principal(indexx: 3),
        '/grafico': (context) => Principal(indexx: 4),
        '/resultados': (context) => Principal(indexx: 5),
        '/explicacao': (context) => Principal(indexx: 6),
      },
    );
  }
}
