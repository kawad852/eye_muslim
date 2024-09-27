import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SurahCard extends StatelessWidget {
  final int index;
  const SurahCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsetsDirectional.only(start: 15),
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
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomText(
                      "${context.appLocalization.surah} الفاتحة",
                      fontSize: 16,
                      overFlow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const CustomSvg(MyIcons.bookMark),
                  ),
                  CustomText(
                    "185 ${context.appLocalization.verses}",
                    fontSize: 12,
                    color: context.colorPalette.grey848,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const CustomSvg(MyIcons.audio),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
