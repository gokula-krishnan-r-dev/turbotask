import 'package:equatable/equatable.dart';
import 'todo.dart';

/// Request entity for creating a new subtask.
class CreateSubtaskRequest extends Equatable {
  const CreateSubtaskRequest({
    required this.name,
    required this.description,
    this.priority = TodoPriority.medium,
    this.estimatedTime,
    this.sortOrder = 0,
  });

  final String name;
  final String description;
  final TodoPriority priority;
  final int? estimatedTime; // in minutes
  final int sortOrder;

  @override
  List<Object?> get props => [
    name,
    description,
    priority,
    estimatedTime,
    sortOrder,
  ];

  @override
  String toString() {
    return 'CreateSubtaskRequest(name: $name, priority: $priority)';
  }
}
