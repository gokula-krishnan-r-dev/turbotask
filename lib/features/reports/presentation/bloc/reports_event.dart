import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';

part 'reports_event.freezed.dart';

@freezed
class ReportsEvent with _$ReportsEvent {
  // Initial load
  const factory ReportsEvent.loadReports({ReportFilterRequest? filters}) =
      _LoadReports;

  // Refresh current data
  const factory ReportsEvent.refreshReports() = _RefreshReports;

  // Filter changes
  const factory ReportsEvent.changeFilters({
    required ReportFilterRequest filters,
  }) = _ChangeFilters;

  // Date range specific filters
  const factory ReportsEvent.changeDateRange({
    required ReportDateRange dateRange,
  }) = _ChangeDateRange;

  const factory ReportsEvent.setCustomDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) = _SetCustomDateRange;

  // Project filtering
  const factory ReportsEvent.filterByProject({required String projectId}) =
      _FilterByProject;

  const factory ReportsEvent.clearProjectFilter() = _ClearProjectFilter;

  // Status and priority filtering
  const factory ReportsEvent.filterByStatus({required TaskStatus status}) =
      _FilterByStatus;

  const factory ReportsEvent.filterByPriority({
    required PriorityLevel priority,
  }) = _FilterByPriority;

  const factory ReportsEvent.filterByCategory({
    required ProjectCategory category,
  }) = _FilterByCategory;

  const factory ReportsEvent.clearFilters() = _ClearFilters;

  // Advanced reports
  const factory ReportsEvent.loadComparisonReport() = _LoadComparisonReport;

  const factory ReportsEvent.loadDrillDownReport({required String projectId}) =
      _LoadDrillDownReport;

  // Export functionality
  const factory ReportsEvent.exportReport({
    required String format,
    required String reportType,
  }) = _ExportReport;

  const factory ReportsEvent.exportCurrentReport({required String format}) =
      _ExportCurrentReport;

  // Cache management
  const factory ReportsEvent.invalidateCache() = _InvalidateCache;

  // Error handling
  const factory ReportsEvent.retryLastAction() = _RetryLastAction;

  const factory ReportsEvent.clearError() = _ClearError;

  // UI state management
  const factory ReportsEvent.resetToInitial() = _ResetToInitial;

  // Quick access events
  const factory ReportsEvent.loadTodayReports() = _LoadTodayReports;

  const factory ReportsEvent.loadWeeklyReports() = _LoadWeeklyReports;

  const factory ReportsEvent.loadMonthlyReports() = _LoadMonthlyReports;
}

// Extension for event categorization
extension ReportsEventExtension on ReportsEvent {
  bool get isLoadingEvent => maybeWhen(
    loadReports: (_) => true,
    refreshReports: () => true,
    changeFilters: (_) => true,
    loadComparisonReport: () => true,
    loadDrillDownReport: (_) => true,
    loadTodayReports: () => true,
    loadWeeklyReports: () => true,
    loadMonthlyReports: () => true,
    orElse: () => false,
  );

  bool get isFilterEvent => maybeWhen(
    changeDateRange: (_) => true,
    setCustomDateRange: (_, __) => true,
    filterByProject: (_) => true,
    clearProjectFilter: () => true,
    filterByStatus: (_) => true,
    filterByPriority: (_) => true,
    filterByCategory: (_) => true,
    clearFilters: () => true,
    orElse: () => false,
  );

  bool get isExportEvent => maybeWhen(
    exportReport: (_, __) => true,
    exportCurrentReport: (_) => true,
    orElse: () => false,
  );

  bool get isCacheEvent =>
      maybeWhen(invalidateCache: () => true, orElse: () => false);

  bool get isErrorHandlingEvent => maybeWhen(
    retryLastAction: () => true,
    clearError: () => true,
    orElse: () => false,
  );
}
