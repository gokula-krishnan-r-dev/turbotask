import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/break_session.dart';
import '../../domain/entities/break_stats.dart';

part 'break_state.freezed.dart';

@freezed
class BreakState with _$BreakState {
  const factory BreakState.initial() = BreakInitial;

  const factory BreakState.loading() = BreakLoading;

  const factory BreakState.activeBreakLoaded({
    required BreakSession? activeBreak,
    @Default([]) List<BreakSession> breakHistory,
    BreakStats? stats,
  }) = ActiveBreakLoaded;

  const factory BreakState.breakHistoryLoaded({
    BreakSession? activeBreak,
    required List<BreakSession> breakHistory,
    BreakStats? stats,
  }) = BreakHistoryLoaded;

  const factory BreakState.breakStatsLoaded({
    BreakSession? activeBreak,
    @Default([]) List<BreakSession> breakHistory,
    required BreakStats stats,
  }) = BreakStatsLoaded;

  const factory BreakState.error(String message) = BreakError;
}

extension BreakStateX on BreakState {
  /// Get the currently active break session
  BreakSession? get activeBreak => when(
    initial: () => null,
    loading: () => null,
    activeBreakLoaded: (activeBreak, _, __) => activeBreak,
    breakHistoryLoaded: (activeBreak, _, __) => activeBreak,
    breakStatsLoaded: (activeBreak, _, stats) => activeBreak,
    error: (_) => null,
  );

  /// Get the break history
  List<BreakSession> get breakHistory => when(
    initial: () => [],
    loading: () => [],
    activeBreakLoaded: (_, breakHistory, __) => breakHistory,
    breakHistoryLoaded: (_, breakHistory, __) => breakHistory,
    breakStatsLoaded: (_, breakHistory, __) => breakHistory,
    error: (_) => [],
  );

  /// Get the break stats
  BreakStats? get stats => when(
    initial: () => null,
    loading: () => null,
    activeBreakLoaded: (_, __, stats) => stats,
    breakHistoryLoaded: (_, __, stats) => stats,
    breakStatsLoaded: (_, __, stats) => stats,
    error: (_) => null,
  );

  /// Check if there's an active break
  bool get hasActiveBreak =>
      activeBreak != null && activeBreak!.endTime == null;

  /// Check if currently loading
  bool get isLoading => this is BreakLoading;

  /// Check if there's an error
  bool get hasError => this is BreakError;

  /// Get error message if any
  String? get errorMessage => when(
    initial: () => null,
    loading: () => null,
    activeBreakLoaded: (_, __, ___) => null,
    breakHistoryLoaded: (_, __, ___) => null,
    breakStatsLoaded: (_, __, ___) => null,
    error: (message) => message,
  );
}
