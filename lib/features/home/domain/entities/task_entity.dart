import 'package:flutter/material.dart';

class TaskEntity {
  final String title;
  final DateTime time;
  final String category;
  final bool isCompleted;
  final Color categoryColor;

  TaskEntity({
    required this.title,
    required this.time,
    required this.category,
    required this.isCompleted,
    required this.categoryColor,
  });
}
