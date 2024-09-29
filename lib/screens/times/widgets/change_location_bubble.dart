import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:eye_muslim/widgets/linear_container.dart';
import 'package:flutter/material.dart';

class ChangeLocationBubble extends StatelessWidget {
  const ChangeLocationBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearContainer(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  context.appLocalization.prayerAndAzanTimes,
                  maxLines: 2,
                ),
                CustomText(
                  "عمان , الأردن",
                  color: context.colorPalette.green215,
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CustomSvg(MyIcons.refresh),
          ),
        ],
      ),
    );
  }
}
