import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  String titulo;
  String resumo;
  String descricao;
  String img;
  Card2({
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
        height: 200,
        width: double.infinity,
        child: Image.asset(
          'assets/' + img,
          fit: BoxFit.cover,
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
        height: 200,
        width: double.infinity,
        child: Image.asset(
          'assets/' + img,
          fit: BoxFit.cover,
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
              resumo,
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
                                  : Text("Chique para Expandir!");
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
