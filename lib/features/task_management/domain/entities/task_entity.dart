import 'package:flutter/material.dart';

class TaskEntity {
  final int id;
  final int useriId;
  final String taskName;
  final String notes;
  final String category;
  final TimeOfDay time;
  final DateTime date;
  final String priority;
  final bool isCompleted;

  TaskEntity({
    required this.id,
    required this.useriId,
    required this.taskName,
    required this.notes,
    required this.category,
    required this.time,
    required this.date,
    required this.priority,
    required this.isCompleted,
  });
}
