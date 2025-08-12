import 'package:equatable/equatable.dart';
import 'todo.dart';

/// Kanban board entity representing a project's kanban board
class KanbanBoard extends Equatable {
  const KanbanBoard({
    required this.projectId,
    required this.projectTitle,
    required this.columns,
    required this.totalTodos,
    required this.lastUpdated,
    this.stats,
  });

  final String projectId;
  final String projectTitle;
  final List<KanbanColumn> columns;
  final int totalTodos;
  final DateTime lastUpdated;
  final BoardStats? stats;

  /// Get column by status
  KanbanColumn? getColumnByStatus(TaskStatus status) {
    try {
      return columns.firstWhere((column) => column.status == status);
    } catch (e) {
      return null;
    }
  }

  /// Get todos by status
  List<Todo> getTodosByStatus(TaskStatus status) {
    final column = getColumnByStatus(status);
    return column?.todos ?? [];
  }

  /// Create a copy with updated fields
  KanbanBoard copyWith({
    String? projectId,
    String? projectTitle,
    List<KanbanColumn>? columns,
    int? totalTodos,
    DateTime? lastUpdated,
    BoardStats? stats,
  }) {
    return KanbanBoard(
      projectId: projectId ?? this.projectId,
      projectTitle: projectTitle ?? this.projectTitle,
      columns: columns ?? this.columns,
      totalTodos: totalTodos ?? this.totalTodos,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      stats: stats ?? this.stats,
    );
  }

  @override
  List<Object?> get props => [
    projectId,
    projectTitle,
    columns,
    totalTodos,
    lastUpdated,
    stats,
  ];

  factory KanbanBoard.fromJson(Map<String, dynamic> json) {
    return KanbanBoard(
      projectId: json['project_id'] ?? '',
      projectTitle: json['project_title'] ?? '',
      columns:
          (json['columns'] as List?)
              ?.map((col) => KanbanColumn.fromJson(col as Map<String, dynamic>))
              .toList() ??
          [],
      totalTodos: json['total_todos'] ?? 0,
      lastUpdated:
          DateTime.tryParse(json['last_updated'] ?? '') ?? DateTime.now(),
      stats: json['stats'] != null
          ? BoardStats.fromJson(json['stats'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Kanban column entity representing a status column
class KanbanColumn extends Equatable {
  const KanbanColumn({
    required this.status,
    required this.title,
    required this.todos,
    this.color,
    this.maxItems,
  });

  final TaskStatus status;
  final String title;
  final List<Todo> todos;
  final String? color;
  final int? maxItems;

  /// Get todo count
  int get todoCount => todos.length;

  /// Check if column is at capacity
  bool get isAtCapacity => maxItems != null && todoCount >= maxItems!;

  /// Create a copy with updated fields
  KanbanColumn copyWith({
    TaskStatus? status,
    String? title,
    List<Todo>? todos,
    String? color,
    int? maxItems,
  }) {
    return KanbanColumn(
      status: status ?? this.status,
      title: title ?? this.title,
      todos: todos ?? this.todos,
      color: color ?? this.color,
      maxItems: maxItems ?? this.maxItems,
    );
  }

  @override
  List<Object?> get props => [status, title, todos, color, maxItems];

  factory KanbanColumn.fromJson(Map<String, dynamic> json) {
    return KanbanColumn(
      status: TaskStatus.fromString(json['status'] ?? 'not_started'),
      title: json['title'] ?? '',
      todos:
          (json['todos'] as List?)
              ?.map((todo) => Todo.fromJson(todo as Map<String, dynamic>))
              .toList() ??
          [],
      color: json['color'],
      maxItems: json['max_items'],
    );
  }
}

/// Board statistics entity
class BoardStats extends Equatable {
  const BoardStats({
    required this.totalTodos,
    required this.completedTodos,
    required this.inProgressTodos,
    required this.backlogTodos,
    required this.completionRate,
  });

  final int totalTodos;
  final int completedTodos;
  final int inProgressTodos;
  final int backlogTodos;
  final int completionRate; // percentage

  @override
  List<Object?> get props => [
    totalTodos,
    completedTodos,
    inProgressTodos,
    backlogTodos,
    completionRate,
  ];

  factory BoardStats.fromJson(Map<String, dynamic> json) {
    return BoardStats(
      totalTodos: json['total_todos'] ?? 0,
      completedTodos: json['completed_todos'] ?? 0,
      inProgressTodos: json['in_progress_todos'] ?? 0,
      backlogTodos: json['backlog_todos'] ?? 0,
      completionRate: json['completion_rate'] ?? 0,
    );
  }
}
