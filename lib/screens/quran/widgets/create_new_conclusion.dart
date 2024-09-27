import 'package:eye_muslim/alerts/feedback/app_feedback.dart';
import 'package:eye_muslim/screens/quran/widgets/conclusion_bottom_sheet.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CreateNewConclusion extends StatelessWidget {
  const CreateNewConclusion({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.showBottomSheet(
          context,
          maxHeight: context.mediaQuery.height * 0.63,
          builder: (context) {
            return const ConclusionBottomSheet();
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(top: 25, bottom: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyEEE,
          borderRadius: BorderRadius.circular(MyTheme.radiusPrimary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: context.colorPalette.green1C9,
            ),
            const SizedBox(width: 5),
            CustomText(
              context.appLocalization.createNewConclusion,
              color: context.colorPalette.green1C9,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
