import 'package:eye_muslim/screens/home/widgets/conclusion_progress.dart';
import 'package:eye_muslim/screens/home/widgets/hadith_card.dart';
import 'package:eye_muslim/screens/home/widgets/prayer_question.dart';
import 'package:eye_muslim/screens/home/widgets/presentation_card.dart';
import 'package:eye_muslim/screens/home/widgets/reading_dhikr.dart';
import 'package:eye_muslim/screens/home/widgets/subscription_without_ads.dart';
import 'package:eye_muslim/screens/home/widgets/time_circle.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/utils/my_images.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_menu.dart';
import 'package:eye_muslim/widgets/custom_notification.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          leading: const CustomMenu(isHome: true),
          actions: const [
            
            CustomNotification(isHome: true),
          ],
          title: Container(
            height: 28,
            width: 200,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorPalette.black1D50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CustomText(
              "مكة المكرمة - 24 محرم  1446هـ ",
              color: context.colorPalette.white,
              fontSize: 12,
            ),
          ),
          collapsedHeight: kBarCollapsedHeight,
          flexibleSpace: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(MyImages.evening),
                fit: BoxFit.fill,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TimeCircle(),
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
          padding: const EdgeInsetsDirectional.only(
              top: 5, start: 15, end: 15, bottom: 10),
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
                return PresentationCard(
                  icon: _presentationIcon[index],
                  title: _getPresentationText()[index],
                );
              },
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReadingDhikr(),
                ConclusionProgress(),
                HadithCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
