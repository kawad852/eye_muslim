import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PrayerCount extends StatelessWidget {
  final int count;
  final bool isDone;
  const PrayerCount({
    super.key,
    required this.count,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaQuery.width * 0.5,
      height: 74,
      decoration: BoxDecoration(
        color:
            isDone ? context.colorPalette.green00A : context.colorPalette.white,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            isDone
                ? context.appLocalization.prayerCompleted
                : context.appLocalization.missedPrayer,
            color: isDone ? context.colorPalette.white : null,
          ),
          const SizedBox(height: 10),
          CustomText(
            "$count",
            fontSize: 16,
            color: isDone
                ? context.colorPalette.white
                : context.colorPalette.redDA0,
          )
        ],
      ),
    );
  }
}
