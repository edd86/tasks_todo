import 'package:flutter/material.dart';
import 'package:tasks_todo/features/home/domain/entities/task_entity.dart';

List<TaskEntity> tasksSeeder = [
  TaskEntity(
    title: "Morning Routine",
    time: DateTime(2026, 1, 1, 8, 0),
    category: "HABIT",
    isCompleted: true,
    categoryColor: Colors.green,
  ),
  TaskEntity(
    title: "Design Sync",
    time: DateTime(2026, 1, 1, 10, 30),
    category: "WORK",
    isCompleted: false,
    categoryColor: Colors.blue,
  ),
  TaskEntity(
    title: "Deep Work Session",
    time: DateTime(2026, 1, 1, 14, 0),
    category: "FOCUS",
    isCompleted: false,
    categoryColor: Color(0xFFC3662C),
  ),
  TaskEntity(
    title: "Grocery Shopping",
    time: DateTime(2026, 1, 1, 17, 0),
    category: "PERSONAL",
    isCompleted: false,
    categoryColor: Colors.pink,
  ),
];
