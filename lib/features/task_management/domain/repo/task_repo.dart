import 'package:tasks_todo/features/home/domain/entities/task_entity.dart';

abstract class TaskRepo {
  Future<TaskEntity> addTask(TaskEntity task);
}
