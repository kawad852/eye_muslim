import 'package:eye_muslim/screens/quran/widgets/conclusion_card.dart';
import 'package:eye_muslim/screens/quran/widgets/create_new_conclusion.dart';
import 'package:eye_muslim/screens/quran/widgets/surah_card.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/widgets/base_editor.dart';
import 'package:eye_muslim/widgets/custom_menu.dart';
import 'package:eye_muslim/widgets/custom_notification.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          leading: const CustomMenu(),
          title: CustomText(
            context.appLocalization.alQuranAlKareem,
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
                const CreateNewConclusion(),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                    itemCount: 8,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const ConclusionCard();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BaseEditor(
                    hintText: context.appLocalization.searchSurah,
                    hintStyle: TextStyle(
                      color: context.colorPalette.black,
                      fontSize: 14,
                    ),
                    initialValue: null,
                    filled: true,
                    fillColor: context.colorPalette.greyEEE,
                    suffixIcon: const IconButton(
                      onPressed: null,
                      icon: CustomSvg(MyIcons.search),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(start: 15, end: 15, bottom: 15),
          sliver: SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 7),
            itemCount: 20,
            itemBuilder: (context, index) {
              return SurahCard(index: index);
            },
          ),
        ),
      ],
    );
  }
}
