import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:plat11/screen/home/card_expanded.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List<Widget> _demo = [
    Container(height: 300, color: Colors.amber),
    Container(height: 300, color: Colors.black),
    Container(height: 300, color: Colors.blue),
    Container(height: 300, color: Colors.green),
  ];
  List<String> images = [
    'https://image.freepik.com/psd-gratuitas/capa-do-facebook-de-marketing-digital-e-modelo-de-banner-da-web_237398-139.jpg',
    'https://cdn.pixabay.com/photo/2015/11/19/08/51/banner-1050624_960_720.jpg',
    'https://image.freepik.com/vetores-gratis/fundo-de-banner-de-tecnologia-com-formas-hexagonais-e-espaco-de-texto_1017-22589.jpg',
    'https://cdn.pixabay.com/photo/2015/09/21/14/48/banner-949946_960_720.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Swiper(
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
                control: SwiperControl(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Card2()),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Card2()),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Card2()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Card2()),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Card2()),
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Card2()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
