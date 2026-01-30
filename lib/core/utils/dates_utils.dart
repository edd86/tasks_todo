import 'package:tasks_todo/features/home/domain/entities/week_days_header.dart';

class DatesUtils {
  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final fullWeekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  String dateString(DateTime now) =>
      "${fullWeekDays[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}";

  List<WeekDaysHeader> weekDates(DateTime now) {
    final weekDateNow = now.weekday;
    final weekDates = List.generate(6, (index) {
      final date = now.subtract(Duration(days: weekDateNow - index));
      return WeekDaysHeader(
        day: fullWeekDays[date.weekday - 1],
        date: date.day,
        selected: date.weekday == weekDateNow,
      );
    });
    return weekDates;
  }
}
