import 'package:flutter/material.dart';

class TaskModel {
  final int id;
  final int useriId;
  final String taskName;
  final String notes;
  final String category;
  final TimeOfDay time;
  final DateTime date;
  final String priority;
  final bool isCompleted;

  TaskModel({
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

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      useriId: json['useriId'],
      taskName: json['taskName'],
      notes: json['notes'],
      category: json['category'],
      time: json['time'],
      date: json['date'],
      priority: json['priority'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'useriId': useriId,
      'taskName': taskName,
      'notes': notes,
      'category': category,
      'time': time,
      'date': date,
      'priority': priority,
      'isCompleted': isCompleted,
    };
  }

  TaskModel copyWith({
    int? id,
    int? useriId,
    String? taskName,
    String? notes,
    String? category,
    TimeOfDay? time,
    DateTime? date,
    String? priority,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      useriId: useriId ?? this.useriId,
      taskName: taskName ?? this.taskName,
      notes: notes ?? this.notes,
      category: category ?? this.category,
      time: time ?? this.time,
      date: date ?? this.date,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
