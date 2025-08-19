import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:turbotask/core/network/network_exceptions.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';
import 'package:turbotask/features/reports/domain/usecases/export_report_usecase.dart';
import 'package:turbotask/features/reports/domain/usecases/get_reports_overview_usecase.dart';
import 'package:turbotask/features/reports/domain/repositories/reports_repository.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_event.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_state.dart';

@injectable
class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final GetReportsOverviewUseCase _getReportsOverviewUseCase;
  final ExportReportUseCase _exportReportUseCase;
  final ReportsRepository _repository;

  // Store last successful filters for retry functionality
  ReportFilterRequest? _lastFilters;
  ReportsEvent? _lastFailedEvent;

  ReportsBloc(
    this._getReportsOverviewUseCase,
    this._exportReportUseCase,
    this._repository,
  ) : super(const ReportsState.initial()) {
    on<ReportsEvent>(_onReportsEvent);
  }

  Future<void> _onReportsEvent(
    ReportsEvent event,
    Emitter<ReportsState> emit,
  ) async {
    await event.when(
      loadReports: (filters) => _onLoadReports(filters, emit),
      refreshReports: () => _onRefreshReports(emit),
      changeFilters: (filters) => _onChangeFilters(filters, emit),
      changeDateRange: (dateRange) => _onChangeDateRange(dateRange, emit),
      setCustomDateRange: (startDate, endDate) =>
          _onSetCustomDateRange(startDate, endDate, emit),
      filterByProject: (projectId) => _onFilterByProject(projectId, emit),
      clearProjectFilter: () => _onClearProjectFilter(emit),
      filterByStatus: (status) => _onFilterByStatus(status, emit),
      filterByPriority: (priority) => _onFilterByPriority(priority, emit),
      filterByCategory: (category) => _onFilterByCategory(category, emit),
      clearFilters: () => _onClearFilters(emit),
      loadComparisonReport: () => _onLoadComparisonReport(emit),
      loadDrillDownReport: (projectId) =>
          _onLoadDrillDownReport(projectId, emit),
      exportReport: (format, reportType) =>
          _onExportReport(format, reportType, emit),
      exportCurrentReport: (format) => _onExportCurrentReport(format, emit),
      invalidateCache: () => _onInvalidateCache(emit),
      retryLastAction: () => _onRetryLastAction(emit),
      clearError: () => _onClearError(emit),
      resetToInitial: () => _onResetToInitial(emit),
      loadTodayReports: () => _onLoadTodayReports(emit),
      loadWeeklyReports: () => _onLoadWeeklyReports(emit),
      loadMonthlyReports: () => _onLoadMonthlyReports(emit),
    );
  }

  Future<void> _onLoadReports(
    ReportFilterRequest? filters,
    Emitter<ReportsState> emit,
  ) async {
    emit(const ReportsState.loading());

    final reportFilters =
        filters ??
        const ReportFilterRequest(dateRange: ReportDateRange.monthly);

    final result = await _getReportsOverviewUseCase(reportFilters);

    result.fold(
      (error) {
        _lastFailedEvent = ReportsEvent.loadReports(filters: filters);
        emit(ReportsState.error(error: error));
      },
      (overview) {
        _lastFilters = reportFilters;
        emit(
          ReportsState.loaded(
            overview: overview,
            currentFilters: reportFilters,
          ),
        );
      },
    );
  }

  Future<void> _onRefreshReports(Emitter<ReportsState> emit) async {
    if (state.hasData) {
      emit(const ReportsState.loading());
      final result = await _getReportsOverviewUseCase(
        state.currentFilters ??
            const ReportFilterRequest(dateRange: ReportDateRange.monthly),
      );

      result.fold(
        (error) {
          emit(
            ReportsState.error(
              error: error,
              previousData: state.data,
              currentFilters: state.currentFilters,
            ),
          );
        },
        (overview) {
          emit(
            ReportsState.loaded(
              overview: overview,
              currentFilters:
                  state.currentFilters ??
                  const ReportFilterRequest(dateRange: ReportDateRange.monthly),
            ),
          );
        },
      );
    } else {
      add(const ReportsEvent.loadReports());
    }
  }

  Future<void> _onChangeFilters(
    ReportFilterRequest filters,
    Emitter<ReportsState> emit,
  ) async {
    emit(const ReportsState.loading());

    final result = await _getReportsOverviewUseCase(filters);

    result.fold(
      (error) {
        _lastFailedEvent = ReportsEvent.changeFilters(filters: filters);
        emit(ReportsState.error(error: error, currentFilters: filters));
      },
      (overview) {
        _lastFilters = filters;
        emit(ReportsState.loaded(overview: overview, currentFilters: filters));
      },
    );
  }

  Future<void> _onChangeDateRange(
    ReportDateRange dateRange,
    Emitter<ReportsState> emit,
  ) async {
    final currentFilters =
        state.currentFilters ??
        const ReportFilterRequest(dateRange: ReportDateRange.monthly);

    final newFilters = currentFilters.copyWith(
      dateRange: dateRange,
      startDate: null,
      endDate: null,
    );

    add(ReportsEvent.changeFilters(filters: newFilters));
  }

  Future<void> _onSetCustomDateRange(
    DateTime startDate,
    DateTime endDate,
    Emitter<ReportsState> emit,
  ) async {
    final currentFilters =
        state.currentFilters ??
        const ReportFilterRequest(dateRange: ReportDateRange.monthly);

    final newFilters = currentFilters.copyWith(
      dateRange: ReportDateRange.custom,
      startDate: startDate,
      endDate: endDate,
    );

    add(ReportsEvent.changeFilters(filters: newFilters));
  }

  Future<void> _onFilterByProject(
    String projectId,
    Emitter<ReportsState> emit,
  ) async {
    final currentFilters =
        state.currentFilters ??
        const ReportFilterRequest(dateRange: ReportDateRange.monthly);

    final newFilters = currentFilters.copyWith(projectId: projectId);
    add(ReportsEvent.changeFilters(filters: newFilters));
  }

  Future<void> _onClearProjectFilter(Emitter<ReportsState> emit) async {
    final currentFilters =
        state.currentFilters ??
        const ReportFilterRequest(dateRange: ReportDateRange.monthly);

    final newFilters = currentFilters.copyWith(projectId: null);
    add(ReportsEvent.changeFilters(filters: newFilters));
  }

  Future<void> _onFilterByStatus(
    TaskStatus status,
    Emitter<ReportsState> emit,
  ) async {
    final currentFilters =
        state.currentFilters ??
        const ReportFilterRequest(dateRange: ReportDateRange.monthly);

    final newFilters = currentFilters.copyWith(status: status);
    add(ReportsEvent.changeFilters(filters: newFilters));
  }

  Future<void> _onFilterByPriority(
    PriorityLevel priority,
    Emitter<ReportsState> emit,
  ) async {
    final currentFilters =
        state.currentFilters ??
        const ReportFilterRequest(dateRange: ReportDateRange.monthly);

    final newFilters = currentFilters.copyWith(priority: priority);
    add(ReportsEvent.changeFilters(filters: newFilters));
  }

  Future<void> _onFilterByCategory(
    ProjectCategory category,
    Emitter<ReportsState> emit,
  ) async {
    final currentFilters =
        state.currentFilters ??
        const ReportFilterRequest(dateRange: ReportDateRange.monthly);

    final newFilters = currentFilters.copyWith(category: category);
    add(ReportsEvent.changeFilters(filters: newFilters));
  }

  Future<void> _onClearFilters(Emitter<ReportsState> emit) async {
    const defaultFilters = ReportFilterRequest(
      dateRange: ReportDateRange.monthly,
    );
    add(const ReportsEvent.changeFilters(filters: defaultFilters));
  }

  Future<void> _onLoadComparisonReport(Emitter<ReportsState> emit) async {
    if (state.hasData) {
      final result = await _repository.getComparisonReport(
        state.currentFilters ??
            const ReportFilterRequest(dateRange: ReportDateRange.monthly),
      );

      result.fold(
        (error) {
          print(
            'Comparison report error: ${NetworkExceptions.getErrorMessage(error)}',
          );
        },
        (comparison) {
          if (state.hasData) {
            emit(
              ReportsState.loaded(
                overview: state.data!,
                currentFilters: state.currentFilters!,
                comparison: comparison,
              ),
            );
          }
        },
      );
    }
  }

  Future<void> _onLoadDrillDownReport(
    String projectId,
    Emitter<ReportsState> emit,
  ) async {
    if (state.hasData) {
      final result = await _repository.getDrillDownReport(
        projectId,
        state.currentFilters ??
            const ReportFilterRequest(dateRange: ReportDateRange.monthly),
      );

      result.fold(
        (error) {
          print(
            'Drill-down report error: ${NetworkExceptions.getErrorMessage(error)}',
          );
        },
        (drillDownData) {
          if (state.hasData) {
            emit(
              ReportsState.loaded(
                overview: state.data!,
                currentFilters: state.currentFilters!,
                drillDownData: drillDownData,
              ),
            );
          }
        },
      );
    }
  }

  Future<void> _onExportReport(
    String format,
    String reportType,
    Emitter<ReportsState> emit,
  ) async {
    if (state.hasData) {
      emit(
        ReportsState.loaded(
          overview: state.data!,
          currentFilters: state.currentFilters!,
          isExporting: true,
        ),
      );

      final exportRequest = ExportRequest(
        format: format,
        reportType: reportType,
        filters:
            state.currentFilters ??
            const ReportFilterRequest(dateRange: ReportDateRange.monthly),
      );

      final result = await _exportReportUseCase(exportRequest);

      result.fold(
        (error) {
          emit(
            ReportsState.loaded(
              overview: state.data!,
              currentFilters: state.currentFilters!,
              isExporting: false,
            ),
          );
          emit(
            ReportsState.exportError(
              error: NetworkExceptions.getErrorMessage(error),
            ),
          );
        },
        (data) async {
          emit(
            ReportsState.loaded(
              overview: state.data!,
              currentFilters: state.currentFilters!,
              isExporting: false,
            ),
          );
          final filename = await _saveAndShareFile(data, format, reportType);
          emit(ReportsState.exportSuccess(filename: filename, format: format));
        },
      );
    }
  }

  Future<void> _onExportCurrentReport(
    String format,
    Emitter<ReportsState> emit,
  ) async {
    add(ReportsEvent.exportReport(format: format, reportType: 'analysis'));
  }

  Future<void> _onInvalidateCache(Emitter<ReportsState> emit) async {
    await _repository.invalidateCache();
    add(const ReportsEvent.refreshReports());
  }

  Future<void> _onRetryLastAction(Emitter<ReportsState> emit) async {
    if (_lastFailedEvent != null) {
      add(_lastFailedEvent!);
    } else if (_lastFilters != null) {
      add(ReportsEvent.loadReports(filters: _lastFilters));
    } else {
      add(const ReportsEvent.loadReports());
    }
  }

  Future<void> _onClearError(Emitter<ReportsState> emit) async {
    if (state.hasError && state.data != null) {
      emit(
        ReportsState.loaded(
          overview: state.data!,
          currentFilters:
              state.currentFilters ??
              const ReportFilterRequest(dateRange: ReportDateRange.monthly),
        ),
      );
    } else {
      emit(const ReportsState.initial());
    }
  }

  Future<void> _onResetToInitial(Emitter<ReportsState> emit) async {
    emit(const ReportsState.initial());
  }

  Future<void> _onLoadTodayReports(Emitter<ReportsState> emit) async {
    add(
      const ReportsEvent.changeFilters(
        filters: ReportFilterRequest(dateRange: ReportDateRange.daily),
      ),
    );
  }

  Future<void> _onLoadWeeklyReports(Emitter<ReportsState> emit) async {
    add(
      const ReportsEvent.changeFilters(
        filters: ReportFilterRequest(dateRange: ReportDateRange.weekly),
      ),
    );
  }

  Future<void> _onLoadMonthlyReports(Emitter<ReportsState> emit) async {
    add(
      const ReportsEvent.changeFilters(
        filters: ReportFilterRequest(dateRange: ReportDateRange.monthly),
      ),
    );
  }

  Future<String> _saveAndShareFile(
    Uint8List data,
    String format,
    String reportType,
  ) async {
    final directory = await getTemporaryDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final filename = '${reportType}_report_$timestamp.$format';
    final file = File('${directory.path}/$filename');

    await file.writeAsBytes(data);

    // Share the file
    await Share.shareXFiles([XFile(file.path)], text: 'Report Export');

    return filename;
  }

  // Public helper methods
  void loadDefaultReports() {
    add(const ReportsEvent.loadReports());
  }

  void refreshCurrentData() {
    add(const ReportsEvent.refreshReports());
  }

  void changeDateRange(ReportDateRange dateRange) {
    add(ReportsEvent.changeDateRange(dateRange: dateRange));
  }

  void setCustomDateRange(DateTime startDate, DateTime endDate) {
    add(
      ReportsEvent.setCustomDateRange(startDate: startDate, endDate: endDate),
    );
  }

  void filterByProject(String projectId) {
    add(ReportsEvent.filterByProject(projectId: projectId));
  }

  void exportAsCsv() {
    add(const ReportsEvent.exportCurrentReport(format: 'csv'));
  }

  void exportAsPdf() {
    add(const ReportsEvent.exportCurrentReport(format: 'pdf'));
  }
}
