import 'package:eye_muslim/screens/times/widgets/azan_alert.dart';
import 'package:eye_muslim/screens/times/widgets/modifying_azan.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/widgets/custom_back.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class AzanConfigurationScreen extends StatefulWidget {
  const AzanConfigurationScreen({super.key});

  @override
  State<AzanConfigurationScreen> createState() => _AzanConfigurationScreenState();
}

class _AzanConfigurationScreenState extends State<AzanConfigurationScreen> {
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
              "اذان الفجر",
              color: context.colorPalette.green215,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AzanAlert(),
                  ModifyingAzan(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
