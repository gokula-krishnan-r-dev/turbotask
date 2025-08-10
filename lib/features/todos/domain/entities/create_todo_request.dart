import 'package:equatable/equatable.dart';
import 'todo.dart';

/// Request entity for creating a new todo.
class CreateTodoRequest extends Equatable {
  const CreateTodoRequest({
    required this.projectId,
    required this.taskName,
    required this.taskDescription,
    this.priority = TodoPriority.medium,
    this.estimatedTime,
    this.timeUnit = 'minutes',
    this.dueDate,
    this.tags = const [],
    this.difficultyRating,
    this.energyLevelRequired,
    this.context,
    this.assignedUserId,
    this.status = TodoStatus.backlog,
  });

  final String projectId;
  final String taskName;
  final String taskDescription;
  final TodoPriority priority;
  final int? estimatedTime;
  final String timeUnit;
  final DateTime? dueDate;
  final List<String> tags;
  final int? difficultyRating;
  final int? energyLevelRequired;
  final String? context;
  final String? assignedUserId;
  final TodoStatus status;

  @override
  List<Object?> get props => [
    projectId,
    taskName,
    taskDescription,
    priority,
    estimatedTime,
    timeUnit,
    dueDate,
    tags,
    difficultyRating,
    energyLevelRequired,
    context,
    assignedUserId,
    status,
  ];

  @override
  String toString() {
    return 'CreateTodoRequest(projectId: $projectId, taskName: $taskName, priority: $priority)';
  }
}
