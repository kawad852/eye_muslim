import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:flutter/material.dart';

class LinearContainer extends StatelessWidget {
  final Widget child;
  const LinearContainer({super.key, required this.child});

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
      child: child,
    );
  }
}
