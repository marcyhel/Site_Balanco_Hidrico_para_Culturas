import 'dart:math';

import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'mob_dados.g.dart';

class Mob_dados = _Mob_dados with _$Mob_dados;

abstract class _Mob_dados with Store {
  _Mob_dados() {
    autorun((_) {
      print(estado);
    });
  }
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
