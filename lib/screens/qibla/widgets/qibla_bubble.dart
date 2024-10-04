import 'dart:math';

import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QiblaBubble extends StatefulWidget {
  const QiblaBubble({super.key});

  @override
  State<QiblaBubble> createState() => _QiblaBubbleState();
}

class _QiblaBubbleState extends State<QiblaBubble> {
  final _compassSvg = SvgPicture.asset('assets/compass.svg');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        QiblahDirection qiblahDirection = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: (qiblahDirection.direction * (pi / 180) * -1),
                child: _compassSvg,
              ),
              Transform.rotate(
                angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/needle.png",
                  fit: BoxFit.contain,
                  height: 200,
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                bottom: 8,
                child: Column(
                  children: [
                    CustomText(
                      "${qiblahDirection.direction.toStringAsFixed(1)}°",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: context.colorPalette.green215,
                    ),
                    CustomText(
                      context.appLocalization.fromTheNorth,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
