import 'package:tasks_todo/features/task_management/data/models/task_model.dart';
import 'package:tasks_todo/features/task_management/domain/entities/task_entity.dart';

class TaskMappers {
  static TaskModel toModel(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      useriId: entity.useriId,
      taskName: entity.taskName,
      notes: entity.notes,
      category: entity.category,
      time: entity.time,
      date: entity.date,
      priority: entity.priority,
      isCompleted: entity.isCompleted,
    );
  }

  static TaskEntity toEntity(TaskModel model) {
    return TaskEntity(
      id: model.id,
      useriId: model.useriId,
      taskName: model.taskName,
      notes: model.notes,
      category: model.category,
      time: model.time,
      date: model.date,
      priority: model.priority,
      isCompleted: model.isCompleted,
    );
  }
}
