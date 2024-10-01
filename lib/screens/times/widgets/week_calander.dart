import 'package:eye_muslim/screens/times/widgets/arrow_bubble.dart';
import 'package:eye_muslim/screens/times/widgets/day_bubble.dart';
import 'package:eye_muslim/screens/times/widgets/prayer_time.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class WeekCalander extends StatefulWidget {
  const WeekCalander({super.key});

  @override
  State<WeekCalander> createState() => _WeekCalanderState();
}

class _WeekCalanderState extends State<WeekCalander> {
  DateTime _selectedDate = DateTime.now();
  DateTime _now = DateTime.now();

  bool _isCurrentWeek() {
    return DateTime.now().isAfter(_now.subtract(Duration(days: _selectedDate.weekday - 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            color: context.colorPalette.greyF2F,
            borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorPalette.greyE8F,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(MyTheme.radiusSecondary),
                    topRight: Radius.circular(MyTheme.radiusSecondary),
                  ),
                ),
                child: CustomText(
                  context.appLocalization.daysOfWeek,
                  fontSize: 16,
                  color: context.colorPalette.green215,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    DateTime date = _now.subtract(Duration(days: _now.weekday - 1 - index));
                    return DayBubble(
                      selectedDate: _selectedDate,
                      date: date,
                      onTap: () {
                        setState(() {
                          _selectedDate = date.subtract(const Duration(days: 1));
                        });
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArrowBubble(
                disable: _isCurrentWeek(),
                onTap: () {
                  setState(() {
                    _now = _now.subtract(const Duration(days: 7));
                  });
                },
              ),
              const SizedBox(width: 40),
              ArrowBubble(
                disable: false,
                isForward: true,
                onTap: () {
                  setState(() {
                    _now = _now.add(const Duration(days: 7));
                  });
                },
              ),
            ],
          ),
        ),
        ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 6,
          padding: const EdgeInsets.only(bottom: 10),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return PrayerTime(index: index);
          },
        ),
        CustomText(
          context.appLocalization.noteForAzanAlert,
          color: context.colorPalette.grey848,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
