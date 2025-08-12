part of 'kanban_board_bloc.dart';

abstract class KanbanBoardState extends Equatable {
  const KanbanBoardState();

  @override
  List<Object?> get props => [];
}

class KanbanBoardInitial extends KanbanBoardState {
  const KanbanBoardInitial();
}

class KanbanBoardLoading extends KanbanBoardState {
  final KanbanBoard? previousBoard;

  const KanbanBoardLoading({this.previousBoard});

  @override
  List<Object?> get props => [previousBoard];
}

class KanbanBoardLoaded extends KanbanBoardState {
  final KanbanBoard kanbanBoard;

  const KanbanBoardLoaded(this.kanbanBoard);

  @override
  List<Object?> get props => [kanbanBoard];
}

class KanbanBoardError extends KanbanBoardState {
  final String message;

  const KanbanBoardError(this.message);

  @override
  List<Object?> get props => [message];
}
