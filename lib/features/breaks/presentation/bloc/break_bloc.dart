import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/break_stats.dart';
import '../../domain/usecases/start_break_usecase.dart';
import '../../domain/usecases/stop_break_usecase.dart';
import '../../domain/usecases/get_active_break_usecase.dart';
import '../../domain/usecases/get_break_stats_usecase.dart';
import '../../data/models/break_request_models.dart';
import 'break_event.dart';
import 'break_state.dart';

class BreakBloc extends Bloc<BreakEvent, BreakState> {
  final StartBreakUseCase _startBreakUseCase;
  final StopBreakUseCase _stopBreakUseCase;
  final GetActiveBreakUseCase _getActiveBreakUseCase;
  final GetBreakStatsUseCase _getBreakStatsUseCase;

  Timer? _timer;

  BreakBloc(
    this._startBreakUseCase,
    this._stopBreakUseCase,
    this._getActiveBreakUseCase,
    this._getBreakStatsUseCase,
  ) : super(const BreakState.initial()) {
    on<StartBreak>(_onStartBreak);
    on<StopBreak>(_onStopBreak);
    on<LoadActiveBreak>(_onLoadActiveBreak);
    on<LoadBreakStats>(_onLoadBreakStats);
    on<UpdateTimer>(_onUpdateTimer);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  Future<void> _onStartBreak(StartBreak event, Emitter<BreakState> emit) async {
    print('BreakBloc: Starting break for todoId: ${event.todoId}');

    try {
      emit(const BreakState.loading());

      final request = StartBreakRequest(
        todoId: event.todoId,
        projectId: event.projectId,
        breakType: event.breakType,
        notes: event.notes,
      );

      print('BreakBloc: Calling startBreakUseCase...');
      final breakSession = await _startBreakUseCase(request);
      print('BreakBloc: Break started successfully: ${breakSession.id}');

      // Start timer for real-time updates
      _startTimer();

      emit(
        BreakState.activeBreakLoaded(
          activeBreak: breakSession,
          breakHistory: state.breakHistory,
          stats: state.stats,
        ),
      );
    } catch (e) {
      print('BreakBloc Error: $e');
      emit(BreakState.error(e.toString()));
    }
  }

  Future<void> _onStopBreak(StopBreak event, Emitter<BreakState> emit) async {
    print('BreakBloc: Stopping break');

    try {
      emit(const BreakState.loading());

      final request = StopBreakRequest(notes: event.notes);

      print('BreakBloc: Calling stopBreakUseCase...');
      final breakSession = await _stopBreakUseCase(request);
      print('BreakBloc: Break stopped successfully: ${breakSession.id}');

      // Stop timer
      _stopTimer();

      // Load updated stats after stopping break
      final stats = await _getBreakStatsUseCase();

      emit(
        BreakState.activeBreakLoaded(
          activeBreak: null, // No active break after stopping
          breakHistory: [breakSession, ...state.breakHistory],
          stats: stats,
        ),
      );
    } catch (e) {
      print('BreakBloc Error: $e');
      emit(BreakState.error(e.toString()));
    }
  }

  Future<void> _onLoadActiveBreak(
    LoadActiveBreak event,
    Emitter<BreakState> emit,
  ) async {
    print('BreakBloc: Loading active break');

    try {
      if (state.isLoading) return; // Prevent multiple concurrent loads

      final activeBreak = await _getActiveBreakUseCase();
      print('BreakBloc: Active break loaded: ${activeBreak?.id ?? 'None'}');

      if (activeBreak != null && activeBreak.endTime == null) {
        // Start timer for real-time updates
        _startTimer();
      } else {
        // Stop timer if no active break
        _stopTimer();
      }

      emit(
        BreakState.activeBreakLoaded(
          activeBreak: activeBreak,
          breakHistory: state.breakHistory,
          stats: state.stats,
        ),
      );
    } catch (e) {
      print('BreakBloc Error: $e');
      emit(BreakState.error(e.toString()));
    }
  }

  Future<void> _onLoadBreakStats(
    LoadBreakStats event,
    Emitter<BreakState> emit,
  ) async {
    print('BreakBloc: Loading break stats');

    try {
      final stats = await _getBreakStatsUseCase();
      print('BreakBloc: Break stats loaded');

      emit(
        BreakState.breakStatsLoaded(
          activeBreak: state.activeBreak,
          breakHistory: state.breakHistory,
          stats: stats,
        ),
      );
    } catch (e) {
      print('BreakBloc Error: $e');
      emit(BreakState.error(e.toString()));
    }
  }

  void _onUpdateTimer(UpdateTimer event, Emitter<BreakState> emit) {
    // This event is used to trigger UI updates when timer ticks
    // The state doesn't need to change, just emit the current state to trigger rebuild
    if (state.hasActiveBreak) {
      emit(
        BreakState.activeBreakLoaded(
          activeBreak: state.activeBreak,
          breakHistory: state.breakHistory,
          stats: state.stats,
        ),
      );
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.hasActiveBreak) {
        add(const UpdateTimer());
      } else {
        _stopTimer();
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
