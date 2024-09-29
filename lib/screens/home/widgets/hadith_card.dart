import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/widgets/Linear_container.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HadithCard extends StatelessWidget {
  const HadithCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearContainer(
      child: Row(
        children: [
          const Expanded(
            child: CustomText(
              "ثقيلتان على الميزان خفيفتان على اللسان سبحان الله وبحمده ، سبحان الله العظيم",
              overFlow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CustomSvg(MyIcons.send),
          ),
        ],
      ),
    );
  }
}
