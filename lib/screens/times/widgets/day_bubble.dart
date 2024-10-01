import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DayBubble extends StatelessWidget {
  final DateTime selectedDate;
  final DateTime date;
  final void Function() onTap;
  const DayBubble({
    super.key,
    required this.selectedDate,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSameDate() {
      DateTime newDate = date.subtract(const Duration(days: 1));
      return selectedDate.day == newDate.day &&
          selectedDate.month == newDate.month &&
          selectedDate.year == newDate.year;
    }

    bool isNow() {
      DateTime newDate = date.subtract(const Duration(days: 1));
      return DateTime.now().day == newDate.day &&
          DateTime.now().month == newDate.month &&
          DateTime.now().year == newDate.year;
    }

    List<String> daysOfWeek = [
      context.appLocalization.sundy,
      context.appLocalization.monday,
      context.appLocalization.tuesday,
      context.appLocalization.wednesday,
      context.appLocalization.thursday,
      context.appLocalization.friday,
      context.appLocalization.saturday,
    ];
    return Column(
      children: [
        GestureDetector(
          onTap: date.compareTo(DateTime.now()) < 0 ? null : onTap,
          child: Container(
            height: 39,
            width: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSameDate()
                  ? context.colorPalette.green215
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(MyTheme.radiusPrimary),
            ),
            child: CustomText(
              daysOfWeek[date.weekday - 1],
              fontSize: 12,
              color: isSameDate() ? context.colorPalette.white : null,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomText(
          (date.subtract(const Duration(days: 1)).day).toString(),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isNow() ? context.colorPalette.green215 : Colors.transparent,
          ),
        ),
      ],
    );
  }
}
