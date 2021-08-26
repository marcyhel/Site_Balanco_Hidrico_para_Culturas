import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/dashboard/comp/text_label.dart';
import 'package:plat11/screen/dashboard/comp/textfield.dart';

import 'drop.dart';
import 'grupo_cultura.dart';

final Mob_dados mob = GetIt.I<Mob_dados>();

class LargDashBord extends StatelessWidget {
  LargDashBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double espa = 18;
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 10,
                            color: Colors.black26,
                          )
                        ]),
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextLabel(texto: "Selecione seu estado"),
                        DropDown(),
                        TextLabel(texto: "CAD mínimo"),
                        CustonTextField(
                            valor: mob.cad_min, func: mob.setCad_min),
                        TextLabel(texto: "ΣGD"),
                        CustonTextField(valor: mob.gd, func: mob.setGd),
                        TextLabel(texto: "Temp.Base"),
                        CustonTextField(
                            valor: mob.temp_base, func: mob.setTemp_base),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 10,
                            color: Colors.black26,
                          )
                        ]),
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextLabel(texto: "Grupo de cultura"),
                        GrupoCultura(),
                        TextLabel(texto: "A"),
                        CustonTextField(valor: mob.a, func: mob.setA),
                        TextLabel(texto: "B"),
                        CustonTextField(valor: mob.b, func: mob.setB),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 10,
                            color: Colors.black26,
                          )
                        ]),
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                            valor: mob.umidade_colhida,
                            func: mob.setUmidade_colheita),
                        TextLabel(texto: "Índice de Colheita (cH,Cc)"),
                        CustonTextField(
                            valor: mob.indice_colheita,
                            func: mob.setIndice_colheita),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.32,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 10,
                        color: Colors.black26,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: espa + 20),
                          TextLabelTitle(texto: "1 - Estabelecimento"),
                          SizedBox(height: espa),
                          TextLabelTitle(texto: "2 - Des. Vegetativo"),
                          SizedBox(height: espa),
                          TextLabelTitle(texto: "3 - Florescimento"),
                          SizedBox(height: espa),
                          TextLabelTitle(texto: "4 - Frutificação"),
                          SizedBox(height: espa),
                          TextLabelTitle(texto: "5 - Maturação"),
                          SizedBox(height: espa),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 9,
                      child: Column(
                        children: [
                          TextLabel(texto: "KC(v.mínimo)"),
                          CustonTextField(
                              valor: mob.est_kc, func: mob.setEst_kc),
                          CustonTextField(
                              valor: mob.des_kc, func: mob.setDes_kc),
                          CustonTextField(
                              valor: mob.flo_kc, func: mob.setFlo_kc),
                          CustonTextField(
                              valor: mob.fru_kc, func: mob.setFru_kc),
                          CustonTextField(
                              valor: mob.mat_kc, func: mob.setMat_kc),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 9,
                      child: Column(
                        children: [
                          TextLabel(texto: "KY"),
                          CustonTextField(
                              valor: mob.est_ky, func: mob.setEst_ky),
                          CustonTextField(
                              valor: mob.des_ky, func: mob.setDes_ky),
                          CustonTextField(
                              valor: mob.flo_ky, func: mob.setFlo_ky),
                          CustonTextField(
                              valor: mob.fru_ky, func: mob.setFru_ky),
                          CustonTextField(
                              valor: mob.mat_ky, func: mob.setMat_ky),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 9,
                      child: Column(
                        children: [
                          TextLabel(texto: "IAF"),
                          CustonTextField(
                              valor: mob.est_iaf, func: mob.setEst_iaf),
                          CustonTextField(
                              valor: mob.des_iaf, func: mob.setDes_iaf),
                          CustonTextField(
                              valor: mob.flo_iaf, func: mob.setFlo_iaf),
                          CustonTextField(
                              valor: mob.fru_iaf, func: mob.setFru_iaf),
                          CustonTextField(
                              valor: mob.mat_iaf, func: mob.setMat_iaf),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 9,
                      child: Column(
                        children: [
                          TextLabel(texto: "CAD"),
                          CustonTextField(
                              valor: mob.est_cad, func: mob.setEst_cad),
                          CustonTextField(
                              valor: mob.des_cad, func: mob.setDes_cad),
                          CustonTextField(
                              valor: mob.flo_cad, func: mob.setFlo_cad),
                          CustonTextField(
                              valor: mob.fru_cad, func: mob.setFru_cad),
                          CustonTextField(
                              valor: mob.mat_cad, func: mob.setMat_cad),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
