import 'package:eye_muslim/screens/my_prayers/widgets/custom_calender.dart';
import 'package:eye_muslim/screens/my_prayers/widgets/prayer_count.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/widgets/custom_back.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyPrayersScreen extends StatefulWidget {
  const MyPrayersScreen({super.key});

  @override
  State<MyPrayersScreen> createState() => _MyPrayersScreenState();
}

class _MyPrayersScreenState extends State<MyPrayersScreen> {
  DateTime date = DateTime.now();
  List<String> _prayers() {
    return [
      context.appLocalization.fajrPrayer,
      context.appLocalization.noonPrayer,
      context.appLocalization.asrPrayer,
      context.appLocalization.maghribPrayer,
      context.appLocalization.ishaPrayer,
    ];
  }

  @override
  void initState() {
    super.initState();
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
              context.appLocalization.myPrayers,
              color: context.colorPalette.green215,
              fontWeight: FontWeight.bold,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 10),
                    child: CustomText(
                      context.appLocalization.totalPrayer,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: PrayerCount(
                          isDone: true,
                          count: 3,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: PrayerCount(
                          count: 2,
                        ),
                      ),
                    ],
                  ),
                  CustomCalender(
                    date: date,
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        date = selectedDay;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        context.appLocalization.myPrayerToday,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.colorPalette.green215,
                      ),
                      CustomText(
                        DateFormat("yyyy/MM/dd").format(date),
                        color: context.colorPalette.green215,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Divider(
                    color: context.colorPalette.greyE7E,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10, end: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          context.appLocalization.didPray,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            CustomText(
                              context.appLocalization.yes,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(width: 45),
                            CustomText(
                              context.appLocalization.no,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 5),
                    itemCount: _prayers().length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 20),
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            _prayers()[index],
                            color: context.colorPalette.green215,
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            children: [
                              CustomText(
                                DateFormat("hh:mm a").format(DateTime.now()),
                                color: context.colorPalette.grey848,
                              ),
                              Radio<bool>(
                                value: true,
                                groupValue: true,
                                activeColor: context.colorPalette.green00A,
                                onChanged: (value) {},
                              ),
                              Radio<bool>(
                                value: false,
                                groupValue: false,
                                activeColor: context.colorPalette.green00A,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        ],
                      );
                    },
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
