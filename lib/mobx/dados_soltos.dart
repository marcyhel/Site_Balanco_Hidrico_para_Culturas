import 'package:get_it/get_it.dart';

import 'dados/mob_dados.dart';
import 'dart:math';

final Mob_dados mob = GetIt.I<Mob_dados>();

class DadosOcultos {
  int controle_logica = 0;
  double temp_logica = 0;
  double gdi_temp_l1 = 0;
  double gdi_temp_l2 = 0;
  double gdi_temp_l3 = 0;
  double gdi_temp_l4 = 0;
  double some_gdi_temp_l1 = 0;
  double some_gdi_temp_l2 = 0;
  double some_gdi_temp_l3 = 0;
  double some_gdi_temp_l4 = 0;
  double coluna_imprecao = 0;
  double fase_logica = 0;
  double da_cultura = 0;
  double cultura_logica = 0;
  double logica1 = 0;
  double logica2 = 0;
  double logica3 = 0;
  double m1 = 0;
  double d1 = 0;
  double y1 = 0;
  double m2 = 0;
  double d2 = 0;
  double y2 = 0;
  double m3 = 0;
  double d3 = 0;
  double y3 = 0;
  double m4 = 0;
  double d4 = 0;
  double y4 = 0;
  double m5 = 0;
  double d5 = 0;
  double y5 = 0;
  double cad = 0;
  double nda = 1;
  double d = 0;
}

List<DadosOcultos> dados = [];
void calcularDadosOcultos() {
  print("dados Ocultos");
  dados = [];
  for (var i = 0; i < mob.result_tabela.length; i++) {
    dados.add(DadosOcultos());
  }
  //-----------------------
  for (var i = 1; i < mob.result_tabela.length; i++) {
    if (i == 365) {}
    dados[i].nda = dados[i - 1].nda + 10;
  }
  //-------------
  for (var i = 0; i < mob.result_tabela.length; i++) {
    dados[i].d = 23.45 * sin(((360 / 365) * (dados[i].nda - 81)) * (pi / 180));
    dados[i].gdi_temp_l1 =
        (mob.result_tabela[i].t - double.parse(mob.temp_base)) * 10;
    //-------------------------
    try {
      dados[i].some_gdi_temp_l1 =
          dados[i].gdi_temp_l1 + dados[i - 1].some_gdi_temp_l1;
    } catch (e) {
      dados[i].some_gdi_temp_l1 = dados[i].gdi_temp_l1;
    }
    //-----------------
    if (dados[i].gdi_temp_l1 == 0 ||
        dados[i].some_gdi_temp_l1 < double.parse(mob.gd)) {
      dados[i].gdi_temp_l2 = dados[i].gdi_temp_l1;
    } else {
      dados[i].gdi_temp_l2 = 0;
    }
    //------------------------------------
    try {
      if (dados[i].gdi_temp_l2 == 0 && dados[i - 1].gdi_temp_l2 != 0) {
        dados[i].gdi_temp_l3 = dados[i].gdi_temp_l1;
      } else {
        dados[i].gdi_temp_l3 = 0;
      }
    } catch (e) {
      if (dados[i].gdi_temp_l2 == 0) {
        dados[i].gdi_temp_l3 = dados[i].gdi_temp_l1;
      } else {
        dados[i].gdi_temp_l3 = 0;
      }
    }
    //-------------------------------------------
    try {
      if (dados[i].gdi_temp_l3 != 0) {
        dados[i].gdi_temp_l4 =
            (double.parse(mob.gd) - dados[i - 1].some_gdi_temp_l1) /
                (mob.result_tabela[i].t - double.parse(mob.temp_base));
      } else {
        dados[i].gdi_temp_l4 = 0;
      }
    } catch (e) {
      dados[i].gdi_temp_l4 = 0;
    }
  }
  for (var i = 0; i < mob.result_tabela.length; i++) {
    if (dados[i].gdi_temp_l4 != 0) {
      mob.result_tabela[i].gdi =
          (mob.result_tabela[i].t - double.parse(mob.temp_base)) *
              dados[i].gdi_temp_l4;
    } else {
      mob.result_tabela[i].gdi = dados[i].gdi_temp_l2;
    }
  }
  for (var i = 0; i < mob.result_tabela.length; i++) {
    if (mob.result_tabela[i].gdi == 0) {
      dados[i].some_gdi_temp_l2 = 0;
    } else {
      dados[i].some_gdi_temp_l2 = mob.result_tabela[i].gdi;
    }
    //--------------------------------

    if (dados[i].some_gdi_temp_l2 == 0) {
      dados[i].some_gdi_temp_l3 = 0;
    } else {
      try {
        dados[i].some_gdi_temp_l3 =
            dados[i - 1].some_gdi_temp_l3 + dados[i].some_gdi_temp_l2;
      } catch (e) {
        dados[i].some_gdi_temp_l3 = 0 + dados[i].some_gdi_temp_l2;
      }
    }
    //------------------------------------------
    if (mob.result_tabela[i].gdi != 0) {
      dados[i].temp_logica = 10;
    } else {
      dados[i].temp_logica = dados[i].gdi_temp_l4;
    }
    //------------------------------------------
    if (dados[i].gdi_temp_l4 != 0) {
      mob.result_tabela[i].gdi =
          (mob.result_tabela[i].t - double.parse(mob.temp_base)) *
              dados[i].gdi_temp_l4;
    } else {
      mob.result_tabela[i].gdi = dados[i].gdi_temp_l2;
    }
  }
}

List<double> j = [
  10.7,
  10.7,
  10.7,
  11.2,
  11.4,
  10.7,
  10.7,
  10.4,
  9.4,
  9.3,
  8.8,
  8.9,
  8.2,
  7.5,
  7.3,
  7.0,
  6.7,
  6.4,
  6.4,
  6.7,
  6.8,
  7.0,
  7.2,
  7.9,
  8.2,
  8.3,
  8.8,
  9.1,
  9.4,
  10.1,
  10.1,
  9.7,
  10.4,
  10.5,
  10.6,
  10.7,
];

List<double> hn = [
  100.1070842,
  99.56051572,
  98.714882,
  97.49326149,
  96.17284668,
  94.70418531,
  93.453116,
  91.82771937,
  90.16678908,
  88.33732435,
  86.70684955,
  85.14361207,
  83.68764617,
  82.38474635,
  81.285118,
  80.37071352,
  79.85609702,
  79.67506702,
  79.83894333,
  80.33746613,
  81.14088105,
  82.32450904,
  83.61846207,
  85.06790846,
  86.78708518,
  88.41996811,
  90.08339651,
  91.74523952,
  93.37321906,
  94.93209154,
  96.51873668,
  97.79441567,
  98.85911895,
  99.66253387,
  100.1610567,
  100.324933,
  100.1070842,
  99.56051572,
  98.714882,
  97.49326149,
  96.17284668,
  94.70418531,
  93.453116,
  91.82771937,
  90.16678908,
  88.33732435,
  86.70684955,
  85.14361207,
  83.68764617,
  82.38474635,
  81.285118,
  80.37071352,
  79.85609702,
  79.67506702,
  79.83894333,
  80.33746613,
  81.14088105,
  82.32450904,
  83.61846207,
  85.06790846,
  86.78708518,
  88.41996811,
  90.08339651,
  91.74523952,
  93.37321906,
  94.93209154,
  96.51873668,
  97.79441567,
  98.85911895,
  99.66253387,
  100.1610567,
  100.324933,
  100.1070842,
  99.56051572,
  98.714882,
  97.49326149,
  96.17284668,
  94.70418531,
  93.453116,
  91.82771937,
  90.16678908,
  88.33732435,
  86.70684955,
  85.14361207,
  83.68764617,
  82.38474635,
  81.285118,
  80.37071352,
  79.85609702,
  79.67506702,
  79.83894333,
  80.33746613,
  81.14088105,
  82.32450904,
  83.61846207,
  85.06790846,
  86.78708518,
  88.41996811,
  90.08339651,
  91.74523952,
  93.37321906,
  94.93209154,
  96.51873668,
  97.79441567,
  98.85911895,
  99.66253387,
  100.1610567,
  100.324933,
];
