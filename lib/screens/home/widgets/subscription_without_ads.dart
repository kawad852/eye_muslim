import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SubscriptionWithoutAds extends StatelessWidget {
  const SubscriptionWithoutAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyEEE,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CustomText(
              context.appLocalization.useAppWithoutAds(1),
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () => (),
            child: Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorPalette.green2D8,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(MyTheme.radiusSecondary),
                  bottomRight: Radius.circular(MyTheme.radiusSecondary),
                ),
              ),
              child: CustomText(
                context.appLocalization.subscriptionFor(1),
                color: context.colorPalette.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
