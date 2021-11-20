import 'dart:math';

import 'package:ai_progress/ai_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:gradient_progress/gradient_progress.dart';
import 'package:gradient_progress_indicator/widget/gradient_progress_indicator_widget.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';
import 'package:plat11/mobx/dados/mob_dados.dart';
import 'package:plat11/screen/principal.dart';
import 'package:plat11/screen/widgets/responsive.dart';

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
    await Future.delayed(Duration(seconds: Random().nextInt(1) + 0));
    for (var i = 0; i <= (Random().nextInt(20) + 30); i++) {
      await Future.delayed(Duration(milliseconds: 20));
      setState(() {
        widget.load += 0.01;
      });
    }
    await Future.delayed(Duration(milliseconds: Random().nextInt(500) + 500));
    for (var i = 0; i <= (Random().nextInt(20) + 10); i++) {
      await Future.delayed(Duration(milliseconds: 10));
      setState(() {
        widget.load += 0.01;
      });
    }
    await Future.delayed(Duration(seconds: Random().nextInt(1) + 1));
    for (var i = 0; i <= (Random().nextInt(20) + 40); i++) {
      if (widget.load < 100) {
        await Future.delayed(Duration(milliseconds: 20));
        setState(() {
          widget.load += 0.01;
        });
      }
    }
    await Future.delayed(Duration(milliseconds: 600));
    for (var i = 0; i <= (Random().nextInt(20) + 10); i++) {
      if (widget.load < 100) {
        await Future.delayed(Duration(milliseconds: 20));
        setState(() {
          widget.load += 0.01;
        });
      }
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Path _buildHeartPath() {
      return Path()
        ..moveTo(55, 15)
        ..cubicTo(55, 12, 50, 0, 30, 0)
        ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
        ..cubicTo(0, 55, 20, 77, 55, 95)
        ..cubicTo(90, 77, 110, 55, 110, 37.5)
        ..cubicTo(110, 37.5, 110, 0, 80, 0)
        ..cubicTo(65, 0, 55, 12, 55, 15)
        ..close();
    } /*
   ..moveTo(0, 250)
        ..cubicTo(50, 150, 160, 200, 200, 100)
        ..quadraticBezierTo(210, 65, 200, 50)
        ..quadraticBezierTo(200, 40, 210, 40)
        ..lineTo(205, 30)
        ..quadraticBezierTo(195, 30, 190, 40)
        ..cubicTo(150, 0, -20, 50, 0, 250)*/

    Path _buildFolhaPath() {
      return Path()
        ..moveTo(50, 250)
        ..cubicTo(100, 150, 210, 200, 250, 100)
        ..quadraticBezierTo(260, 65, 250, 50)
        ..quadraticBezierTo(250, 40, 260, 40)
        ..lineTo(255, 30)
        ..lineTo(305, 30)
        ..lineTo(255, 30)
        ..quadraticBezierTo(245, 30, 240, 35)
        ..quadraticBezierTo(90, 90, 70, 180)
        ..quadraticBezierTo(90, 90, 232, 32)
        // ..cubicTo(230, 30, 60, 175, 70, 180)
        //..cubicTo(50, 150, 100, 0, 235, 35)
        //..lineTo(70, 180)
        // ..lineTo(235, 35)

        ..cubicTo(170, 0, 20, 50, 50, 250)

        /*..cubicTo(0, 55, 20, 77, 55, 95)
        ..cubicTo(90, 77, 110, 55, 110, 37.5)
        ..cubicTo(110, 37.5, 110, 0, 80, 0)
        ..cubicTo(65, 0, 55, 12, 55, 15)*/
        ..close();
    }

    return Scaffold(
      body: Container(
        color: Colors.blueGrey[400],
        child: ResponsiveWidget.isSmallScreen(context)
            ? Center(
                child: LiquidCustomProgressIndicator(
                  value: widget.load,
                  direction: Axis.vertical,
                  backgroundColor: Colors.blueGrey[400],
                  valueColor: AlwaysStoppedAnimation(Colors.blueGrey.shade700),
                  shapePath: _buildFolhaPath(),
                  center: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text(
                      (widget.load * 100) > 100
                          ? '100%'
                          : "${(widget.load * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        color: Colors.blueGrey.shade200,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : Center(
                child: LiquidCustomProgressIndicator(
                  value: widget.load,
                  direction: Axis.vertical,
                  backgroundColor: Colors.blueGrey[400],
                  valueColor: AlwaysStoppedAnimation(Colors.blueGrey.shade700),
                  shapePath: _buildFolhaPath(),
                  center: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text(
                      (widget.load * 100) > 100
                          ? '100%'
                          : "${(widget.load * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        color: Colors.blueGrey.shade200,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
