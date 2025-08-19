import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:turbotask/core/network/network_exceptions.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';
import 'package:turbotask/features/reports/domain/repositories/reports_repository.dart';

@injectable
class GetReportsOverviewUseCase {
  final ReportsRepository _repository;

  GetReportsOverviewUseCase(this._repository);

  Future<Either<NetworkExceptions, ReportsOverview>> call(
    ReportFilterRequest filters,
  ) async {
    return await _repository.getReportsOverview(filters);
  }

  // Convenience methods
  Future<Either<NetworkExceptions, ReportsOverview>> getDefault() async {
    return await _repository.getDefaultReports();
  }

  Future<Either<NetworkExceptions, ReportsOverview>> getToday() async {
    return await _repository.getTodayReports();
  }

  Future<Either<NetworkExceptions, ReportsOverview>> getThisWeek() async {
    return await _repository.getWeeklyReports();
  }

  Future<Either<NetworkExceptions, ReportsOverview>> getCustomRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await _repository.getCustomRangeReports(startDate, endDate);
  }

  Future<Either<NetworkExceptions, ReportsOverview>> getByProject(
    String projectId,
    ReportDateRange dateRange,
  ) async {
    return await _repository.getProjectReports(projectId, dateRange);
  }
}
