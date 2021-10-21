import 'dart:convert'; // Contains the JSON encoder
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:plat11/mobx/dados_grafico.dart';

import 'package:plat11/mobx/dados_soltos.dart';

part 'mob_dados.g.dart';

class Mob_dados = _Mob_dados with _$Mob_dados;

abstract class _Mob_dados with Store {
  Box box;
  _Mob_dados(
    this.box,
  ) {
    this.box;

    autorun((_) {
      //conectar();
    });

    carregaDados();
  }

  @action
  Future<void> carregar() async {
    carrega = true;

    var result = await conectar();
    print(result.length);
    setResult_tabela(result);
    //await Future.delayed(Duration(seconds: 3));
    carrega = false;
  }

  bool carregaManual() {
    carrega = true;
    var result = datasManual(dataStart, dataEnd);
    carrega = false;
    if (result.length > 0) {
      setResult_tabela(result);
      return true;
    } else {
      return false;
    }
  }

  @action
  bool calcula() {
    print("ewewewe");
    SalvarDados();
    Dados_Grafico();
    try {
      dados_ocultos = calcularDadosOcultos();
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  Future<void> carregaDados() async {
    box = await Hive.openBox('minhaCaixa1');
    print("carregado");
    if (box.get('dados') != null) {
      var result = box.get('dados');
      estado = result['estado'];
      cad_min = result['cad_min'];
      grup_culura = result['grup_culura'];
      gd = result['gd'];
      temp_base = result['temp_base'];
      neg_acumulado_inicial = result['neg_acumulado_inicial'];
      armazenamento_inicial = result['armazenamento_inicial'];
      umidade_colhida = result['umidade_colhida'];
      indice_colheita = result['indice_colheita'];
      a = result['a'];
      b = result['b'];
      est_kc = result['est_kc'];
      est_ky = result['est_ky'];
      est_iaf = result['est_iaf'];
      est_cad = result['est_cad'];
      des_kc = result['des_kc'];
      des_ky = result['des_ky'];
      des_iaf = result['des_iaf'];
      des_cad = result['des_cad'];
      flo_kc = result['flo_kc'];
      flo_ky = result['flo_ky'];
      flo_iaf = result['flo_iaf'];
      flo_cad = result['flo_cad'];
      fru_kc = result['fru_kc'];
      fru_ky = result['fru_ky'];
      fru_iaf = result['fru_iaf'];
      fru_cad = result['fru_cad'];
      mat_kc = result['mat_kc'];
      mat_ky = result['mat_ky'];
      mat_iaf = result['mat_iaf'];
      mat_cad = result['mat_cad'];
    } else {
      print("erro ao carregar dados");
    }
    if (box.get('result') != null) {
      var re = box.get('result');
      result_tabela = ObservableList();
      for (var i = 0; i < re['index']; i++) {
        result_tabela.add(DataClima(
            dataEnd: re['dataEnd' + i.toString()],
            t: re['t' + i.toString()],
            p: re['p' + i.toString()],
            dataStrat: re['dataStart' + i.toString()]));
      }
      calcula();
    } else {
      print("erro ao carregar dados resultado");
    }
  }

  @action
  Future<void> SalvarDados() async {
    try {
      var save = {
        'estado': estado,
        'cad_min': cad_min,
        'grup_culura': grup_culura,
        'gd': gd,
        'temp_base': temp_base,
        'neg_acumulado_inicial': neg_acumulado_inicial,
        'armazenamento_inicial': armazenamento_inicial,
        'umidade_colhida': umidade_colhida,
        'indice_colheita': indice_colheita,
        'a': a,
        'b': b,
        'est_kc': est_kc,
        'est_ky': est_ky,
        'est_iaf': est_iaf,
        'est_cad': est_cad,
        'des_kc': des_kc,
        'des_ky': des_ky,
        'des_iaf': des_iaf,
        'des_cad': des_cad,
        'flo_kc': flo_kc,
        'flo_ky': flo_ky,
        'flo_iaf': flo_iaf,
        'flo_cad': flo_cad,
        'fru_kc': fru_kc,
        'fru_ky': fru_ky,
        'fru_iaf': fru_iaf,
        'fru_cad': fru_cad,
        'mat_kc': mat_kc,
        'mat_ky': mat_ky,
        'mat_iaf': mat_iaf,
        'mat_cad': mat_cad,
      };

      var resu = {};
      resu['index'] = result_tabela.length;
      for (var i = 0; i < result_tabela.length; i++) {
        resu['p' + i.toString()] = result_tabela[i].p;
        resu['t' + i.toString()] = result_tabela[i].t;
        resu['dataEnd' + i.toString()] = result_tabela[i].dataEnd;
        resu['dataStart' + i.toString()] = result_tabela[i].dataStrat;
      }
      box.put('result', resu);
      box.put('dados', save);
    } catch (e) {
      print("erro al salvar");
    }
  }

  List<DadosOcultos> dados_ocultos = [];

  double cadini = 0;
  double negAcIni = 0;
  double aRMini = 0;

  double some_m1 = 0;
  double some_d1 = 0;
  double some_y1 = 0;
  double some_m2 = 0;
  double some_d2 = 0;
  double some_y2 = 0;
  double some_m3 = 0;
  double some_d3 = 0;
  double some_y3 = 0;
  double some_m4 = 0;
  double some_d4 = 0;
  double some_y4 = 0;
  double some_m5 = 0;
  double some_d5 = 0;
  double some_y5 = 0;
  double some_yp = 0;

  double final_est_num = 0;
  double final_est_eta = 0;
  double final_est_ky = 0;
  double final_est_prod = 0;

  double final_des_num = 0;
  double final_des_eta = 0;
  double final_des_ky = 0;
  double final_des_prod = 0;

  double final_flo_num = 0;
  double final_flo_eta = 0;
  double final_flo_ky = 0;
  double final_flo_prod = 0;

  double final_fru_num = 0;
  double final_fru_eta = 0;
  double final_fru_ky = 0;
  double final_fru_prod = 0;

  double final_mat_num = 0;
  double final_mat_eta = 0;
  double final_mat_ky = 0;
  double final_mat_prod = 0;

  double produtividade_potencial_peso = 0;
  double produtividade_potencial_agua = 0;
  double produtividade_potencial_total = 0;
  double final_total_dias = 0;
  double final_quebra_produ = 0;

  @observable
  double somatorio_i = 0;
  @observable
  double load = 5;
  @observable
  DateTime? dataStart;

  @observable
  DateTime? dataEnd;
  @observable
  ObservableList<DataClima> result_tabela = ObservableList();
  @observable
  bool carrega = false;
  @observable
  double some_i = 108.0238016;

  @observable
  String estado = "";
  @observable
  String cad_min = "0.0";
  @observable
  String grup_culura = "";
  @observable
  String gd = "0.0";
  @observable
  String temp_base = "0.0";
  @observable
  String neg_acumulado_inicial = "0.0";
  @observable
  String armazenamento_inicial = "0.0";
  @observable
  String umidade_colhida = "0.0";
  @observable
  String indice_colheita = "0.0";
  @observable
  String a = "0.0";
  @observable
  String b = "0.0";

  @observable
  String est_kc = "0.0";
  @observable
  String est_ky = "0.0";
  @observable
  String est_iaf = "0.0";
  @observable
  String est_cad = "0.0";

  @observable
  String des_kc = "0.0";
  @observable
  String des_ky = "0.0";
  @observable
  String des_iaf = "0.0";
  @observable
  String des_cad = "0.0";

  @observable
  String flo_kc = "0.0";
  @observable
  String flo_ky = "0.0";
  @observable
  String flo_iaf = "0.0";
  @observable
  String flo_cad = "0.0";

  @observable
  String fru_kc = "0.0";
  @observable
  String fru_ky = "0.0";
  @observable
  String fru_iaf = "0.0";
  @observable
  String fru_cad = "0.0";

  @observable
  String mat_kc = "0.0";
  @observable
  String mat_ky = "0.0";
  @observable
  String mat_iaf = "0.0";
  @observable
  String mat_cad = "0.0";

  @action
  void setDataStart(valor) => dataStart = valor;
  @action
  void setDataEnd(valor) => dataEnd = valor;
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
  @action
  void setResult_tabela(valor) => result_tabela = valor;
  @action
  Future<void> setLoad() async {
    print(load);
    await Future.delayed(Duration(seconds: 3));
    load = 30;
    await Future.delayed(Duration(seconds: 3));
    load = 60;
    //for (var i = 0; i <= 30; i++) {
    //  await Future.delayed(Duration(milliseconds: 200));
    //  load += 1;
    //}

    print(load);
  }
}

List<DataClima> datasManual(dataStart, dataEnd) {
  try {
    var aux = calculateDaysInterval(
        DateTime(DateTime.now().year - 1, DateTime.now().month - 2,
            DateTime.now().day),
        DateTime.now());
    ObservableList<DataClima> clima = ObservableList();
    var auau = aux[0];
    var cont = 0;
    for (var e in aux) {
      cont++;

      if (cont >= 10) {
        if (clima.length == 0) {
          clima.add(DataClima(dataEnd: e, t: 0, p: 0, dataStrat: auau));
        } else {
          clima.add(DataClima(
              dataEnd: e,
              t: 0,
              p: 0,
              dataStrat: clima[clima.length - 1].dataEnd));
        }
        cont = 0;
      }
    }

    return clima;
  } catch (e) {
    return [];
  }
}

Future<List<DataClima>> conectar() async {
  var aux = calculateDaysInterval(
      DateTime(DateTime.now().year - 1, DateTime.now().month - 2,
          DateTime.now().day),
      DateTime.now());

  List<List<Climas>> clima = [];
  var cont = 0;
  for (var e in aux) {
    cont++;
    while (true) {
      try {
        // await Future.delayed(Duration(milliseconds: 100));
        clima.add(await getJason(
          DateFormat('yyyy-MM-dd ').format(e),
        ));
        //print(clima[clima.length - 1][0].TMAX18);
        break;
      } catch (f) {
        //print(
        //  DateFormat('yyyy-MM-dd ').format(e),
        //);
      }
    }
    /*if (cont >= 30) {
      cont = 0;
      await Future.delayed(Duration(seconds: 10));
    }*/
  }
  print(clima.length);

  print("dd");
  cont = 0;
  double mediaT = 0;
  double mediaP = 0;
  ObservableList<DataClima> result = ObservableList();
  double tapaBuraco = 25;
  for (var i = 0; i < aux.length; i++) {
    print(clima[i][0]);
    try {
      mediaT += double.parse(clima[i][0].TMAX18.replaceAll('*', ''));
      tapaBuraco = double.parse(clima[i][0].TMAX18.replaceAll('*', ''));
    } catch (e) {
      mediaT += tapaBuraco;
    }
    try {
      mediaP += double.parse(clima[i][0].PMAX12.replaceAll('*', ''));
    } catch (e) {
      mediaP += mediaP / cont;
    }

    if (cont >= 10) {
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
  }

  return result;
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

  double t = 0;
  double p = 0;

  double qo = 0;
  double horas = 0;
  double i = 0;
  double somai = 0;
  double a = 0;
  double etp = 0;
  double kc = 0;
  double gdi = 0;
  double somegdi = 0;
  double ky = 0;
  double etm = 0;
  double numero_dias_faze = 0;
  double delta_cad = 0;
  double petm = 0;
  double fim_periodo_Neg = 0;
  double inicio_periodo_Neg = 0;
  double fim_periodo_Arm = 0;
  double inicio_periodo_Arm = 0;
  double alt = 0;
  double eta = 0;
  double def = 0;
  double exc = 0;

  double eta_etm = 0;
  double eta_etm_1 = 0;

  double qo_calc = 0;
  double iaf = 0;
  double yo = 0;
  double yc = 0;
  double cto = 0;
  double ctc = 0;
  double rse = 0;
  double qg = 0;
  double f = 0;

  double cl = 0;
  double cn = 0;
  double yp = 0;

  DataClima({
    this.dataStrat,
    this.dataEnd,
    this.t = 0,
    this.p = 0,
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
