import 'package:eye_muslim/screens/my_prayers/my_prayers_screen.dart';
import 'package:eye_muslim/screens/times/widgets/change_location_bubble.dart';
import 'package:eye_muslim/screens/times/widgets/time_now_info.dart';
import 'package:eye_muslim/screens/times/widgets/week_calander.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/widgets/custom_menu.dart';
import 'package:eye_muslim/widgets/custom_notification.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:eye_muslim/widgets/stretch_button.dart';
import 'package:flutter/material.dart';

class TimesScreen extends StatefulWidget {
  const TimesScreen({super.key});

  @override
  State<TimesScreen> createState() => _TimesScreenState();
}

class _TimesScreenState extends State<TimesScreen> {
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
          leading: const CustomMenu(),
          title: CustomText(
            context.appLocalization.azan,
            color: context.colorPalette.green215,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const CustomNotification(),
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                const ChangeLocationBubble(),
                const TimeNowInfo(),
                const WeekCalander(),
                StretchedButton(
                  onPressed: () {
                    context.push(const MyPrayersScreen());
                  },
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: context.colorPalette.green2D8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      ),
                      CustomText(
                        context.appLocalization.prayerSchedule,
                        color: context.colorPalette.white,
                        fontSize: 16,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
