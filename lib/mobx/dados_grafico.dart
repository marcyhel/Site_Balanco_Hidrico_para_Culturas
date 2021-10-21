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
  ObservableList<double> dados1 = ObservableList();

  @action
  void calc_meses() {
    for (var i = 0; i < mob.result_tabela.length; i++) {
      print(mob.result_tabela[i].dataEnd!.month);
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

    print(meses.length);
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
    print(meses);
  }
}
