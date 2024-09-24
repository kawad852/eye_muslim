import 'package:eye_muslim/screens/home/widgets/prayer_question.dart';
import 'package:eye_muslim/screens/home/widgets/subscription_without_ads.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrayerQuestion(),
                const SubscriptionWithoutAds(),
                CustomText(
                  context.appLocalization.wePresentToYou,
                  color: context.colorPalette.green215,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(top: 5, start: 15, end: 15),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (MediaQuery.of(context).size.width / 150).toInt(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 9,
              childAspectRatio: 168 / 45,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: 9,
              (context, index) {
                return Container(
                  height: 50,
                  width: 10,
                  decoration: BoxDecoration(
                    color: context.colorPalette.greyEEE,
                    borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
