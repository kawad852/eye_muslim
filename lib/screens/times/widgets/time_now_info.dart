import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:jhijri/jHijri.dart';

class TimeNowInfo extends StatelessWidget {
  const TimeNowInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  intl.DateFormat("a ").format(DateTime.now()),
                  color: context.colorPalette.green008,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  intl.DateFormat("hh : mm : ss").format(DateTime.now()),
                  color: context.colorPalette.green008,
                  textDirection: TextDirection.ltr,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomText(
            "${context.appLocalization.milad}   ${intl.DateFormat("yyyy/MM/dd").format(DateTime.now())}",
            fontSize: 20,
          ),
        ),
        CustomText(
          "${context.appLocalization.hijri}   ${intl.DateFormat("yyyy/MM/dd").format(intl.DateFormat("dd-MM-yyyy").parse(JHijri(fDate: DateTime.now()).toString()))}",
          fontSize: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomText(
            intl.DateFormat("EEEE", context.languageCode)
                .format(DateTime.now()),
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
