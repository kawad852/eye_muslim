import 'dart:math';
import 'dart:ui' as ui;

import 'package:eye_muslim/screens/home/widgets/prayer_date.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/utils/my_images.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
      painter: HalfCirclePainter(),
      child: SizedBox(
        width: 300,
        height: 250,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomText(
                "الظهر",
                color: context.colorPalette.white,
                fontSize: 20,
              ),
              CustomText(
                DateFormat("a hh:mm").format(DateTime.now()),
                color: context.colorPalette.white,
                fontSize: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: CustomText(
                  context.appLocalization.willStartDuring(4, 15),
                  color: context.colorPalette.white,
                  fontSize: 16,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSvg(MyIcons.fajr),
                  CustomSvg(MyIcons.noon),
                  CustomSvg(MyIcons.hsr),
                  CustomSvg(MyIcons.maghrib),
                  CustomSvg(MyIcons.isha),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrayerDate(
                      prayerName: context.appLocalization.fajr,
                      prayerDate: DateTime.now(),
                    ),
                    PrayerDate(
                      prayerName: context.appLocalization.noon,
                      prayerDate: DateTime.now(),
                    ),
                    PrayerDate(
                      prayerName: context.appLocalization.asr,
                      prayerDate: DateTime.now(),
                    ),
                    PrayerDate(
                      prayerName: context.appLocalization.maghrib,
                      prayerDate: DateTime.now(),
                    ),
                    PrayerDate(
                      prayerName: context.appLocalization.isha,
                      prayerDate: DateTime.now(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  HalfCirclePainter();

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCirclePaint = Paint()
      ..color = const Color(0x80FFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      0,
      -pi,
      false,
      outerCirclePaint,
    );

    double angle = (2 * pi * (0 / 90));
    double imageX = size.width / 2 + (size.width / 2 * cos(-pi / 2 + angle));
    double imageY = size.height / 2 + (size.width / 2 * sin(-pi / 2 + angle));

    canvas.drawImage(
      TimeCircle.imageTime,
      Offset(imageX - 40, imageY - 15),
      //moon -28
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
