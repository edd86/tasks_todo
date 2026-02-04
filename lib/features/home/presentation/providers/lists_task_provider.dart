import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_todo/core/seed/task_seeder.dart';
import 'package:tasks_todo/features/home/domain/entities/task_entity.dart';

final listsTaskProvider = Provider<List<TaskEntity>>((ref) {
  return tasksSeeder;
});
