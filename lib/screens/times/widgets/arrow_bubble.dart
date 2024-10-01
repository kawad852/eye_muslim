import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:flutter/material.dart';

class ArrowBubble extends StatelessWidget {
  final bool isForward;
  final bool disable;
  final void Function() onTap;
  const ArrowBubble({
    super.key,
    this.isForward = false,
    required this.disable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disable ? null : onTap,
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: disable
              ? context.colorPalette.greyF2F
              : context.colorPalette.green215,
          borderRadius: BorderRadius.circular(MyTheme.radiusPrimary),
        ),
        child: Icon(
          isForward ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
          size: 15,
          color: disable
              ? context.colorPalette.grey81
              : context.colorPalette.white,
        ),
      ),
    );
  }
}
