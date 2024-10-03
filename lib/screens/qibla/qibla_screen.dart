import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/widgets/custom_back.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorPalette.greyE8F,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: context.colorPalette.greyE8F,
            leading: const CustomBack(),
            title: CustomText(
              context.appLocalization.qiblaDirection,
              color: context.colorPalette.green215,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
