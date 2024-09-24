import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PrayerQuestion extends StatelessWidget {
  const PrayerQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsetsDirectional.only(start: 15),
      decoration: BoxDecoration(
        color: context.colorPalette.greyECE,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  context.appLocalization.didYouPray(context.appLocalization.noon),
                  color: context.colorPalette.green215,
                  overFlow: TextOverflow.ellipsis,
                  fontSize: 16,
                ),
                TweenAnimationBuilder<Duration>(
                  duration: const Duration(hours: 15, minutes: 15, seconds: 15),
                  tween: Tween(
                      begin: Duration.zero,
                      end: const Duration(hours: 15, minutes: 15, seconds: 15),
                      ),
                  builder: (BuildContext context, Duration value, Widget? child) {
                    final hours = value.inHours;
                    final minutes = value.inMinutes.remainder(60);
                    final seconds = value.inSeconds.remainder(60);
                    return CustomText(
                      "${context.appLocalization.callPrayerHasRaised} $hours:$minutes:$seconds",
                      fontWeight: FontWeight.w600,
                      overFlow: TextOverflow.ellipsis,
                      maxLines: 2,
                    );
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => (),
                child: Container(
                  width: 71,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorPalette.green80A,
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(MyTheme.radiusSecondary),
                    ),
                  ),
                  child: CustomText(
                    context.appLocalization.yes,
                    color: context.colorPalette.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => (),
                child: Container(
                  width: 71,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorPalette.greyC7D,
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(MyTheme.radiusSecondary),
                    ),
                  ),
                  child: CustomText(
                    context.appLocalization.no,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
