import 'dart:convert'; // Contains the JSON encoder
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'mob_dados.g.dart';

class Mob_dados = _Mob_dados with _$Mob_dados;

abstract class _Mob_dados with Store {
  _Mob_dados() {
    String s = "Hello";
    String f = " ffdf";
    String h = s + f;
    print(h.replaceAll('*', ''));
    autorun((_) {
      //conectar();
    });
  }
  @action
  Future<void> carregar() async {
    carrega = true;

    var result = await conectar();
    print(result.length);

    //await Future.delayed(Duration(seconds: 3));
    carrega = false;
  }

  @observable
  bool carrega = false;
  @observable
  List<DataClima> datas = [];
  @observable
  String estado = "";
  @observable
  String cad_min = "";
  @observable
  String grup_culura = "";
  @observable
  String gd = "";
  @observable
  String temp_base = "";
  @observable
  String neg_acumulado_inicial = "";
  @observable
  String armazenamento_inicial = "";
  @observable
  String umidade_colhida = "";
  @observable
  String indice_colheita = "";
  @observable
  String a = "";
  @observable
  String b = "";

  @observable
  String est_kc = "";
  @observable
  String est_ky = "";
  @observable
  String est_iaf = "";
  @observable
  String est_cad = "";

  @observable
  String des_kc = "";
  @observable
  String des_ky = "";
  @observable
  String des_iaf = "";
  @observable
  String des_cad = "";

  @observable
  String flo_kc = "";
  @observable
  String flo_ky = "";
  @observable
  String flo_iaf = "";
  @observable
  String flo_cad = "";

  @observable
  String fru_kc = "";
  @observable
  String fru_ky = "";
  @observable
  String fru_iaf = "";
  @observable
  String fru_cad = "";

  @observable
  String mat_kc = "";
  @observable
  String mat_ky = "";
  @observable
  String mat_iaf = "";
  @observable
  String mat_cad = "";

  @action
  void setEstado(valor) => estado = valor;
  @action
  void setCad_min(valor) => cad_min = valor;
  @action
  void setGrup_cultura(valor) => grup_culura = valor;
  @action
  void setGd(valor) => gd = valor;
  @action
  void setTemp_base(valor) => temp_base = valor;
  @action
  void setNeg_acumulado_inicial(valor) => neg_acumulado_inicial = valor;
  @action
  void setArmazenameto_inicial(valor) => armazenamento_inicial = valor;
  @action
  void setUmidade_colheita(valor) => umidade_colhida = valor;
  @action
  void setIndice_colheita(valor) => indice_colheita = valor;
  @action
  void setA(valor) => a = valor;
  @action
  void setB(valor) => b = valor;

  @action
  void setEst_kc(valor) => est_kc = valor;
  @action
  void setEst_ky(valor) => est_ky = valor;
  @action
  void setEst_iaf(valor) => est_iaf = valor;
  @action
  void setEst_cad(valor) => est_cad = valor;

  @action
  void setDes_kc(valor) => des_kc = valor;
  @action
  void setDes_ky(valor) => des_ky = valor;
  @action
  void setDes_iaf(valor) => des_iaf = valor;
  @action
  void setDes_cad(valor) => des_cad = valor;

  @action
  void setFlo_kc(valor) => flo_kc = valor;
  @action
  void setFlo_ky(valor) => flo_ky = valor;
  @action
  void setFlo_iaf(valor) => flo_iaf = valor;
  @action
  void setFlo_cad(valor) => flo_cad = valor;

  @action
  void setFru_kc(valor) => fru_kc = valor;
  @action
  void setFru_ky(valor) => fru_ky = valor;
  @action
  void setFru_iaf(valor) => fru_iaf = valor;
  @action
  void setFru_cad(valor) => fru_cad = valor;

  @action
  void setMat_kc(valor) => mat_kc = valor;
  @action
  void setMat_ky(valor) => mat_ky = valor;
  @action
  void setMat_iaf(valor) => mat_iaf = valor;
  @action
  void setMat_cad(valor) => mat_cad = valor;
}

Future<List<DataClima>> conectar() async {
  var aux = calculateDaysInterval(
      DateTime(
          DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
      DateTime.now());

  List<List<Climas>> clima = [];
  var cont = 0;
  for (var e in aux) {
    cont++;
    try {
      await Future.delayed(Duration(milliseconds: 100));
      clima.add(await getJason(
        DateFormat('yyyy-MM-dd ').format(e),
      ));
      //print(clima[clima.length - 1][0].TMAX18);
    } catch (f) {
      //print(
      //  DateFormat('yyyy-MM-dd ').format(e),
      //);
    }
    if (cont >= 30) {
      cont = 0;
      await Future.delayed(Duration(seconds: 10));
    }
  }
  print(clima.length);

  /*
  print("dd");
  var cont = 0;
  double mediaT = 0;
  double mediaP = 0;
  List<DataClima> result = [];
  for (var i = 0; i < aux.length; i++) {
    print(clima[i][0]);
    /*mediaT += double.parse(clima[i][0].TMAX18.replaceAll('*', ''));
    mediaP += double.parse(clima[i][0].PMAX12.replaceAll('*', ''));

    if (cont % 10 == 0) {
      print("aqui");

      result.add(DataClima(
          dataStrat:
              result.length == 0 ? aux[0] : result[result.length - 1].dataEnd,
          dataEnd: aux[i],
          p: mediaP / 10,
          t: mediaT / 10));
      mediaT = 0;
      mediaP = 0;
      cont = 0;
    }
    cont++;
  }*/
  }*/
  return [DataClima()];
}

List<DateTime> calculateDaysInterval(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i += 1) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}

class DataClima {
  DateTime? dataStrat;
  DateTime? dataEnd;
  double? t;
  double? p;
  DataClima({
    this.dataStrat,
    this.dataEnd,
    this.t,
    this.p,
  });
}

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

Future<List<Climas>> getJason(String dado) async {
  List<Climas> _postList = [];
  final response =
      await http.get('https://apitempo.inmet.gov.br/condicao/capitais/' + dado);

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
