import 'package:get_it/get_it.dart';

import 'dados/mob_dados.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();
enum Estados { Estab, Des_Veg, Floresc, Frutif, Maturac, Vazio }

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
  double da_Logica = 0;
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
  double cto_g1 = 0;
  double cto_g2 = 0;
  double cto_g3 = 0;
  double cto_g4 = 0;
  double ctc_g1 = 0;
  double ctc_g2 = 0;
  double ctc_g3 = 0;
  double ctc_g4 = 0;
}

List<DadosOcultos> dados = [];
List<DadosOcultos> calcularDadosOcultos() {
  mob.cadini = 0;
  mob.negAcIni = 0;
  mob.aRMini = 0;

  mob.some_m1 = 0;
  mob.some_d1 = 0;
  mob.some_y1 = 0;
  mob.some_m2 = 0;
  mob.some_d2 = 0;
  mob.some_y2 = 0;
  mob.some_m3 = 0;
  mob.some_d3 = 0;
  mob.some_y3 = 0;
  mob.some_m4 = 0;
  mob.some_d4 = 0;
  mob.some_y4 = 0;
  mob.some_m5 = 0;
  mob.some_d5 = 0;
  mob.some_y5 = 0;
  mob.some_yp = 0;

  mob.final_est_num = 0;
  mob.final_est_eta = 0;
  mob.final_est_ky = 0;
  mob.final_est_prod = 0;

  mob.final_des_num = 0;
  mob.final_des_eta = 0;
  mob.final_des_ky = 0;
  mob.final_des_prod = 0;

  mob.final_flo_num = 0;
  mob.final_flo_eta = 0;
  mob.final_flo_ky = 0;
  mob.final_flo_prod = 0;

  mob.final_fru_num = 0;
  mob.final_fru_eta = 0;
  mob.final_fru_ky = 0;
  mob.final_fru_prod = 0;

  mob.final_mat_num = 0;
  mob.final_mat_eta = 0;
  mob.final_mat_ky = 0;
  mob.final_mat_prod = 0;

  mob.produtividade_potencial_peso = 0;
  mob.produtividade_potencial_agua = 0;
  mob.produtividade_potencial_total = 0;
  mob.final_total_dias = 0;
  mob.final_quebra_produ = 0;
  //print("dados Ocultos");
  //print("aquii 1");
  dados = [];
  for (var i = 0; i < mob.result_tabela.length; i++) {
    dados.add(DadosOcultos());
  }
  //-----------------------
  //print("aquii 2");
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

  //---------------------------------------
  for (var i = 0; i < mob.result_tabela.length; i++) {
    if (dados[i].gdi_temp_l4 != 0) {
      mob.result_tabela[i].gdi =
          (mob.result_tabela[i].t - double.parse(mob.temp_base)) *
              dados[i].gdi_temp_l4;
    } else {
      mob.result_tabela[i].gdi = dados[i].gdi_temp_l2;
    }

    if (mob.result_tabela[i].gdi != 0) {
      try {
        mob.result_tabela[i].somegdi =
            mob.result_tabela[i - 1].somegdi + mob.result_tabela[i].gdi;
      } catch (e) {
        mob.result_tabela[i].somegdi = 0 + mob.result_tabela[i].gdi;
      }
    } else {
      mob.result_tabela[i].somegdi = 0;
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
  }
  //print("aquii 3");
  //------------------------------------------
  int index = -1;
  //print(mob.result_tabela.length);
  mob.result_tabela.forEach((e) {
    index++;
    e.i = double.parse(pow((0.2 * e.t), 1.514).toString());
    //---------------------------------------
    e.horas = hn[index] * 2 / 15;
  });
  //---------------------------------------
  double soma = 0;
  mob.result_tabela.forEach((b) {
    soma += b.i;
  });
  mob.somatorio_i = soma / (3);

  //print(mob.somatorio_i);

  index = -1;
  mob.result_tabela.forEach((e) {
    index++;
    //---------------------------------------
    e.a = 0.49 +
        0.018 * mob.somatorio_i -
        7.7 * pow(10, -5) * pow(mob.somatorio_i, 2) +
        6.75 * pow(10, -7) * pow(mob.somatorio_i, 3);
    //---------------------------------------
    e.etp = (16 *
        pow((10 * (e.t / mob.somatorio_i)), e.a) *
        (e.i / 12) *
        (10 / 30));
    //print(e.a);
  });
  //print("aquii 4");
  //-----------------------------------------
  for (var i = 0; i < mob.result_tabela.length; i++) {
    //0,1101532 +7,051467*10^(-4)*T31+9,609335*10^(-7)*T31^2-7,328136*10^(-10)*T31^3

    if (dados[i].some_gdi_temp_l3 != 0) {
      mob.result_tabela[i].kc = double.parse((0.1101532 +
              7.051467 * pow(10, -4) * dados[i].some_gdi_temp_l3 +
              9.609335 * pow(10, -7) * pow(dados[i].some_gdi_temp_l3, 2) -
              7.328136 * pow(10, -10) * pow(dados[i].some_gdi_temp_l3, 3))
          .toStringAsFixed(1));
    } else {
      mob.result_tabela[i].kc = 1.0;
    }
    print(mob.result_tabela[i].kc);
    //---------------------------------------
    //print("aquii 4 1");
    mob.result_tabela[i].etm =
        mob.result_tabela[i].etp * mob.result_tabela[i].kc;
    //---------------------------------------
    mob.result_tabela[i].petm =
        mob.result_tabela[i].p * mob.result_tabela[i].etm;
    //---------------------------------------
    try {
      if (dados[i - 1].fase_logica == -999) {
        dados[i].fase_logica = -999;
      } else {
        if (dados[i].some_gdi_temp_l3 == 0) {
          dados[i].fase_logica = 0;
        } else {
          if (mob.result_tabela[i].kc <= double.parse(mob.est_kc)) {
            dados[i].fase_logica = 1;
          } else {
            if (mob.result_tabela[i].kc <= double.parse(mob.des_kc)) {
              dados[i].fase_logica = 2;
            } else {
              if (mob.result_tabela[i].kc <= double.parse(mob.flo_kc)) {
                dados[i].fase_logica = 3;
              } else
                dados[i].fase_logica = -999;
            }
          }
        }
      }
    } catch (e) {
      if (dados[i].some_gdi_temp_l3 == 0) {
        dados[i].fase_logica = 0;
      } else {
        if (mob.result_tabela[i].kc <= double.parse(mob.est_kc)) {
          dados[i].fase_logica = 1;
        } else {
          if (mob.result_tabela[i].kc <= double.parse(mob.des_kc)) {
            dados[i].fase_logica = 2;
          } else {
            if (mob.result_tabela[i].kc <= double.parse(mob.flo_kc)) {
              dados[i].fase_logica = 3;
            } else
              dados[i].fase_logica = -999;
          }
        }
      }
    }
    //print("aquii 4 2");
    //---------------------------------------
    if (dados[i].fase_logica == -999) {
      if (mob.result_tabela[i].kc >= double.parse(mob.fru_kc)) {
        dados[i].da_Logica = 4;
      } else {
        dados[i].da_Logica = -999;
      }
    } else {
      dados[i].da_Logica = 0;
    }
    //print("aquii 4 3");
    //---------------------------------------
    if (dados[i].da_Logica == -999) {
      dados[i].cultura_logica = 5;
    } else {
      dados[i].cultura_logica = 0;
    }
    //print("aquii 4 4");
    //---------------------------------------
    if (dados[i].fase_logica != 0 && dados[i].fase_logica != -999) {
      dados[i].logica1 = dados[i].fase_logica;
    } else {
      if (dados[i].da_Logica != 0 && dados[i].da_Logica != -999) {
        dados[i].logica1 = dados[i].da_Logica;
      } else {
        if (dados[i].cultura_logica == 5) {
          dados[i].logica1 = 5;
        } else {
          dados[i].logica1 = 0;
        }
      }
    }
    //print("aquii 4 5");
    //---------------------------------------
    if (dados[i].some_gdi_temp_l3 != 0) {
      dados[i].logica2 = dados[i].logica1;
    } else {
      dados[i].logica2 = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 1) {
      dados[i].logica3 = 1;
    }
    if (dados[i].logica2 == 2) {
      dados[i].logica3 = 2;
    }
    if (dados[i].logica2 == 3) {
      dados[i].logica3 = 3;
    }
    if (dados[i].logica2 == 4) {
      dados[i].logica3 = 4;
    }
    if (dados[i].logica2 == 5) {
      dados[i].logica3 = 5;
    }
    //print("aquii 4 6");
    //-----------------------------------------------------------
    if (double.parse(mob.cad_min) == 0) {
      mob.cadini = 0.00001;
    } else {
      mob.cadini = double.parse(mob.cad_min);
    }
    //-----------------------------------------------------------
    if (double.parse(mob.neg_acumulado_inicial) == 0) {
      mob.negAcIni = 0.00001;
    } else {
      mob.negAcIni = double.parse(mob.neg_acumulado_inicial);
    }
    //-----------------------------------------------------------
    if (double.parse(mob.armazenamento_inicial) == 0) {
      mob.aRMini = 0.00001;
    } else {
      mob.aRMini = double.parse(mob.armazenamento_inicial);
    }
    //-----------------------------------------------------------
    if (dados[i].temp_logica == 0) {
      dados[i].cad = mob.cadini;
    } else if (dados[i].logica2 == 1) {
      dados[i].cad = double.parse(mob.est_cad);
    } else if (dados[i].logica2 == 2) {
      dados[i].cad = double.parse(mob.des_cad);
    } else if (dados[i].logica2 == 3) {
      dados[i].cad = double.parse(mob.flo_cad);
    } else if (dados[i].logica2 == 4) {
      dados[i].cad = double.parse(mob.fru_cad);
    } else if (dados[i].logica2 == 5) {
      dados[i].cad = double.parse(mob.mat_cad);
    }

    //-----------------------------------------------------------
  }
  //print("aquii 4 7");
  for (var i = 0; i < mob.result_tabela.length; i++) {
    //-----------------------------------------------------------
    if (i == 0) {
      if (mob.result_tabela[i].petm < 0) {
        mob.result_tabela[i].fim_periodo_Neg =
            mob.negAcIni + mob.result_tabela[i].petm;
      } else {
        mob.result_tabela[i].fim_periodo_Neg = -999;
      }
    } else {
      if (mob.result_tabela[i].petm < 0) {
        mob.result_tabela[i].fim_periodo_Neg =
            mob.result_tabela[i - 1].inicio_periodo_Neg +
                mob.result_tabela[i].petm;
      } else {
        mob.result_tabela[i].fim_periodo_Neg = -999;
      }
    }
    //print("aquii 4 8");
    //-----------------------------------------------------------
    if (mob.result_tabela[i].petm < 0) {
      if (dados[i].cad *
              exp((mob.result_tabela[i].fim_periodo_Neg / dados[i].cad)) ==
          0) {
        dados[i].coluna_imprecao = 0.000001;
      } else {
        dados[i].coluna_imprecao = dados[i].cad *
            exp((mob.result_tabela[i].fim_periodo_Neg / dados[i].cad));
      }
    } else {
      if (i == 0) {
        dados[i].coluna_imprecao = mob.result_tabela[i].petm + mob.aRMini;
      } else {
        dados[i].coluna_imprecao = mob.result_tabela[i].petm +
            mob.result_tabela[i - 1].inicio_periodo_Arm;
      }
    }
    //print("aquii 4 8 1");
    //-----------------------------------------------------------
    if (dados[i].coluna_imprecao <= dados[i].cad) {
      mob.result_tabela[i].fim_periodo_Arm = dados[i].coluna_imprecao;
    } else {
      mob.result_tabela[i].fim_periodo_Arm = dados[i].cad;
    }
    //print(' -> ${dados[i].coluna_imprecao}');
    //print("aquii 4 8 2");
    //-----------------------------------------------------------
    if (i != mob.result_tabela.length - 1) {
      if (dados[i + 1].cad > dados[i].cad) {
        mob.result_tabela[i].inicio_periodo_Arm =
            mob.result_tabela[i].fim_periodo_Arm +
                (dados[i + 1].cad - dados[i].cad);
      } else {
        mob.result_tabela[i].inicio_periodo_Arm =
            mob.result_tabela[i].fim_periodo_Arm *
                dados[i + 1].cad /
                dados[i].cad;
      }
    } else {
      if (dados[i].cad > dados[i].cad) {
        mob.result_tabela[i].inicio_periodo_Arm =
            mob.result_tabela[i].fim_periodo_Arm +
                (dados[i].cad - dados[i].cad);
      } else {
        mob.result_tabela[i].inicio_periodo_Arm =
            mob.result_tabela[i].fim_periodo_Arm * dados[i].cad / dados[i].cad;
      }
    }
    //print("aquii 4 8 3");
    //-----------------------------------------------------------
    if (i != mob.result_tabela.length - 1) {
      mob.result_tabela[i].inicio_periodo_Neg = dados[i + 1].cad *
          log(mob.result_tabela[i].inicio_periodo_Arm / dados[i + 1].cad);
    } else {
      mob.result_tabela[i].inicio_periodo_Neg = dados[i].cad *
          log(mob.result_tabela[i].inicio_periodo_Arm / dados[i].cad);
    }
    //print("aquii 4 8 4");
    //-----------------------------------------------------------
    if (i == 0) {
      mob.result_tabela[i].delta_cad = dados[i].cad - mob.cadini;
    } else {
      mob.result_tabela[i].delta_cad = dados[i].cad - dados[i - 1].cad;
    }
    //print("aquii 4 9");
    //-----------------------------------------------------------
    if (dados[i].logica2 == 1) {
      mob.result_tabela[i].ky = double.parse(mob.est_ky);
    } else if (dados[i].logica2 == 2) {
      mob.result_tabela[i].ky = double.parse(mob.des_ky);
    } else if (dados[i].logica2 == 3) {
      mob.result_tabela[i].ky = double.parse(mob.flo_ky);
    } else if (dados[i].logica2 == 4) {
      mob.result_tabela[i].ky = double.parse(mob.fru_ky);
    } else if (dados[i].logica2 == 5) {
      mob.result_tabela[i].ky = double.parse(mob.mat_ky);
    }
    //-----------------------------------------------------------

    if (dados[i].gdi_temp_l4 == 0) {
      mob.result_tabela[i].numero_dias_faze = dados[i].temp_logica;
    } else {
      mob.result_tabela[i].numero_dias_faze = dados[i].gdi_temp_l4;
    }

    //-----------------------------------------------------------
    if (i == 0) {
      mob.result_tabela[i].alt =
          mob.result_tabela[i].fim_periodo_Arm - mob.aRMini;
    } else {
      mob.result_tabela[i].alt = mob.result_tabela[i].fim_periodo_Arm -
          mob.result_tabela[i - 1].fim_periodo_Arm;
    }

    //-----------------------------------------------------------
    if (mob.result_tabela[i].petm >= 0) {
      mob.result_tabela[i].eta = mob.result_tabela[i].etm;
    } else {
      mob.result_tabela[i].eta =
          mob.result_tabela[i].p + mob.result_tabela[i].alt.abs();
    }
    //-----------------------------------------------------------
    mob.result_tabela[i].def =
        mob.result_tabela[i].etm - mob.result_tabela[i].eta;
    //-----------------------------------------------------------
    if (mob.result_tabela[i].fim_periodo_Arm < dados[i].cad) {
      mob.result_tabela[i].exc = 0;
    } else if (mob.result_tabela[i].fim_periodo_Arm == dados[i].cad) {
      mob.result_tabela[i].exc =
          mob.result_tabela[i].petm - mob.result_tabela[i].alt;
    }
    //print("aquii 4 10");
    //-----------------------------------------------------------
    if (dados[i].temp_logica != 0) {
      mob.result_tabela[i].eta_etm =
          mob.result_tabela[i].eta / mob.result_tabela[i].etm;
    } else {
      mob.result_tabela[i].eta_etm = -999;
    }
    //-----------------------------------------------------------
    if (dados[i].temp_logica != 0) {
      mob.result_tabela[i].eta_etm_1 = 1 - mob.result_tabela[i].eta_etm;
    } else {
      mob.result_tabela[i].eta_etm_1 = -999;
    }
    //-----------------------------------------------------------

    //-----------------------------------------------------------
    double latitude = -22.45;
    mob.result_tabela[i].qo = 37.76 *
        (sin(radians(latitude)) * sin(radians(d[i])) * hn[i] * pi / 180 +
            cos(radians(latitude)) * cos(radians(d[i])) * sin(radians(hn[i]))) /
        2.45;
    //-----------------------------------------------------------
    mob.result_tabela[i].qo_calc = mob.result_tabela[i].qo * 59;
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].iaf = 0;
    } else if (dados[i].logica2 == 1) {
      mob.result_tabela[i].iaf = double.parse(mob.est_iaf);
    } else if (dados[i].logica2 == 2) {
      mob.result_tabela[i].iaf = double.parse(mob.des_iaf);
    } else if (dados[i].logica2 == 3) {
      mob.result_tabela[i].iaf = double.parse(mob.flo_iaf);
    } else if (dados[i].logica2 == 4) {
      mob.result_tabela[i].iaf = double.parse(mob.fru_iaf);
    } else if (dados[i].logica2 == 5) {
      mob.result_tabela[i].iaf = double.parse(mob.mat_iaf);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].yo = 0;
    } else {
      mob.result_tabela[i].yo = 31.7 + 0.219 * mob.result_tabela[i].qo_calc;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].yc = 0;
    } else {
      mob.result_tabela[i].yc = 107.2 + 0.36 * mob.result_tabela[i].qo_calc;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      dados[i].cto_g1 = 0;
    } else if (mob.result_tabela[i].t >= 15 && mob.result_tabela[i].qo <= 20) {
      dados[i].cto_g1 = 0.7 +
          0.035 * mob.result_tabela[i].t -
          0.001 * pow(mob.result_tabela[i].t, 2);
    } else {
      dados[i].cto_g1 = 0.25 +
          0.0875 * mob.result_tabela[i].t -
          0.0025 * pow(mob.result_tabela[i].t, 2);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      dados[i].cto_g2 = 0;
    } else if (mob.result_tabela[i].t >= 16.5 && mob.result_tabela[i].t <= 37) {
      dados[i].cto_g2 = 0.583 +
          0.014 * mob.result_tabela[i].t +
          0.0013 * pow(mob.result_tabela[i].t, 2) -
          0.000037 * pow(mob.result_tabela[i].t, 3);
    } else {
      dados[i].cto_g2 = -0.0425 +
          0.035 * mob.result_tabela[i].t +
          0.00325 * pow(mob.result_tabela[i].t, 2) -
          0.0000925 * pow(mob.result_tabela[i].t, 3);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      dados[i].cto_g3 = 0;
    } else if (mob.result_tabela[i].t >= 12.5 && mob.result_tabela[i].t <= 30) {
      dados[i].cto_g3 = -0.279 +
          0.143 * mob.result_tabela[i].t -
          0.0029 * pow(mob.result_tabela[i].t, 2);
    } else {
      dados[i].cto_g3 = -2.2 +
          0.3575 * mob.result_tabela[i].t -
          0.0074 * pow(mob.result_tabela[i].t, 2);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      dados[i].cto_g4 = 0;
    } else if (mob.result_tabela[i].t >= 16.5) {
      dados[i].cto_g4 = -1.064 +
          0.173 * mob.result_tabela[i].t -
          0.0029 * pow(mob.result_tabela[i].t, 2);
    } else {
      dados[i].cto_g4 = -4.16 +
          0.4325 * mob.result_tabela[i].t -
          0.00725 * pow(mob.result_tabela[i].t, 2);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      dados[i].ctc_g1 = 0;
    } else if (mob.result_tabela[i].t >= 15 && mob.result_tabela[i].t <= 20) {
      dados[i].ctc_g1 = 0.25 +
          0.0875 * mob.result_tabela[i].t -
          0.0025 * pow(mob.result_tabela[i].t, 2);
    } else {
      dados[i].ctc_g1 = -0.5 +
          0.175 * mob.result_tabela[i].t -
          0.005 * pow(mob.result_tabela[i].t, 2);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      dados[i].ctc_g2 = 0;
    } else if (mob.result_tabela[i].t >= 16.5 && mob.result_tabela[i].t <= 37) {
      dados[i].ctc_g2 = -0.0425 +
          0.035 * mob.result_tabela[i].t +
          0.00325 * pow(mob.result_tabela[i].t, 2) -
          0.0000925 * pow(mob.result_tabela[i].t, 3);
    } else {
      dados[i].ctc_g2 = -1.085 +
          0.07 * mob.result_tabela[i].t +
          0.0065 * pow(mob.result_tabela[i].t, 2) +
          0.000185 * pow(mob.result_tabela[i].t, 3);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      dados[i].ctc_g3 = 0;
    } else if (mob.result_tabela[i].t >= 12 && mob.result_tabela[i].t <= 30) {
      dados[i].ctc_g3 = -2.2 +
          0.3575 * mob.result_tabela[i].t -
          0.0074 * pow(mob.result_tabela[i].t, 2);
    } else {
      dados[i].ctc_g3 = -5.395 +
          0.715 * mob.result_tabela[i].t -
          0.0145 * pow(mob.result_tabela[i].t, 2);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      dados[i].ctc_g4 = 0;
    } else if (mob.result_tabela[i].t >= 16.5) {
      dados[i].ctc_g4 = -4.16 +
          0.4325 * mob.result_tabela[i].t -
          0.00725 * pow(mob.result_tabela[i].t, 2);
    } else {
      dados[i].ctc_g4 = 9.32 +
          0.865 * mob.result_tabela[i].t -
          0.0145 * pow(mob.result_tabela[i].t, 2);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].cto = 0;
    } else if (mob.grup_culura == 'Grupo 1') {
      mob.result_tabela[i].cto = dados[i].cto_g1;
    } else if (mob.grup_culura == 'Grupo 2') {
      mob.result_tabela[i].cto = dados[i].cto_g2;
    } else if (mob.grup_culura == 'Grupo 3') {
      mob.result_tabela[i].cto = dados[i].cto_g3;
    } else if (mob.grup_culura == 'Grupo 4') {
      mob.result_tabela[i].cto = dados[i].cto_g4;
    } else {
      mob.result_tabela[i].cto = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].ctc = 0;
    } else if (mob.grup_culura == 'Grupo 1') {
      mob.result_tabela[i].ctc = dados[i].ctc_g1;
    } else if (mob.grup_culura == 'Grupo 2') {
      mob.result_tabela[i].ctc = dados[i].ctc_g2;
    } else if (mob.grup_culura == 'Grupo 3') {
      mob.result_tabela[i].ctc = dados[i].ctc_g3;
    } else if (mob.grup_culura == 'Grupo 4') {
      mob.result_tabela[i].ctc = dados[i].ctc_g4;
    } else {
      mob.result_tabela[i].ctc = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].rse = 0;
    } else {
      mob.result_tabela[i].rse = 0.5 * double.parse(mob.a) +
          double.parse(mob.b) * mob.result_tabela[i].qo_calc;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].qg = 0;
    } else {
      mob.result_tabela[i].qg = (double.parse(mob.a) +
              double.parse(mob.b) *
                  mob.result_tabela[i].horas /
                  mob.result_tabela[i].horas) *
          mob.result_tabela[i].qo_calc;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].f = 0;
    } else {
      mob.result_tabela[i].f =
          (mob.result_tabela[i].rse - 0.5 * mob.result_tabela[i].qg) /
              (0.5 * double.parse(mob.b) * mob.result_tabela[i].qo_calc);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].cl = 0;
    } else {
      mob.result_tabela[i].cl = 0.0186 +
          0.37 * mob.result_tabela[i].iaf -
          0.035 * pow(mob.result_tabela[i].iaf, 2);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].cn = 0;
    } else if (mob.result_tabela[i].t <= 20) {
      mob.result_tabela[i].cn = 0.6;
    } else {
      mob.result_tabela[i].cn = 0.5;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].cl = 0;
    } else {
      mob.result_tabela[i].cl = 0.0186 +
          0.37 * mob.result_tabela[i].iaf -
          0.035 * pow(mob.result_tabela[i].iaf, 2);
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 0) {
      mob.result_tabela[i].yp = 0;
    } else {
      //print(mob.result_tabela[i].numero_dias_faze);
      //print("ddd - ${mob.result_tabela[i].numero_dias_faze}");
      //print(
      // "Marcyhel -- ${(mob.result_tabela[i].f * mob.result_tabela[i].cto * mob.result_tabela[i].yo + (1 - mob.result_tabela[i].f) * mob.result_tabela[i].ctc * mob.result_tabela[i].yc) * mob.result_tabela[i].cl * mob.result_tabela[i].cn * double.parse(mob.indice_colheita) * mob.result_tabela[i].numero_dias_faze}");
      mob.result_tabela[i].yp = (mob.result_tabela[i].f *
                  mob.result_tabela[i].cto *
                  mob.result_tabela[i].yo +
              (1 - mob.result_tabela[i].f) *
                  mob.result_tabela[i].ctc *
                  mob.result_tabela[i].yc) *
          mob.result_tabela[i].cl *
          mob.result_tabela[i].cn *
          double.parse(mob.indice_colheita) *
          mob.result_tabela[i].numero_dias_faze;
    }
    print("-< ${mob.result_tabela[i].yp} >-");
    //-----------------------------------------------------------
    if (dados[i].logica2 == 1) {
      dados[i].m1 = mob.result_tabela[i].eta_etm;
    } else {
      dados[i].m1 = -999;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 1) {
      dados[i].d1 = mob.result_tabela[i].numero_dias_faze;
    } else {
      dados[i].d1 = 0;
    }
    //-----------------------------------------------------------
    // print("ddd--------${mob.result_tabela[i].yp}---${dados[i].logica2}");
    if (dados[i].logica2 == 1) {
      dados[i].y1 = mob.result_tabela[i].yp;
    } else {
      dados[i].y1 = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 2) {
      dados[i].m2 = mob.result_tabela[i].eta_etm;
    } else {
      dados[i].m2 = -999;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 2) {
      dados[i].d2 = mob.result_tabela[i].numero_dias_faze;
    } else {
      dados[i].d2 = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 2) {
      dados[i].y2 = mob.result_tabela[i].yp;
    } else {
      dados[i].y2 = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 3) {
      dados[i].m3 = mob.result_tabela[i].eta_etm;
    } else {
      dados[i].m3 = -999;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 3) {
      dados[i].d3 = mob.result_tabela[i].numero_dias_faze;
    } else {
      dados[i].d3 = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 3) {
      dados[i].y3 = mob.result_tabela[i].yp;
      //print("aquiiii--");
    } else {
      dados[i].y3 = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 4) {
      dados[i].m4 = mob.result_tabela[i].eta_etm;
    } else {
      dados[i].m4 = -999;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 4) {
      dados[i].d4 = mob.result_tabela[i].numero_dias_faze;
    } else {
      dados[i].d4 = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 4) {
      dados[i].y4 = mob.result_tabela[i].yp;
      //print("aquiiii--!");
    } else {
      dados[i].y4 = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 5) {
      dados[i].m5 = mob.result_tabela[i].eta_etm;
    } else {
      dados[i].m5 = -999;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 5) {
      dados[i].d5 = mob.result_tabela[i].numero_dias_faze;
    } else {
      dados[i].d5 = 0;
    }
    //-----------------------------------------------------------
    if (dados[i].logica2 == 5) {
      dados[i].y5 = mob.result_tabela[i].yp;
    } else {
      dados[i].y5 = 0;
    }
    //-----------------------------------------------------------
    //-----------------------------------------------------------

  }
  int aux1 = 0;
  int aux2 = 0;
  int aux3 = 0;
  int aux4 = 0;
  int aux5 = 0;
  for (var i = 0; i < mob.result_tabela.length; i++) {
    print("--${dados[i].y1}");
    if (dados[i].m1 != -999) {
      mob.some_m1 += dados[i].m1;
      aux1++;
    }
    if (dados[i].d1 != -999) {
      mob.some_d1 += dados[i].d1;
    }
    if (dados[i].y1 != -999) {
      mob.some_y1 += dados[i].y1;
    }

    //-----------------------------------------------------------
    if (dados[i].m2 != -999) {
      mob.some_m2 += dados[i].m2;
      aux2++;
    }
    if (dados[i].d2 != -999) {
      mob.some_d2 += dados[i].d2;
    }
    if (dados[i].y2 != -999) {
      mob.some_y2 += dados[i].y2;
    }
    //-----------------------------------------------------------
    if (dados[i].m3 != -999) {
      aux3++;
      mob.some_m3 += dados[i].m3;
    }
    if (dados[i].d3 != -999) {
      mob.some_d3 += dados[i].d3;
    }
    if (dados[i].y3 != -999) {
      mob.some_y3 += dados[i].y3;
    }
    //-----------------------------------------------------------
    if (dados[i].m4 != -999) {
      aux4++;
      mob.some_m4 += dados[i].m4;
    }
    if (dados[i].d4 != -999) {
      mob.some_d4 += dados[i].d4;
    }
    if (dados[i].y4 != -999) {
      mob.some_y4 += dados[i].y4;
    }
    //-----------------------------------------------------------
    if (dados[i].m5 != -999) {
      aux5++;
      mob.some_m5 += dados[i].m5;
    }
    if (dados[i].d5 != -999) {
      mob.some_d5 += dados[i].d5;
    }
    if (dados[i].y5 != -999) {
      mob.some_y5 += dados[i].y5;
    }
    //-----------------------------------------------------------
    mob.some_yp += mob.result_tabela[i].yp;

    //-----------------------------------------------------------
    //-----------------------------------------------------------
    //-----------------------------------------------------------
    //-----------------------------------------------------------
    //-----------------------------------------------------------
    //-----------------------------------------------------------
    //-----------------------------------------------------------
  }

  print("-> ${mob.some_m4}");
  mob.final_est_num = mob.some_d1;
  if (aux1 != 0) {
    mob.final_est_eta = 1 - (mob.some_m1 / aux1);
  }
  mob.final_est_ky = double.parse(mob.est_ky);

  mob.final_des_num = mob.some_d2;
  if (aux2 != 0) {
    mob.final_des_eta = 1 - (mob.some_m2 / aux2);
  }
  mob.final_des_ky = double.parse(mob.des_ky);

  mob.final_flo_num = mob.some_d3;
  if (aux3 != 0) {
    mob.final_flo_eta = 1 - (mob.some_m3 / aux3);
  }
  mob.final_flo_ky = double.parse(mob.flo_ky);

  mob.final_fru_num = mob.some_d4;
  if (aux4 != 0) {
    mob.final_fru_eta = 1 - (mob.some_m4 / aux4);
  }
  mob.final_fru_ky = double.parse(mob.fru_ky);

  mob.final_mat_num = mob.some_d5;
  if (aux5 != 0) {
    mob.final_mat_eta = 1 - (mob.some_m5 / aux5);
  }
  mob.final_mat_ky = double.parse(mob.mat_ky);

  mob.final_total_dias = (mob.final_est_num +
      mob.final_des_num +
      mob.final_flo_num +
      mob.final_fru_num +
      mob.final_mat_num);

  print("marcyhel ${mob.some_y1}");
  print("marcyhel ${mob.some_y2}");
  print("marcyhel ${mob.some_y3}");
  print("marcyhel ${mob.some_y4}");
  print("marcyhel ${mob.some_y5}");
  print("marcyhel ${mob.produtividade_potencial_peso}");
  mob.produtividade_potencial_peso =
      (mob.some_y1 + mob.some_y2 + mob.some_y3 + mob.some_y4 + mob.some_y5);
  mob.produtividade_potencial_agua =
      mob.produtividade_potencial_peso * double.parse(mob.umidade_colhida);
  mob.produtividade_potencial_total =
      mob.produtividade_potencial_peso + mob.produtividade_potencial_agua;

  mob.final_est_prod = (1 - (mob.final_est_ky * mob.final_est_eta)) *
      mob.produtividade_potencial_total;
  mob.final_des_prod =
      (1 - (mob.final_des_ky * mob.final_des_eta)) * mob.final_est_prod;
  mob.final_flo_prod =
      (1 - (mob.final_flo_ky * mob.final_flo_eta)) * mob.final_des_prod;
  mob.final_fru_prod =
      (1 - (mob.final_fru_ky * mob.final_fru_eta)) * mob.final_flo_prod;
  mob.final_mat_prod =
      (1 - (mob.final_mat_ky * mob.final_mat_eta)) * mob.final_fru_prod;

  mob.final_quebra_produ =
      (1 - mob.final_mat_prod / mob.produtividade_potencial_total);
  print(mob.produtividade_potencial_total);
  print("fim calculo");
  return dados;
}

/*
 if (dados[i].logica2 == 0) {
      mob.result_tabela[i].cto = 0;
    } else if (mob.grup_culura == 'Grupo 1') {
      mob.result_tabela[i].cto = 0;
    }
*/

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
List<double> nda = [
  1,
  11,
  21,
  32,
  42,
  52,
  60,
  70,
  80,
  91,
  101,
  111,
  121,
  131,
  141,
  152,
  162,
  172,
  182,
  192,
  202,
  213,
  223,
  233,
  244,
  254,
  264,
  274,
  284,
  294,
  305,
  315,
  325,
  335,
  345,
  355,
  1,
  11,
  21,
  32,
  42,
  52,
  60,
  70,
  80,
  91,
  101,
  111,
  121,
  131,
  141,
  152,
  162,
  172,
  182,
  192,
  202,
  213,
  223,
  233,
  244,
  254,
  264,
  274,
  284,
  294,
  305,
  315,
  325,
  335,
  345,
  355,
];
List<double> d = [
  -23.01163673,
  -21.89848302,
  -20.13801482,
  -17.51649546,
  -14.58699625,
  -11.22630855,
  -8.293705065,
  -4.413916346,
  -0.403653202,
  4.016824231,
  7.914911995,
  11.57903665,
  14.90088746,
  17.78227121,
  20.13801482,
  22.03962456,
  23.085911,
  23.44978285,
  23.12048412,
  22.10774881,
  20.44151317,
  17.91318797,
  15.05618303,
  11.75412053,
  7.724628908,
  3.817824453,
  -0.201834077,
  -4.215526435,
  -8.104608732,
  -11.75412053,
  -15.36341658,
  -18.17103077,
  -20.44151317,
  -22.10774881,
  -23.12048412,
  -23.44978285,
  -23.01163673,
  -21.89848302,
  -20.13801482,
  -17.51649546,
  -14.58699625,
  -11.22630855,
  -8.293705065,
  -4.413916346,
  -0.403653202,
  4.016824231,
  7.914911995,
  11.57903665,
  14.90088746,
  17.78227121,
  20.13801482,
  22.03962456,
  23.085911,
  23.44978285,
  23.12048412,
  22.10774881,
  20.44151317,
  17.91318797,
  15.05618303,
  11.75412053,
  7.724628908,
  3.817824453,
  -0.201834077,
  -4.215526435,
  -8.104608732,
  -11.75412053,
  -15.36341658,
  -18.17103077,
  -20.44151317,
  -22.10774881,
  -23.12048412,
  -23.44978285,
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
