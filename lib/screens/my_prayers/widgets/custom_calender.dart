import 'dart:math';

import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:eye_muslim/utils/my_icons.dart';
import 'package:eye_muslim/utils/my_theme.dart';
import 'package:eye_muslim/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalender extends StatelessWidget {
  final DateTime date;
  final void Function(DateTime, DateTime) onDaySelected;
  const CustomCalender({
    super.key,
    required this.date,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: context.colorPalette.white,
        borderRadius: BorderRadius.circular(MyTheme.radiusPrimary),
      ),
      child: TableCalendar(
        firstDay: DateTime.now().subtract(const Duration(days: 60)),
        lastDay: DateTime.now().add(const Duration(days: 60)),
        focusedDay: DateTime.now(),
        daysOfWeekHeight: 20,
        locale: context.languageCode,
        availableGestures: AvailableGestures.horizontalSwipe,
        selectedDayPredicate: (day) {
          return isSameDay(date, day);
        },
        onDaySelected: onDaySelected,
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: context.colorPalette.green00A,
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          formatButtonShowsNext: false,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: context.colorPalette.greyE7E),
            ),
          ),
          headerPadding: const EdgeInsets.only(bottom: 10),
          leftChevronIcon: Transform.rotate(
            angle: context.isRTL ? 0 : pi,
            child: const CustomSvg(MyIcons.iconTable),
          ),
          rightChevronIcon: Transform.rotate(
            angle: context.isRTL ? pi : 0,
            child: const CustomSvg(MyIcons.iconTable),
          ),
        ),
      ),
    );
  }
}
