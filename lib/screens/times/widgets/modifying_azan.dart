import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ModifyingAzan extends StatefulWidget {
  const ModifyingAzan({super.key});

  @override
  State<ModifyingAzan> createState() => _ModifyingAzanState();
}

class _ModifyingAzanState extends State<ModifyingAzan> {
  DateTime azanTime = DateTime.now();
  List<int> minutesBeforAzan = [01, 02, 03, 04, 05];
  int minutesSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 214,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: context.colorPalette.white,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                context.appLocalization.modifyingTheAzan,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 101,
                  height: 30,
                  decoration: BoxDecoration(
                    color: context.colorPalette.greyF9F,
                    borderRadius: BorderRadius.circular(MyTheme.radiusPrimary),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomSvg(MyIcons.reset),
                      const SizedBox(width: 5),
                      CustomText(
                        context.appLocalization.reset,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: context.colorPalette.greyE8F,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      context.appLocalization.azan,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 8),
                    CustomText(
                      DateFormat("hh:mm a").format(DateTime.now()),
                      fontSize: 16,
                      color: context.colorPalette.grey81,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          azanTime = azanTime.add(const Duration(minutes: 1));
                        });
                      },
                      icon: const CustomSvg(MyIcons.plus),
                    ),
                    Container(
                      width: 93,
                      height: 25,
                      color: context.colorPalette.greenE6F,
                      alignment: Alignment.center,
                      child: CustomText(
                        DateFormat("hh:mm a").format(azanTime),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          azanTime =
                              azanTime.subtract(const Duration(minutes: 1));
                        });
                      },
                      icon: const CustomSvg(MyIcons.minus),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(
                    "${context.appLocalization.warningBeforeAzan} / ",
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    context.appLocalization.minutes,
                    color: context.colorPalette.green2D8,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Container(
                width: 65,
                height: 30,
                alignment: Alignment.center,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: context.colorPalette.greyF9F,
                  borderRadius: BorderRadius.circular(MyTheme.radiusPrimary),
                ),
                child: DropdownButton<int>(
                  hint: CustomText(minutesSelected.toString()),
                  isExpanded: true,
                  icon: const CustomSvg(MyIcons.arrowDown),
                  items: minutesBeforAzan.map((minute) {
                    return DropdownMenuItem<int>(
                      value: minute,
                      child: CustomText("$minute"),
                    );
                  }).toList(),
                  underline: const SizedBox(),
                  onChanged: (int? value) {
                    setState(() {
                      minutesSelected = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
