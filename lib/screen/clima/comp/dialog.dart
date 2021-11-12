import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/widgets/responsive.dart';

class DialogCuston extends StatelessWidget {
  DialogCuston({Key? key}) : super(key: key);
  final Mob_dados mob = GetIt.I<Mob_dados>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        width: 200,
        height: ResponsiveWidget.isSmallScreen(context) ? 250 : 200,
        child: Column(
          children: [
            Text(
              "Sincronização com o banco de dados do INMET",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Pode demorar alguns minutos pois a API do INMET restringe o tempo de requisição!",
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancelar")),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text(
                              'Aguarde, estamos sincronizando os dados !')));
                      Navigator.of(context).pop();
                      //await Future.delayed(Duration(seconds: 2));
                      await mob.carregar();
                      mob.SalvarDados();
                    },
                    child: Text("OK")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
