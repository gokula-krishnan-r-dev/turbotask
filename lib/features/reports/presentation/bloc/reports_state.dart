import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:turbotask/core/network/network_exceptions.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';

part 'reports_state.freezed.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState.initial() = _Initial;

  const factory ReportsState.loading() = _Loading;

  const factory ReportsState.loaded({
    required ReportsOverview overview,
    required ReportFilterRequest currentFilters,
    ComparisonReport? comparison,
    Map<String, dynamic>? drillDownData,
    @Default(false) bool isExporting,
    @Default(false) bool isRefreshing,
  }) = _Loaded;

  const factory ReportsState.error({
    required NetworkExceptions error,
    ReportsOverview? previousData,
    ReportFilterRequest? currentFilters,
  }) = _Error;

  const factory ReportsState.exportSuccess({
    required String filename,
    required String format,
  }) = _ExportSuccess;

  const factory ReportsState.exportError({required String error}) =
      _ExportError;
}

// Extension for state checks
extension ReportsStateExtension on ReportsState {
  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get hasData => maybeWhen(
    loaded: (_, __, ___, ____, _____, ______) => true,
    orElse: () => false,
  );

  bool get hasError =>
      maybeWhen(error: (_, __, ___) => true, orElse: () => false);

  bool get isExporting => maybeWhen(
    loaded: (_, __, ___, ____, isExporting, ______) => isExporting,
    orElse: () => false,
  );

  bool get isRefreshing => maybeWhen(
    loaded: (_, __, ___, ____, _____, isRefreshing) => isRefreshing,
    orElse: () => false,
  );

  ReportsOverview? get data => maybeWhen(
    loaded: (overview, _, __, ___, ____, _____) => overview,
    error: (_, previousData, __) => previousData,
    orElse: () => null,
  );

  ReportFilterRequest? get currentFilters => maybeWhen(
    loaded: (_, currentFilters, __, ___, ____, _____) => currentFilters,
    error: (_, __, currentFilters) => currentFilters,
    orElse: () => null,
  );

  ComparisonReport? get comparison => maybeWhen(
    loaded: (_, __, comparison, ___, ____, _____) => comparison,
    orElse: () => null,
  );

  Map<String, dynamic>? get drillDownData => maybeWhen(
    loaded: (_, __, ___, drillDownData, ____, _____) => drillDownData,
    orElse: () => null,
  );

  NetworkExceptions? get error =>
      maybeWhen(error: (error, _, __) => error, orElse: () => null);
}
