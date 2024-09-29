import 'package:eye_muslim/screens/times/widgets/change_location_bubble.dart';
import 'package:eye_muslim/screens/times/widgets/time_now_info.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/widgets/custom_menu.dart';
import 'package:eye_muslim/widgets/custom_notification.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TimesScreen extends StatefulWidget {
  const TimesScreen({super.key});

  @override
  State<TimesScreen> createState() => _TimesScreenState();
}

class _TimesScreenState extends State<TimesScreen> {
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
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                ChangeLocationBubble(),
                TimeNowInfo(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
