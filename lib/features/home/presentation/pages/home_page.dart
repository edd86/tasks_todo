import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_todo/features/home/presentation/widgets/lists_task.dart';
import '../widgets/custom_header.dart';
import '../widgets/calendar_strip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              const CustomHeader(),
              Expanded(child: Container(color: theme.scaffoldBackgroundColor)),
            ],
          ),
          Positioned(
            top: 160, // Adjust based on Header Height
            left: 0,
            right: 0,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CalendarStrip(),
            ),
          ),
          Positioned.fill(
            top: 260, // Start below the calendar
            child: ListsTask(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_task),
        onPressed: () => context.push('/new_task'),
      ),
    );
  }
}
