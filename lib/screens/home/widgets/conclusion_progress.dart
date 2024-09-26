import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ConclusionProgress extends StatelessWidget {
  const ConclusionProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              CustomText(
                context.appLocalization.progressStatus,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(width: 6),
              CustomText(
                "5 ${context.appLocalization.days}",
                color: context.colorPalette.green1C9,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 99,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: context.colorPalette.white,
            borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
            boxShadow: [
              BoxShadow(
                color: context.colorPalette.greyC7D,
                offset: const Offset(0.0, 1.0),
                blurRadius: 3.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      context.appLocalization.currentConclusion,
                    ),
                  ),
                  Expanded(
                    child: CustomText(
                      "سورة ال عمران",
                      color: context.colorPalette.green1C9,
                      textAlign: TextAlign.end,
                      overFlow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: LinearPercentIndicator(
                  barRadius: const Radius.circular(MyTheme.radiusSecondary),
                  alignment: MainAxisAlignment.center,
                  lineHeight: 8.0,
                  animation: true,
                  animationDuration: 1000,
                  percent: 5 / 20,
                  isRTL: true,
                  backgroundColor: context.colorPalette.greyD9D,
                  progressColor: context.colorPalette.green1C9,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "${context.appLocalization.page}5",
                    color: context.colorPalette.grey81,
                  ),
                  Row(
                    children: [
                      CustomText(
                        "5 /",
                        color: context.colorPalette.green1C9,
                      ),
                      CustomText(
                        "20",
                        color: context.colorPalette.grey81,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
