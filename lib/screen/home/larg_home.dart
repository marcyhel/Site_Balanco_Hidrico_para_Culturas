import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'card_expanded.dart';

class LargHomePage extends StatefulWidget {
  const LargHomePage({Key? key}) : super(key: key);

  @override
  State<LargHomePage> createState() => _LargHomePageState();
}

class _LargHomePageState extends State<LargHomePage> {
  int pageIndex = 0;

  List<String> images = [
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    SwiperController controller = SwiperController();

    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Swiper(
                autoplayDelay: 7000,
                duration: 1500,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },

                // indicatorLayout: PageIndicatorLayout.,
                autoplay: true,
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                pagination: SwiperPagination(alignment: Alignment.centerRight),
                //control: SwiperControl(color: Colors.white),

                plugins: [
                  SwiperControl(color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Card2(
                    titulo: "Balanço Hídrico",
                    descricao:
                        'Balanço Hídrico de Cultivo específico de uma cultura',
                    resumo:
                        "O Balanço Hídrico de Cultivo específico de uma cultura (BH de Cultivo) visa calcular o balanço de água no solo levando-se em consideração tanto o tipo de vegetação quanto a sua fase de crescimento e desenvolvimento. Nessa situação, a planta não cobre totalmente o terreno e sua área foliar (superfície transpirante) varia com a idade (dias após plantio ou emergência). Portanto, a evapotranspiração nessa condição difere da potencial, sendo denominada de 'evapotranspiração da cultura'. Esta evapotranspiração é que será considerada no balanço hídrico de cultivos.",
                    img: '1.jpg',
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Card2(
                      titulo: "Como funciona ?",
                      descricao: 'O que precisa pra funcionar',
                      resumo:
                          "Para que o balanço hídrico possa ser feito precisamos que alguns dados sejam fornecidos, alguns deles são capacidade de agua disponivel, evapotranspiração potencial e entre outros, para mais detalhes entra na aba de explicações",
                      img: '2.jpg',
                    )),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Card2(
                    titulo: "Pra quem é esse Software",
                    descricao: 'Pra quem é esse Software',
                    resumo:
                        "È pra qualquer agricultar que queira uma segurança na sua lavoura, O balanço hídrico é uma ferramenta importante que pode ser utilizada para diversos fins, como: classificar o clima de uma região, identificar os períodos secos (deficiência hídrica) e úmidos (excedente hídrico) de uma determinada região utilizada para a agricultura, identificar os melhores períodos para colheita, irrigação, manejo do solo e entre outras práticas",
                    img: '3.jpg',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Card2(
                    titulo: "Beneficios",
                    descricao: 'Beneficios para sua empresa',
                    resumo:
                        "o balanço hídrico agrega eficiência à irrigação na medida em que, contabilizado, estima a relação entre quantidade de água e tempo de irrigação para as culturas. Todavia, a garantia de que as vantagens elencadas até aqui sejam obtidas no cultivo, é fundamental que o mapeamento da previsão do deficit hídrico seja feito adequadamente — evitando o desperdício de recursos hídricos, por exemplo.",
                    img: '4.jpg',
                  ),
                ),
                /* Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Card2(
                    titulo: "Quem somos",
                    descricao: 'Sobre o projeto',
                    resumo: "",
                    img: '5.jpg',
                  ),
                ),*/
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Card2(
                    titulo: "INMET",
                    descricao: 'Sobre a API do INMET',
                    resumo:
                        "Devido a API do INMET ter uma restrição de acesso por segundos e o nosso software precisar buscar os dados dos ultimos dois anos dia por dia, pode haver uma demora na sincronização dos dados de temperatura",
                    img: '6.jpg',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
