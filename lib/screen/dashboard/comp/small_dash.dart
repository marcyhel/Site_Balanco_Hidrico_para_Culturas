import 'package:flutter/material.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            TextLabel(texto: "Selecione seu estado"),
            DropDown(),
            TextLabel(texto: "CAD mínimo"),
            CustonTextField(valor: mob.cad_min, func: mob.setCad_min),
            TextLabel(texto: "Grupo de cultura"),
            GrupoCultura(),
            TextLabel(texto: "ΣGD"),
            CustonTextField(valor: mob.gd, func: mob.setGd),
            TextLabel(texto: "Temp.Base"),
            CustonTextField(valor: mob.temp_base, func: mob.setTemp_base),
            TextLabel(texto: "Neg-acumulado inicial"),
            CustonTextField(
                valor: mob.neg_acumulado_inicial,
                func: mob.setNeg_acumulado_inicial),
            TextLabel(texto: "Armazenamento inicial"),
            CustonTextField(
                valor: mob.armazenamento_inicial,
                func: mob.setArmazenameto_inicial),
            TextLabel(texto: "Umidade da parte colhida (%)"),
            CustonTextField(
                valor: mob.umidade_colhida, func: mob.setUmidade_colheita),
            TextLabel(texto: "Índice de Colheita (cH,Cc)"),
            CustonTextField(
                valor: mob.indice_colheita, func: mob.setIndice_colheita),
            TextLabel(texto: "A"),
            CustonTextField(valor: mob.a, func: mob.setA),
            TextLabel(texto: "B"),
            CustonTextField(valor: mob.b, func: mob.setB),
            TextLabelTitle(texto: "1 - Estabelecimento"),
            TextLabel(texto: "KC(v.mínimo)"),
            CustonTextField(valor: mob.est_kc, func: mob.setEst_kc),
            TextLabel(texto: "KY"),
            CustonTextField(valor: mob.est_ky, func: mob.setEst_ky),
            TextLabel(texto: "IAF"),
            CustonTextField(valor: mob.est_iaf, func: mob.setEst_iaf),
            TextLabel(texto: "CAD"),
            CustonTextField(valor: mob.est_cad, func: mob.setEst_cad),
            TextLabelTitle(texto: "2 - Des. Vegetativo"),
            TextLabel(texto: "KC(v.mínimo)"),
            CustonTextField(valor: mob.des_kc, func: mob.setDes_kc),
            TextLabel(texto: "KY"),
            CustonTextField(valor: mob.des_ky, func: mob.setDes_ky),
            TextLabel(texto: "IAF"),
            CustonTextField(valor: mob.des_iaf, func: mob.setDes_iaf),
            TextLabel(texto: "CAD"),
            CustonTextField(valor: mob.des_cad, func: mob.setDes_cad),
            TextLabelTitle(texto: "3 - Florescimento"),
            TextLabel(texto: "KC(v.mínimo)"),
            CustonTextField(valor: mob.flo_kc, func: mob.setFlo_kc),
            TextLabel(texto: "KY"),
            CustonTextField(valor: mob.flo_ky, func: mob.setFlo_ky),
            TextLabel(texto: "IAF"),
            CustonTextField(valor: mob.flo_iaf, func: mob.setFlo_iaf),
            TextLabel(texto: "CAD"),
            CustonTextField(valor: mob.flo_cad, func: mob.setFlo_cad),
            TextLabelTitle(texto: "4 - Frutificação"),
            TextLabel(texto: "KC(v.mínimo)"),
            CustonTextField(valor: mob.fru_kc, func: mob.setFru_kc),
            TextLabel(texto: "KY"),
            CustonTextField(valor: mob.fru_ky, func: mob.setFru_ky),
            TextLabel(texto: "IAF"),
            CustonTextField(valor: mob.fru_iaf, func: mob.setFru_iaf),
            TextLabel(texto: "CAD"),
            CustonTextField(valor: mob.fru_cad, func: mob.setFru_cad),
            TextLabelTitle(texto: "5 - Maturação"),
            TextLabel(texto: "KC(v.mínimo)"),
            CustonTextField(valor: mob.mat_kc, func: mob.setMat_kc),
            TextLabel(texto: "KY"),
            CustonTextField(valor: mob.mat_ky, func: mob.setMat_ky),
            TextLabel(texto: "IAF"),
            CustonTextField(valor: mob.mat_iaf, func: mob.setMat_iaf),
            TextLabel(texto: "CAD"),
            CustonTextField(valor: mob.mat_cad, func: mob.setMat_cad),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
