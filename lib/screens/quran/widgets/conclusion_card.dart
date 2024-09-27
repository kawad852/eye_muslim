import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ConclusionCard extends StatelessWidget {
  const ConclusionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyE8F,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: Column(
        children: [
          const CustomText(
            "ختمةالعيد",
            fontWeight: FontWeight.w600,
            overFlow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomText(
              context.appLocalization.levelOfProgress,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                "${context.appLocalization.part} 30/",
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                "23",
                fontWeight: FontWeight.w600,
                color: context.colorPalette.green577,
                fontSize: 18,
              )
            ],
          ),
          const Spacer(),
          LinearPercentIndicator(
            barRadius: const Radius.circular(MyTheme.radiusSecondary),
            alignment: MainAxisAlignment.center,
            lineHeight: 4,
            animation: true,
            animationDuration: 1000,
            percent: 23 / 30,
            isRTL: true,
            backgroundColor: context.colorPalette.greyD9D,
            progressColor: context.colorPalette.green1C9,
          )
        ],
      ),
    );
  }
}
