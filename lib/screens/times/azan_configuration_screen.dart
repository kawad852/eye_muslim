import 'package:eye_muslim/screens/times/widgets/azan_alert.dart';
import 'package:eye_muslim/screens/times/widgets/modifying_azan.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_back.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AzanConfigurationScreen extends StatefulWidget {
  const AzanConfigurationScreen({super.key});

  @override
  State<AzanConfigurationScreen> createState() =>  _AzanConfigurationScreenState();
}

class _AzanConfigurationScreenState extends State<AzanConfigurationScreen> {
  List<String> azanSound = [
    "اذان المدينة",
    "اذان عبد الباسط",
    "اذان العفاسي",
    "اذان ياسر الدوسري",
    "اذان عبد الرحمان السديسي"
  ];
  late String _selectedSound;
  @override
  void initState() {
    super.initState();
    _selectedSound = azanSound[0];
  }

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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AzanAlert(),
                  const ModifyingAzan(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                    child: ExpansionTile(
                      shape: const Border(),
                      backgroundColor: context.colorPalette.white,
                      collapsedBackgroundColor: context.colorPalette.white,
                      childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
                      title: CustomText(
                        context.appLocalization.soundAzan,
                        fontWeight: FontWeight.bold,
                      ),
                      children: azanSound.map((element) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomText(
                                    element,
                                    fontWeight: FontWeight.bold,
                                    overFlow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Radio<String>(
                                  value: azanSound[azanSound.indexOf(element)],
                                  groupValue: _selectedSound,
                                  activeColor: context.colorPalette.green00A,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedSound = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Divider(
                              color: context.colorPalette.greyE8F,
                            )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
