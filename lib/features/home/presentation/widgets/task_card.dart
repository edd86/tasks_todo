import 'package:flutter/material.dart';
import 'package:tasks_todo/core/utils/dates_utils.dart';
import 'package:tasks_todo/features/home/domain/entities/task_entity.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Use a lighter surface for card background in light mode, or regular surface in dark mode
    final cardBgColor = isDark
        ? const Color(0xFF2C2C2C)
        : const Color(0xFFF8F7F5);
    final primaryColor = theme.colorScheme.primary;
    final textColor =
        theme.textTheme.titleMedium?.color ??
        (isDark ? Colors.white : Colors.black87);
    final borderColor = isDark ? Colors.grey[700]! : const Color(0xFFE0CDBE);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // Checkbox/Status Icon
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: task.isCompleted ? primaryColor : Colors.transparent,
              border: task.isCompleted
                  ? null
                  : Border.all(color: borderColor, width: 2),
            ),
            child: task.isCompleted
                ? Icon(
                    Icons.check,
                    size: 16,
                    color: theme.colorScheme.onPrimary,
                  )
                : null,
          ),
          const SizedBox(width: 16),
          // content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                    decorationColor: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      DatesUtils().timeString(task.time),
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text("•", style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 4),
                    Text(
                      task.category.toUpperCase(),
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Dot indicator
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: task.categoryColor,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
