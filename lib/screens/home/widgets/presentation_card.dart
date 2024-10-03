import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PresentationCard extends StatelessWidget {
  final String icon;
  final String title;
  final void Function() onTap;
  const PresentationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 10,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: context.colorPalette.greyEEE,
          borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomSvg(icon),
            ),
            Expanded(
              child: CustomText(
                title,
                color: context.colorPalette.green215,
                textAlign: TextAlign.center,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
