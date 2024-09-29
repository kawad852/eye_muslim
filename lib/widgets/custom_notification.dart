import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

class CustomNotification extends StatelessWidget {
  final bool isHome;
  const CustomNotification({super.key, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: CustomSvg(
        MyIcons.notification,
        color: isHome ? null : context.colorPalette.green215,
      ),
    );
  }
}
