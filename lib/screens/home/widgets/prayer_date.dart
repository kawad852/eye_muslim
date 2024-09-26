import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrayerDate extends StatelessWidget {
  final String prayerName;
  final DateTime prayerDate;
  const PrayerDate(
      {super.key, required this.prayerName, required this.prayerDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          prayerName,
          color: context.colorPalette.white,
        ),
        const SizedBox(height: 4),
        CustomText(
          DateFormat("hh:mm").format(prayerDate),
          color: context.colorPalette.green2D8,
        )
      ],
    );
  }
}
