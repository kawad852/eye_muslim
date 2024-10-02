import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AzanAlert extends StatelessWidget {
  const AzanAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.white,
        borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              context.appLocalization.turnOnAzanAlert,
              fontWeight: FontWeight.bold,
              overFlow: TextOverflow.ellipsis,
            ),
          ),
          Switch(
            value: true,
            activeTrackColor: context.colorPalette.green00A,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
