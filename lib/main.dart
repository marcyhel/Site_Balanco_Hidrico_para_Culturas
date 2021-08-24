import 'package:flutter/material.dart';
import 'package:plat11/screen/principal.dart';

import 'dart:convert'; // Contains the JSON encoder
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
import 'package:html/dom.dart';
import 'package:plat11/util/themes.dart'; // Contains DOM related classes for extracting data from elements

class Climas {
  final String TMIN18;
  final String TMAX18;
  final String UMIN18;
  final String PMAX12;

  final String nome;

  Climas({
    required this.TMIN18,
    required this.TMAX18,
    required this.UMIN18,
    required this.PMAX12,
    required this.nome,
  });

  factory Climas.fromJson(Map<String, dynamic> json) {
    return Climas(
      TMIN18: json['TMIN18'],
      TMAX18: json['TMAX18'],
      UMIN18: json['UMIN18'],
      PMAX12: json['PMAX12'],
      nome: json['nome'],
    );
  }
}

Future<List<Climas>> getJason() async {
  List<Climas> _postList = [];
  final response = await http
      .get('https://apitempo.inmet.gov.br/condicao/capitais/2020-10-12');

  List<dynamic> values = [];
  values = json.decode(response.body);
  //print(values);
  if (response.statusCode == 200) {
    if (values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          Map<String, dynamic> map = values[i];

          _postList.add(Climas(
            nome: map['CAPITAL'],
            TMAX18: map['TMAX18'],
            TMIN18: map['TMIN18'],
            PMAX12: map['PMAX12'],
            UMIN18: map['UMIN18'],
          ));
        }
      }
    }
  }
  return _postList;
}

void main() async {
  List<Climas> lista = await getJason();
  print("**********");
  print(lista.length);
  print(lista[0].TMIN18);
  print("**********");
  runApp(EasyDynamicThemeWidget(child: MyApp()));
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
      home: Principal(),
    );
  }
}
