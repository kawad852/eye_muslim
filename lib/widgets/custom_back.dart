import 'dart:math';

import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

class CustomBack extends StatelessWidget {
  const CustomBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Transform.rotate(
        angle: context.isRTL ? 0 : pi,
        child: const CustomSvg(MyIcons.arrowBack),
      ),
    );
  }
}
