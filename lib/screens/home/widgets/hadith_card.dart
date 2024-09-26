import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HadithCard extends StatelessWidget {
  const HadithCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 82,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorPalette.green80A,
            context.colorPalette.white,
          ],
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
        ),
        border: Border.all(
          width: 0.2,
          color: context.colorPalette.green80A,
        ),
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: Row(
        children: [
          const Expanded(
            child: CustomText(
              "ثقيلتان على الميزان خفيفتان على اللسان سبحان الله وبحمده ، سبحان الله العظيم",
              overFlow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CustomSvg(MyIcons.send),
          ),
        ],
      ),
    );
  }
}
