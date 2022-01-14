import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:plat11/screen/widgets/responsive.dart';

class Carrocel extends StatefulWidget {
  Carrocel({Key? key}) : super(key: key);

  @override
  State<Carrocel> createState() => _CarrocelState();
}

class _CarrocelState extends State<Carrocel> {
  final List<String> images = [
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => Container(
            height: 50,
            width: (screenSize.width / 1),
            margin: EdgeInsets.all(7),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(2, 2),
                blurRadius: 5,
              ),
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
        .toList();
  }

  int _current = 0;
  List _isSelected = [true, false, false, false, false, false, false];
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return CarouselSlider(
      items: imageSliders,
      options: CarouselOptions(
          scrollPhysics: NeverScrollableScrollPhysics(),
          enlargeCenterPage: true,
          aspectRatio:
              ResponsiveWidget.isSmallScreen(context) ? 13 / 8 : 35 / 8,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
              for (int i = 0; i < imageSliders.length; i++) {
                if (i == index) {
                  _isSelected[i] = true;
                } else {
                  _isSelected[i] = false;
                }
              }
            });
          }),
      carouselController: _controller,
    );
  }
}
