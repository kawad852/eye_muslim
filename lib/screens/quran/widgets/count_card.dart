import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CountCard extends StatelessWidget {
  final String title;
  final int count;
  final void Function()? onPlus;
  final void Function()? onMinus;
  const CountCard({
    super.key,
    required this.title,
    required this.count,
    this.onPlus,
    this.onMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomText(
            title,
            fontSize: 16,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: onPlus,
              icon: const CustomSvg(MyIcons.plus),
            ),
            CustomText(
              "$count",
              fontSize: 16,
            ),
            IconButton(
              onPressed: onMinus,
              icon: const CustomSvg(MyIcons.minus),
            ),
          ],
        )
      ],
    );
  }
}
