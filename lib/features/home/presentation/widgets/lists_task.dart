import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_todo/features/home/presentation/providers/lists_task_provider.dart';
import 'package:tasks_todo/features/home/presentation/widgets/section_header.dart';
import 'package:tasks_todo/features/home/presentation/widgets/task_card.dart';

class ListsTask extends ConsumerWidget {
  const ListsTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(listsTaskProvider);

    final morningTasks = tasks.where((task) => task.time.hour < 12).toList();
    final afternoonTasks = tasks.where((task) => task.time.hour >= 12).toList();

    return ListView(
      padding: const EdgeInsets.only(bottom: 100, top: 20),
      children: [
        if (morningTasks.isNotEmpty) ...[
          const SectionHeader(title: "MORNING"),
          ...morningTasks.map((task) => TaskCard(task: task)),
        ],
        if (afternoonTasks.isNotEmpty) ...[
          const SectionHeader(title: "AFTERNOON"),
          ...afternoonTasks.map((task) => TaskCard(task: task)),
        ],
      ],
    );
  }
}
