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

  String fullDateString(DateTime now) =>
      "${fullWeekDays[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}";

  //Obtener la hora en formato 12 horas
  String timeString(DateTime now) {
    final hour = now.hour;
    final minutes = now.minute;
    if (hour >= 10) {
      return "$hour:${minutes < 10 ? '0$minutes' : minutes}";
    } else {
      return "0$hour:${minutes < 10 ? '0$minutes' : minutes}";
    }
  }

  /// Resolver inicio de semana en domingo
  List<WeekDaysHeader> weekDates(DateTime now) {
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final weekDates = List.generate(6, (index) {
      final date = firstDayOfWeek.add(Duration(days: index));
      return WeekDaysHeader(
        day: fullWeekDays[date.weekday - 1],
        date: date,
        selected: date.weekday == now.weekday,
      );
    });
    return weekDates;
  }
}
