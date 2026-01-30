import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';
import '../widgets/calendar_strip.dart';
import '../widgets/section_header.dart';
import '../widgets/task_card.dart';

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
            child: ListView(
              padding: const EdgeInsets.only(bottom: 100, top: 20),
              children: const [
                SectionHeader(title: "MORNING"),
                TaskCard(
                  title: "Morning Routine",
                  time: "08:00 AM",
                  category: "HABIT",
                  isCompleted: true,
                  categoryColor: Colors.green,
                ),
                TaskCard(
                  title: "Design Sync",
                  time: "10:30 AM",
                  category: "WORK",
                  isCompleted: false,
                  categoryColor: Colors.blue,
                ),
                SectionHeader(title: "AFTERNOON"),
                TaskCard(
                  title: "Deep Work Session",
                  time: "02:00 PM",
                  category: "FOCUS",
                  isCompleted: false,
                  categoryColor: Color(0xFFC3662C),
                ),
                TaskCard(
                  title: "Grocery Shopping",
                  time: "05:00 PM",
                  category: "PERSONAL",
                  isCompleted: false,
                  categoryColor: Colors.pink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
