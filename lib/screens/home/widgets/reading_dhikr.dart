import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_images.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ReadingDhikr extends StatelessWidget {
  const ReadingDhikr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(MyImages.dhikr),
            const SizedBox(width: 10),
            CustomText(
              context.appLocalization.readingdhikr,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: context.colorPalette.grey81,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 110,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: context.colorPalette.white,
            borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
            image: DecorationImage(
              image: const AssetImage(
                MyImages.dhikrBackground,
              ),
              alignment:
                  context.isRTL ? Alignment.centerLeft : Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: context.colorPalette.greyC7D,
                offset: const Offset(0.0, 1.0),
                blurRadius: 3.0,
              ),
            ],
          ),
          child: CustomText(
            "(الحَمْدُ لِلهِ الذي أَطْعَمَنَا وَسَقَانَا، وَكَفَانَا وَآوَانَا، فَكَمْ مِمَّنْ لا كَافِيَ له وَلَا مُؤْوِيَ)",
            color: context.colorPalette.grey81,
            fontSize: 16,
            maxLines: 4,
            overFlow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
