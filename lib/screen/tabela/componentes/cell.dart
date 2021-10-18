import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:plat11/mobx/dados/mob_dados.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();
enum Estados { Estab, Des_Veg, Floresc, Frutif, Maturac, Vazio }

class Cell extends StatelessWidget {
  int i;
  int j;
  int resultado = 0;
  int precisao = 2;
  Cell({
    Key? key,
    required this.i,
    required this.j,
  }) : super(key: key);
  String veri(i, j) {
    if (j == 0) {
      return mob.result_tabela[i].qo.toStringAsFixed(precisao);
    } else if (j == 1) {
      return mob.result_tabela[i].t.toStringAsFixed(precisao);
    } else if (j == 2) {
      return mob.result_tabela[i].p.toStringAsFixed(precisao);
    } else if (j == 3) {
      return mob.result_tabela[i].horas.toStringAsFixed(precisao);
    } else if (j == 4) {
      return mob.result_tabela[i].i.toStringAsFixed(precisao);
    } else if (j == 5) {
      return mob.result_tabela[i].a.toStringAsFixed(precisao);
    } else if (j == 6) {
      return mob.result_tabela[i].etp.toStringAsFixed(precisao);
    } else if (j == 7) {
      return mob.result_tabela[i].kc.toStringAsFixed(precisao);
    } else if (j == 8) {
      return mob.dados_ocultos[i].cad.toStringAsFixed(precisao);
    } else if (j == 9) {
      return mob.dados_ocultos[i].logica3 == 0
          ? ''
          : (mob.dados_ocultos[i].logica3 == 1)
              ? 'Estab'
              : (mob.dados_ocultos[i].logica3 == 2)
                  ? 'Des_Veg'
                  : (mob.dados_ocultos[i].logica3 == 3)
                      ? 'Floresc'
                      : (mob.dados_ocultos[i].logica3 == 4)
                          ? 'Frutif'
                          : (mob.dados_ocultos[i].logica3 == 5)
                              ? 'Maturac'
                              : '';
    } else if (j == 10) {
      return (mob.result_tabela[i].ky != 0)
          ? mob.result_tabela[i].ky.toStringAsFixed(precisao)
          : '';
    } else if (j == 11) {
      return (mob.result_tabela[i].numero_dias_faze != 0)
          ? mob.result_tabela[i].numero_dias_faze.toStringAsFixed(precisao)
          : '';
    } else if (j == 12) {
      return (mob.result_tabela[i].gdi != 0)
          ? mob.result_tabela[i].gdi.toStringAsFixed(precisao)
          : '';
    } else if (j == 13) {
      return (mob.result_tabela[i].somegdi != 0)
          ? mob.result_tabela[i].somegdi.toStringAsFixed(precisao)
          : '';
    } else if (j == 14) {
      return (mob.result_tabela[i].etm != 0)
          ? mob.result_tabela[i].etm.toStringAsFixed(precisao)
          : '';
    } else if (j == 15) {
      return mob.result_tabela[i].delta_cad.toStringAsFixed(precisao);
    } else if (j == 16) {
      return mob.result_tabela[i].petm.toStringAsFixed(precisao);
    } else if (j == 17) {
      return (mob.result_tabela[i].fim_periodo_Neg != -999)
          ? mob.result_tabela[i].fim_periodo_Neg.toStringAsFixed(precisao)
          : '';
    } else if (j == 18) {
      return mob.result_tabela[i].inicio_periodo_Neg.toStringAsFixed(precisao);
    } else if (j == 19) {
      return mob.result_tabela[i].fim_periodo_Arm.toStringAsFixed(precisao);
    } else if (j == 20) {
      return mob.result_tabela[i].inicio_periodo_Arm.toStringAsFixed(precisao);
    } else if (j == 21) {
      return mob.result_tabela[i].alt.toStringAsFixed(precisao);
    } else if (j == 22) {
      return mob.result_tabela[i].eta.toStringAsFixed(precisao);
    } else if (j == 23) {
      return mob.result_tabela[i].def.toStringAsFixed(precisao);
    } else if (j == 24) {
      return mob.result_tabela[i].exc.toStringAsFixed(precisao);
    } else if (j == 25) {
      (mob.result_tabela[i].eta_etm != -999)
          ? mob.result_tabela[i].eta_etm.toStringAsFixed(precisao)
          : '';
    } else if (j == 26) {
      (mob.result_tabela[i].eta_etm_1 != -999)
          ? mob.result_tabela[i].eta_etm_1.toStringAsFixed(precisao)
          : '';
    } else if (j == 27) {
      return mob.result_tabela[i].qo_calc.toStringAsFixed(precisao);
    } else if (j == 28) {
      (mob.result_tabela[i].iaf != 0)
          ? mob.result_tabela[i].iaf.toStringAsFixed(precisao)
          : '';
    } else if (j == 29) {
      (mob.result_tabela[i].yo != 0)
          ? mob.result_tabela[i].yo.toStringAsFixed(precisao)
          : '';
    } else if (j == 30) {
      (mob.result_tabela[i].yc != 0)
          ? mob.result_tabela[i].yc.toStringAsFixed(precisao)
          : '';
    } else if (j == 31) {
      (mob.result_tabela[i].cto != 0)
          ? mob.result_tabela[i].cto.toStringAsFixed(precisao)
          : '';
    } else if (j == 32) {
      (mob.result_tabela[i].ctc != 0)
          ? mob.result_tabela[i].ctc.toStringAsFixed(precisao)
          : '';
    } else if (j == 33) {
      return mob.result_tabela[i].rse.toStringAsFixed(precisao);
    } else if (j == 34) {
      return mob.result_tabela[i].qg.toStringAsFixed(precisao);
    } else if (j == 35) {
      (mob.result_tabela[i].f != 0)
          ? mob.result_tabela[i].f.toStringAsFixed(precisao)
          : '';
    } else if (j == 36) {
      (mob.dados_ocultos[i].logica2 != 0)
          ? mob.dados_ocultos[i].logica2.toStringAsFixed(precisao)
          : '';
    } else if (j == 37) {
      (mob.result_tabela[i].cl != 0)
          ? mob.result_tabela[i].cl.toStringAsFixed(precisao)
          : '';
    } else if (j == 38) {
      (mob.result_tabela[i].cn != 0)
          ? mob.result_tabela[i].cn.toStringAsFixed(precisao)
          : '';
    } else if (j == 39) {
      (mob.result_tabela[i].yp != 0)
          ? mob.result_tabela[i].yp.toStringAsFixed(precisao)
          : '';
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(veri(i, j)),
    );
  }
}
