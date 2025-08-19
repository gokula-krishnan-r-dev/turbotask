import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:turbotask/core/network/network_exceptions.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';

abstract class ReportsRepository {
  /// Get comprehensive reports overview
  Future<Either<NetworkExceptions, ReportsOverview>> getReportsOverview(
    ReportFilterRequest filters,
  );

  /// Get task-specific metrics
  Future<Either<NetworkExceptions, TaskReportMetrics>> getTaskReport(
    ReportFilterRequest filters,
  );

  /// Get project-specific metrics
  Future<Either<NetworkExceptions, ProjectReportMetrics>> getProjectReport(
    ReportFilterRequest filters,
  );

  /// Get analysis report with insights
  Future<Either<NetworkExceptions, ReportsOverview>> getAnalysisReport(
    ReportFilterRequest filters,
  );

  /// Get comparison between time periods
  Future<Either<NetworkExceptions, ComparisonReport>> getComparisonReport(
    ReportFilterRequest filters,
  );

  /// Get detailed breakdown for specific project
  Future<Either<NetworkExceptions, Map<String, dynamic>>> getDrillDownReport(
    String projectId,
    ReportFilterRequest filters,
  );

  /// Export report data in various formats
  Future<Either<NetworkExceptions, Uint8List>> exportReport(
    ExportRequest request,
  );

  /// Clear reports cache
  Future<Either<NetworkExceptions, void>> invalidateCache();

  // Convenience methods
  Future<Either<NetworkExceptions, ReportsOverview>> getDefaultReports();
  Future<Either<NetworkExceptions, ReportsOverview>> getTodayReports();
  Future<Either<NetworkExceptions, ReportsOverview>> getWeeklyReports();
  Future<Either<NetworkExceptions, ReportsOverview>> getCustomRangeReports(
    DateTime startDate,
    DateTime endDate,
  );
  Future<Either<NetworkExceptions, ReportsOverview>> getProjectReports(
    String projectId,
    ReportDateRange dateRange,
  );
  Future<Either<NetworkExceptions, Uint8List>> exportCsvReport(
    String reportType,
    ReportFilterRequest filters,
  );
  Future<Either<NetworkExceptions, Uint8List>> exportPdfReport(
    String reportType,
    ReportFilterRequest filters,
  );
}
