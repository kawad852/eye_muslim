import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrayerTime extends StatelessWidget {
  final int index;
  const PrayerTime({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<String> prayers() {
      return [
        context.appLocalization.fajrPrayer,
        context.appLocalization.sunrise,
        context.appLocalization.noonPrayer,
        context.appLocalization.asrPrayer,
        context.appLocalization.maghribPrayer,
        context.appLocalization.ishaPrayer,
      ];
    }

    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsetsDirectional.only(start: 8),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF4F,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                CustomText(
                  "${index + 1}",
                ),
                const SizedBox(width: 6),
                CustomText(
                  prayers()[index],
                  color: context.colorPalette.green215,
                  overFlow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            children: [
              CustomText(
                DateFormat("a hh:mm").format(DateTime.now()),
                color: context.colorPalette.grey848,
              ),
              IconButton(
                onPressed: () {},
                icon: const CustomSvg(MyIcons.azanAlert),
              ),
              IconButton(
                onPressed: () {},
                icon: const CustomSvg(MyIcons.setting),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
