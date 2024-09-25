import 'package:eye_muslim/screens/home/widgets/time_circle.dart';
import 'package:eye_muslim/screens/home/widgets/prayer_question.dart';
import 'package:eye_muslim/screens/home/widgets/subscription_without_ads.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/utils/my_images.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _presentationIcon = [
    MyIcons.remembrances,
    MyIcons.qibla,
    MyIcons.rosary,
    MyIcons.namesOfGod,
    MyIcons.libraryIslamic,
    MyIcons.hijriCalendar,
    MyIcons.ramdanMonth,
    MyIcons.quranBook,
    MyIcons.more,
  ];

  List<String> _getPresentationText() {
    return [
      context.appLocalization.remembrancesAndSupplications,
      context.appLocalization.qiblaDirection,
      context.appLocalization.rosary,
      context.appLocalization.namesOfGod,
      context.appLocalization.islamicLibrary,
      context.appLocalization.hijriCalendar,
      context.appLocalization.ramadanMonth,
      context.appLocalization.interpretationQuran,
      context.appLocalization.moreComingSoon,
    ];
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          collapsedHeight: kBarCollapsedHeight,
          flexibleSpace: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(MyImages.noon),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: HalfCirclePainter(conditionMet: false),
                  child: const SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Center(
                        child: Column(
                      children: [
                        Text("data"),
                      ],
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
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
              childAspectRatio: 168 / 52,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: _presentationIcon.length,
              (context, index) {
                return Container(
                  height: 50,
                  width: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: context.colorPalette.greyEEE,
                    borderRadius:
                        BorderRadius.circular(MyTheme.radiusSecondary),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CustomSvg(_presentationIcon[index]),
                      ),
                      Expanded(
                        child: CustomText(
                          _getPresentationText()[index],
                          color: context.colorPalette.green215,
                          textAlign: TextAlign.center,
                          fontSize: 12,
                        ),
                      ),
                    ],
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
