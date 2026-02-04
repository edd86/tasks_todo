import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_todo/core/utils/dates_utils.dart';
import 'package:tasks_todo/features/home/presentation/providers/dates_provider.dart';

class CalendarStrip extends ConsumerWidget {
  const CalendarStrip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Hardcoded dates for design match: Mon 23 to Sat 28
    final now = ref.watch(datesProvider);
    final weekDates = DatesUtils().weekDates(now);

    /* final days = [
      {'day': 'MON', 'date': '23', 'selected': true},
      {'day': 'TUE', 'date': '24', 'selected': false},
      {'day': 'WED', 'date': '25', 'selected': false},
      {'day': 'THU', 'date': '26', 'selected': false},
      {'day': 'FRI', 'date': '27', 'selected': false},
      {'day': 'SAT', 'date': '28', 'selected': false},
    ]; */

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: weekDates.map((data) {
            return _DateItem(
              day: data.day,
              date: data.date.day.toString(),
              isSelected: data.selected,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _DateItem extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;

  const _DateItem({
    required this.day,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Determine colors based on selection and theme
    final selectedBgColor = theme.colorScheme.primary;

    final selectedTextColor = theme.colorScheme.onPrimary;
    final unselectedDayColor = isDark ? Colors.white70 : Colors.grey;
    final unselectedDateColor = isDark ? Colors.white : Colors.black87;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: isSelected
          ? BoxDecoration(
              color: selectedBgColor,
              borderRadius: BorderRadius.circular(30),
            )
          : null,
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? selectedTextColor : unselectedDayColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            date,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? selectedTextColor : unselectedDateColor,
            ),
          ),
        ],
      ),
    );
  }
}
