// ignore_for_file: sized_box_for_whitespace

import 'package:card_swiper/card_swiper.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'card_expanded.dart';

class SmallHomePage extends StatefulWidget {
  const SmallHomePage({Key? key}) : super(key: key);

  @override
  State<SmallHomePage> createState() => _SmallHomePageState();
}

class _SmallHomePageState extends State<SmallHomePage> {
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
              height: 200,
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
                autoplay: true,
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                pagination: SwiperPagination(alignment: Alignment.centerRight),
                control: SwiperControl(color: Colors.amber),
              ),
            ),
            const SizedBox(height: 50),
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
            /*Container(
              width: MediaQuery.of(context).size.width,
              child: Card3(
                titulo: "INMET",
                descricao: 'Sobre a API do INMET',
                resumo: " sdhj shdbjs dhs s dhshdkshd khs sk dhskdhskdh ksh kd",
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
        ),
      ),
    );
  }
}

class Card3 extends StatelessWidget {
  String titulo;
  String resumo;
  String descricao;
  String img;
  Card3({
    Key? key,
    required this.titulo,
    required this.resumo,
    required this.descricao,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildImg(Color color, double height) {
      return SizedBox(
        height: height,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
          ),
        ),
      );
    }

    buildCollapsed1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    titulo,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ]);
    }

    buildCollapsed2() {
      return Container(
        height: 100,
        width: double.infinity,
        child: Expanded(
          child: Image.asset(
            'assets/' + img,
            fit: BoxFit.cover,
          ),
        ),
      ); //buildImg(Colors.lightGreenAccent, 150);
    }

    buildCollapsed3() {
      return Container();
    }

    buildExpanded1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    titulo,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    descricao,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ]);
    }

    buildExpanded2() {
      return Container(
        height: 120,
        width: double.infinity,
        child: Expanded(
          child: Image.asset(
            'assets/' + img,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'lorem sdkljal dfjdksndfk sdjkfhsdkfsdhfk sjdkfshdfksd k sfh sdjkhf jksd fdhsk hfkd',
              softWrap: true,
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
      child: Builder(builder: (context) {
        var controller = ExpandableController.of(context, required: true)!;
        return GestureDetector(
          onTap: () {
            controller.toggle();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ScrollOnExpand(
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expandable(
                      collapsed: buildCollapsed1(),
                      expanded: buildExpanded1(),
                    ),
                    Expandable(
                      collapsed: buildCollapsed2(),
                      expanded: buildExpanded2(),
                    ),
                    Expandable(
                      collapsed: buildCollapsed3(),
                      expanded: buildExpanded3(),
                    ),
                    Divider(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Builder(
                            builder: (context) {
                              var controller = ExpandableController.of(context,
                                  required: true)!;
                              return controller.expanded
                                  ? Text("")
                                  : Text("EXPAND");
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
