import 'dart:math';
import 'dart:ui' as ui;

import 'package:eye_muslim/utils/my_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimeCircle extends StatefulWidget {
  const TimeCircle({
    super.key,
  });

  static late ui.Image imageTime;

  static Future loadImage() async {
    final data = await rootBundle.load(MyImages.sun);
    final image = await decodeImageFromList(data.buffer.asUint8List());
    imageTime = image;
  }

  @override
  State<TimeCircle> createState() => _TimeCircleState();
}

class _TimeCircleState extends State<TimeCircle> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HalfCirclePainter(conditionMet: false),
      child: const SizedBox(
        width: double.infinity,
        height: 250,
        child: Center(
            child: Column(
          children: [
            Text("data"),
          ],
        )),
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  final bool conditionMet;

  HalfCirclePainter({required this.conditionMet});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x80FFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      3.14,
      3.14,
      false,
      paint,
    );

    double sunAngle = (2 * pi * (0.99));

    double sunX = size.width / 2 + (size.width / 2 * cos(-pi / 2 + sunAngle));
    double sunY = size.height / 2 + (size.width / 2 * sin(-pi / 2 + sunAngle));

    // double centerX = size.width / 20;
    // double centerY = size.height / 20;
    // double svgX = centerX + 25;
    // double svgY = centerY;

    canvas.drawImage(
      TimeCircle.imageTime,
      Offset(sunX - 5, sunY - 5),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
