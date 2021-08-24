import 'package:flutter/material.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:plat11/screen/dashboard/comp/drop.dart';
import 'package:plat11/screen/dashboard/comp/grupo_cultura.dart';
import 'package:plat11/screen/dashboard/comp/textLabel.dart';
import 'package:plat11/screen/dashboard/comp/textfield.dart';
import 'package:plat11/screen/widgets/responsive.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextLabel(texto: "Selecione seu estado"),
                    DropDown(),
                    TextLabel(texto: "CAD mínimo"),
                    CustonTextField(),
                    TextLabel(texto: "Grupo de cultura"),
                    GrupoCultura(),
                    TextLabel(texto: "ΣGD"),
                    CustonTextField(),
                    TextLabel(texto: "Temp.Base"),
                    CustonTextField(),
                    TextLabel(texto: "Neg-acumulado inicial"),
                    CustonTextField(),
                    TextLabel(texto: "Armazenamento inicial"),
                    CustonTextField(),
                    TextLabel(texto: "Umidade da parte colhida (%)"),
                    CustonTextField(),
                    TextLabel(texto: "Índice de Colheita (cH,Cc)"),
                    CustonTextField(),
                    TextLabel(texto: "A"),
                    CustonTextField(),
                    TextLabel(texto: "B"),
                    CustonTextField(),
                    TextLabelTitle(texto: "1-Estabelecimento"),
                    TextLabel(texto: "KC(v.mínimo)"),
                    CustonTextField(),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}
