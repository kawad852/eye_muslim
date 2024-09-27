import 'package:eye_muslim/screens/quran/widgets/count_card.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/base_editor.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:eye_muslim/widgets/stretch_button.dart';
import 'package:flutter/material.dart';

class ConclusionBottomSheet extends StatefulWidget {
  const ConclusionBottomSheet({super.key});

  @override
  State<ConclusionBottomSheet> createState() => _ConclusionBottomSheetState();
}

class _ConclusionBottomSheetState extends State<ConclusionBottomSheet> {
  int _numberOfDays = 1;
  int _numberOfParts = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseEditor(
            initialValue: null,
            filled: true,
            fillColor: context.colorPalette.white,
            labelText: context.appLocalization.enterConclusionName,
            style: TextStyle(
              color: context.colorPalette.green00A,
            ),
            suffixIcon: const IconButton(
              onPressed: null,
              icon: CustomSvg(MyIcons.edit),
            ),
            labelStyle: TextStyle(
              color: context.colorPalette.grey81,
              fontSize: 12,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.colorPalette.grey81,
                width: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: CountCard(
              title: context.appLocalization.numberOfDays,
              count: _numberOfDays,
              onMinus: () {
                setState(() {
                  if (_numberOfDays > 1) {
                    _numberOfDays--;
                  }
                });
              },
              onPlus: () {
                setState(() {
                  _numberOfDays++;
                });
              },
            ),
          ),
          CountCard(
            title: context.appLocalization.numberOfParts,
            count: _numberOfParts,
            onMinus: () {
              setState(() {
                if (_numberOfParts > 1) {
                  _numberOfParts--;
                }
              });
            },
            onPlus: () {
              setState(() {
                _numberOfParts++;
              });
            },
          ),
          const Spacer(),
          StretchedButton(
            onPressed: () {},
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: context.colorPalette.green00A,
            child: CustomText(
              context.appLocalization.createConclusion,
              color: context.colorPalette.white,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: double.infinity,
              height: 45,
              alignment: Alignment.center,
              margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 15),
              decoration: BoxDecoration(
                color: context.colorPalette.white,
                border: Border.all(
                  color: context.colorPalette.greyCAC,
                ),
                borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
              ),
              child: CustomText(
                context.appLocalization.exit,
                fontSize: 16,
                color: context.colorPalette.green215,
              ),
            ),
          )
        ],
      ),
    );
  }
}
