import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/graficos/grafico.dart';

import 'package:mobx/mobx.dart';
part 'dados_grafico.g.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();
class Mob_Grafico = _Mob_GraficoBase with _$Mob_Grafico;

abstract class _Mob_GraficoBase with Store {
  _Mob_GraficoBase() {
    calc_meses();
  }
  @observable
  ObservableList<String> meses = ObservableList();
  @observable
  List<String> fases = [
    'Estabelecimento',
    'Des.vegetativo',
    'Florescimento',
    'Frutificação',
    'Maturação'
  ];
  @observable
  ObservableList<double> dados1 = ObservableList();
  @observable
  List<double> dados2 = [
    mob.final_est_num,
    mob.final_des_num,
    mob.final_flo_num,
    mob.final_fru_num,
    mob.final_mat_num
  ];
  @observable
  List<double> dados3 = [
    100 - ((mob.final_est_prod * 100) / mob.produtividade_potencial_total),
    100 - ((mob.final_des_prod * 100) / mob.produtividade_potencial_total),
    100 - ((mob.final_flo_prod * 100) / mob.produtividade_potencial_total),
    100 - ((mob.final_fru_prod * 100) / mob.produtividade_potencial_total),
    100 - ((mob.final_mat_prod * 100) / mob.produtividade_potencial_total),
  ];
  @observable
  List<List<double>> dados4 = [
    [
      double.parse(mob.est_kc),
      double.parse(mob.des_kc),
      double.parse(mob.flo_kc),
      double.parse(mob.fru_kc),
      double.parse(mob.mat_kc)
    ],
    [
      double.parse(mob.est_ky),
      double.parse(mob.des_ky),
      double.parse(mob.flo_ky),
      double.parse(mob.fru_ky),
      double.parse(mob.mat_ky)
    ],
    [
      double.parse(mob.est_iaf),
      double.parse(mob.des_iaf),
      double.parse(mob.flo_iaf),
      double.parse(mob.fru_iaf),
      double.parse(mob.mat_iaf)
    ]
  ];
  @action
  void calc_meses() {
    dados2.add(mob.final_est_num);
    dados2.add(mob.final_des_num);
    dados2.add(mob.final_flo_num);
    dados2.add(mob.final_fru_num);
    dados2.add(mob.final_mat_num);
    print(dados4);
    for (var i = 0; i < mob.result_tabela.length; i++) {
      if (mob.result_tabela[i].dataEnd!.month == 1) {
        meses.add('jan');
      } else if (mob.result_tabela[i].dataEnd!.month == 2) {
        meses.add('fev');
      } else if (mob.result_tabela[i].dataEnd!.month == 3) {
        meses.add('mar ');
      } else if (mob.result_tabela[i].dataEnd!.month == 4) {
        meses.add('abr');
      } else if (mob.result_tabela[i].dataEnd!.month == 5) {
        meses.add('mai');
      } else if (mob.result_tabela[i].dataEnd!.month == 6) {
        meses.add('jun');
      } else if (mob.result_tabela[i].dataEnd!.month == 7) {
        meses.add('jul');
      } else if (mob.result_tabela[i].dataEnd!.month == 8) {
        meses.add('ago');
      } else if (mob.result_tabela[i].dataEnd!.month == 9) {
        meses.add('set');
      } else if (mob.result_tabela[i].dataEnd!.month == 10) {
        meses.add('out');
      } else if (mob.result_tabela[i].dataEnd!.month == 11) {
        meses.add('nov');
      } else if (mob.result_tabela[i].dataEnd!.month == 12) {
        meses.add('dez');
      }
      meses[i] = mob.result_tabela[i].dataEnd!.day.toString() +
          '/' +
          meses[i].toString();
      dados1.add(Random().nextDouble());
    }
  }
}

class Dados_Grafico {
  List<String> meses = [];
  Dados_Grafico() {
    calc_meses();
  }
  void calc_meses() {
    for (var i = 0; i < mob.result_tabela.length; i++) {
      print(mob.result_tabela[i].dataEnd!.month);
      if (mob.result_tabela[i].dataEnd!.month == 1) {
        meses.add('jan');
      } else if (mob.result_tabela[i].dataEnd!.month == 2) {
        meses.add('fev');
      } else if (mob.result_tabela[i].dataEnd!.month == 3) {
        meses.add('mar');
      } else if (mob.result_tabela[i].dataEnd!.month == 4) {
        meses.add('abr');
      } else if (mob.result_tabela[i].dataEnd!.month == 5) {
        meses.add('mai');
      } else if (mob.result_tabela[i].dataEnd!.month == 6) {
        meses.add('jun');
      } else if (mob.result_tabela[i].dataEnd!.month == 7) {
        meses.add('jul');
      } else if (mob.result_tabela[i].dataEnd!.month == 8) {
        meses.add('ago');
      } else if (mob.result_tabela[i].dataEnd!.month == 9) {
        meses.add('set');
      } else if (mob.result_tabela[i].dataEnd!.month == 10) {
        meses.add('out');
      } else if (mob.result_tabela[i].dataEnd!.month == 11) {
        meses.add('nov');
      } else if (mob.result_tabela[i].dataEnd!.month == 12) {
        meses.add('dez');
      }
    }
  }
}
