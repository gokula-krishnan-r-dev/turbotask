import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:turbotask/core/network/network_exceptions.dart';
import 'package:turbotask/features/reports/data/datasources/reports_api_service.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';
import 'package:turbotask/features/reports/domain/repositories/reports_repository.dart';

@LazySingleton(as: ReportsRepository)
class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsApiService _apiService;

  ReportsRepositoryImpl(this._apiService);

  @override
  Future<Either<NetworkExceptions, ReportsOverview>> getReportsOverview(
    ReportFilterRequest filters,
  ) async {
    try {
      final result = await _apiService.getReportsOverview(filters);
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return Left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, TaskReportMetrics>> getTaskReport(
    ReportFilterRequest filters,
  ) async {
    try {
      final result = await _apiService.getTaskReport(filters);
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return Left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, ProjectReportMetrics>> getProjectReport(
    ReportFilterRequest filters,
  ) async {
    try {
      final result = await _apiService.getProjectReport(filters);
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return Left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, ReportsOverview>> getAnalysisReport(
    ReportFilterRequest filters,
  ) async {
    try {
      final result = await _apiService.getAnalysisReport(filters);
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return Left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, ComparisonReport>> getComparisonReport(
    ReportFilterRequest filters,
  ) async {
    try {
      final result = await _apiService.getComparisonReport(filters);
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return Left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, Map<String, dynamic>>> getDrillDownReport(
    String projectId,
    ReportFilterRequest filters,
  ) async {
    try {
      final result = await _apiService.getDrillDownReport(projectId, filters);
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return Left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, Uint8List>> exportReport(
    ExportRequest request,
  ) async {
    try {
      final result = await _apiService.exportReport(request);
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return Left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, void>> invalidateCache() async {
    try {
      await _apiService.invalidateCache();
      return const Right(null);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return Left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, ReportsOverview>> getDefaultReports() async {
    return getReportsOverview(
      const ReportFilterRequest(dateRange: ReportDateRange.monthly),
    );
  }

  @override
  Future<Either<NetworkExceptions, ReportsOverview>> getTodayReports() async {
    return getReportsOverview(
      const ReportFilterRequest(dateRange: ReportDateRange.daily),
    );
  }

  @override
  Future<Either<NetworkExceptions, ReportsOverview>> getWeeklyReports() async {
    return getReportsOverview(
      const ReportFilterRequest(dateRange: ReportDateRange.weekly),
    );
  }

  @override
  Future<Either<NetworkExceptions, ReportsOverview>> getCustomRangeReports(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return getReportsOverview(
      ReportFilterRequest(
        dateRange: ReportDateRange.custom,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  Future<Either<NetworkExceptions, ReportsOverview>> getProjectReports(
    String projectId,
    ReportDateRange dateRange,
  ) async {
    return getReportsOverview(
      ReportFilterRequest(dateRange: dateRange, projectId: projectId),
    );
  }

  @override
  Future<Either<NetworkExceptions, Uint8List>> exportCsvReport(
    String reportType,
    ReportFilterRequest filters,
  ) async {
    return exportReport(
      ExportRequest(format: 'csv', reportType: reportType, filters: filters),
    );
  }

  @override
  Future<Either<NetworkExceptions, Uint8List>> exportPdfReport(
    String reportType,
    ReportFilterRequest filters,
  ) async {
    return exportReport(
      ExportRequest(format: 'pdf', reportType: reportType, filters: filters),
    );
  }
}
