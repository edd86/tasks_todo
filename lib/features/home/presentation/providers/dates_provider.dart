import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatesProvider extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }
}

final datesProvider = NotifierProvider<DatesProvider, DateTime>(
  DatesProvider.new,
);
