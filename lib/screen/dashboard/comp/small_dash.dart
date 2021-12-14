import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/dashboard/comp/drop.dart';
import 'package:plat11/screen/dashboard/comp/grupo_cultura.dart';
import 'package:plat11/screen/dashboard/comp/text_label.dart';
import 'package:plat11/screen/dashboard/comp/textfield.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class SmallDashBord extends StatelessWidget {
  const SmallDashBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        child: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              TextLabel(texto: "Selecione seu estado"),
              DropDown(),
              TextLabel(texto: "CAD mínimo"),
              CustonTextField(
                valor: mob.cad_min,
                func: mob.setCad_min,
                erro: mob.bool_cad_min,
              ),
              TextLabel(texto: "Grupo de cultura"),
              GrupoCultura(),
              TextLabel(texto: "ΣGD"),
              CustonTextField(
                  valor: mob.gd, func: mob.setGd, erro: mob.bool_gd),
              TextLabel(texto: "Temp.Base"),
              CustonTextField(
                  valor: mob.temp_base,
                  func: mob.setTemp_base,
                  erro: mob.bool_temp_base),
              TextLabel(texto: "Neg-acumulado inicial"),
              CustonTextField(
                  valor: mob.neg_acumulado_inicial,
                  func: mob.setNeg_acumulado_inicial,
                  erro: mob.bool_neg_acumulado_inicial),
              TextLabel(texto: "Armazenamento inicial"),
              CustonTextField(
                  valor: mob.armazenamento_inicial,
                  func: mob.setArmazenameto_inicial,
                  erro: mob.bool_armazenamento_inicial),
              TextLabel(texto: "Umidade da parte colhida (%)"),
              CustonTextField(
                  valor: mob.umidade_colhida,
                  func: mob.setUmidade_colheita,
                  erro: mob.bool_umidade_colhida),
              TextLabel(texto: "Índice de Colheita (cH,Cc)"),
              CustonTextField(
                  valor: mob.indice_colheita,
                  func: mob.setIndice_colheita,
                  erro: mob.bool_indice_colheita),
              TextLabel(texto: "A"),
              CustonTextField(valor: mob.a, func: mob.setA, erro: mob.bool_a),
              TextLabel(texto: "B"),
              CustonTextField(valor: mob.b, func: mob.setB, erro: mob.bool_b),
              TextLabelTitle(texto: "1 - Estabelecimento"),
              TextLabel(texto: "KC(v.mínimo)"),
              CustonTextField(
                  valor: mob.est_kc,
                  func: mob.setEst_kc,
                  erro: mob.bool_est_kc),
              TextLabel(texto: "KY"),
              CustonTextField(
                  valor: mob.est_ky,
                  func: mob.setEst_ky,
                  erro: mob.bool_est_ky),
              TextLabel(texto: "IAF"),
              CustonTextField(
                  valor: mob.est_iaf,
                  func: mob.setEst_iaf,
                  erro: mob.bool_est_iaf),
              TextLabel(texto: "CAD"),
              CustonTextField(
                  valor: mob.est_cad,
                  func: mob.setEst_cad,
                  erro: mob.bool_est_cad),
              TextLabelTitle(texto: "2 - Des. Vegetativo"),
              TextLabel(texto: "KC(v.mínimo)"),
              CustonTextField(
                  valor: mob.des_kc,
                  func: mob.setDes_kc,
                  erro: mob.bool_des_kc),
              TextLabel(texto: "KY"),
              CustonTextField(
                  valor: mob.des_ky,
                  func: mob.setDes_ky,
                  erro: mob.bool_des_ky),
              TextLabel(texto: "IAF"),
              CustonTextField(
                  valor: mob.des_iaf,
                  func: mob.setDes_iaf,
                  erro: mob.bool_des_iaf),
              TextLabel(texto: "CAD"),
              CustonTextField(
                  valor: mob.des_cad,
                  func: mob.setDes_cad,
                  erro: mob.bool_des_cad),
              TextLabelTitle(texto: "3 - Florescimento"),
              TextLabel(texto: "KC(v.mínimo)"),
              CustonTextField(
                  valor: mob.flo_kc,
                  func: mob.setFlo_kc,
                  erro: mob.bool_flo_kc),
              TextLabel(texto: "KY"),
              CustonTextField(
                  valor: mob.flo_ky,
                  func: mob.setFlo_ky,
                  erro: mob.bool_flo_ky),
              TextLabel(texto: "IAF"),
              CustonTextField(
                  valor: mob.flo_iaf,
                  func: mob.setFlo_iaf,
                  erro: mob.bool_flo_iaf),
              TextLabel(texto: "CAD"),
              CustonTextField(
                  valor: mob.flo_cad,
                  func: mob.setFlo_cad,
                  erro: mob.bool_flo_cad),
              TextLabelTitle(texto: "4 - Frutificação"),
              TextLabel(texto: "KC(v.mínimo)"),
              CustonTextField(
                  valor: mob.fru_kc,
                  func: mob.setFru_kc,
                  erro: mob.bool_fru_kc),
              TextLabel(texto: "KY"),
              CustonTextField(
                  valor: mob.fru_ky,
                  func: mob.setFru_ky,
                  erro: mob.bool_fru_ky),
              TextLabel(texto: "IAF"),
              CustonTextField(
                  valor: mob.fru_iaf,
                  func: mob.setFru_iaf,
                  erro: mob.bool_fru_iaf),
              TextLabel(texto: "CAD"),
              CustonTextField(
                  valor: mob.fru_cad,
                  func: mob.setFru_cad,
                  erro: mob.bool_fru_cad),
              TextLabelTitle(texto: "5 - Maturação"),
              TextLabel(texto: "KC(v.mínimo)"),
              CustonTextField(
                  valor: mob.mat_kc,
                  func: mob.setMat_kc,
                  erro: mob.bool_mat_kc),
              TextLabel(texto: "KY"),
              CustonTextField(
                  valor: mob.mat_ky,
                  func: mob.setMat_ky,
                  erro: mob.bool_mat_ky),
              TextLabel(texto: "IAF"),
              CustonTextField(
                  valor: mob.mat_iaf,
                  func: mob.setMat_iaf,
                  erro: mob.bool_mat_iaf),
              TextLabel(texto: "CAD"),
              CustonTextField(
                  valor: mob.mat_cad,
                  func: mob.setMat_cad,
                  erro: mob.bool_mat_cad),
              SizedBox(height: 50),
            ],
          );
        }),
      ),
    );
  }
}
