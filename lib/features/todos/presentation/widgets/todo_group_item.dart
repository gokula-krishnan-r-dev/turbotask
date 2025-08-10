import 'package:appflowy_board/appflowy_board.dart';
import '../../domain/entities/todo.dart';

/// Wrapper class to make Todo compatible with AppFlowyBoard
/// Implements AppFlowyGroupItem to enable drag-and-drop functionality
class TodoGroupItem extends AppFlowyGroupItem {
  final Todo todo;

  TodoGroupItem({required this.todo});

  @override
  String get id => todo.id;

  /// Create a new TodoGroupItem with updated todo
  TodoGroupItem copyWith({Todo? todo}) {
    return TodoGroupItem(todo: todo ?? this.todo);
  }

  /// Update the sort order of the todo
  TodoGroupItem updateSortOrder(int newSortOrder) {
    return TodoGroupItem(todo: todo.copyWith(sortOrder: newSortOrder));
  }

  /// Update the status of the todo
  TodoGroupItem updateStatus(TodoStatus newStatus) {
    return TodoGroupItem(todo: todo.copyWith(status: newStatus));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TodoGroupItem && other.todo == todo;
  }

  @override
  int get hashCode => todo.hashCode;
}
