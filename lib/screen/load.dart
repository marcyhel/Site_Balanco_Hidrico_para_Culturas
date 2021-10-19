import 'dart:math';

import 'package:ai_progress/ai_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:gradient_progress/gradient_progress.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/principal.dart';

class Load extends StatefulWidget {
  Load({Key? key}) : super(key: key);
  double load = 0.0;
  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  // AnimationController _animationController =AnimationController(vsync: True) ;
  final Mob_dados mob = GetIt.I<Mob_dados>();
  Future<void> carr() async {
    print(widget.load);
    await Future.delayed(Duration(seconds: Random().nextInt(1) + 1));
    for (var i = 0; i <= 30; i++) {
      await Future.delayed(Duration(milliseconds: 20));
      setState(() {
        widget.load += 0.01;
      });
    }
    await Future.delayed(Duration(milliseconds: Random().nextInt(500) + 500));
    for (var i = 0; i <= 10; i++) {
      await Future.delayed(Duration(milliseconds: 10));
      setState(() {
        widget.load += 0.01;
      });
    }
    await Future.delayed(Duration(seconds: Random().nextInt(1) + 1));
    for (var i = 0; i <= 50; i++) {
      await Future.delayed(Duration(milliseconds: 20));
      setState(() {
        widget.load += 0.01;
      });
    }
    await Future.delayed(Duration(milliseconds: 600));
    for (var i = 0; i <= 10; i++) {
      await Future.delayed(Duration(milliseconds: 20));
      setState(() {
        widget.load += 0.01;
      });
    }
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Principal()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    carr();
    // _animationController =
    //     new AnimationController(vsync: this, duration: Duration(seconds: 3));
    //_animationController.addListener(() => setState(() {}));
    // _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //mob.setLoad();
    return Container(
      color: Colors.blueGrey[400],
      child: Center(
        child: Container(
          //width: MediaQuery.of(context).size.width / 3,
          //height: MediaQuery.of(context).size.height / 3,
          child: GradientCircularProgressIndicator(
            gradientColors: [
              Colors.blueGrey.shade500,
              Colors.blueGrey.shade700
            ],
            radius: MediaQuery.of(context).size.width / 10,
            strokeWidth: MediaQuery.of(context).size.width / 25,
            value: widget.load, //new Tween(begin: 0.0, end: 1.0)
            //.animate(CurvedAnimation(
            //      parent: _animationController, curve: Curves.decelerate))
            // .value,
          ), /*AirDashboardStateProgressIndicator(
            size: Size(150, 150),
            value: widget.load, //1~100
            valueColor: Colors
                .amber, //ColorTween(begin: Colors.grey, end: Colors.blue).transform(_segmentValue / 10),
            pathStrokeWidth: 0,
            valueStrokeWidth: 40,
            gapDegree: 60,
            roundCap: true,
          ),*/
        ),
      ),
    );
  }
}
