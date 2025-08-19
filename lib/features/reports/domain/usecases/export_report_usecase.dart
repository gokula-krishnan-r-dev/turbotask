import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:turbotask/core/network/network_exceptions.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';
import 'package:turbotask/features/reports/domain/repositories/reports_repository.dart';

@injectable
class ExportReportUseCase {
  final ReportsRepository _repository;

  ExportReportUseCase(this._repository);

  Future<Either<NetworkExceptions, Uint8List>> call(
    ExportRequest request,
  ) async {
    return await _repository.exportReport(request);
  }

  Future<Either<NetworkExceptions, Uint8List>> exportCsv(
    String reportType,
    ReportFilterRequest filters,
  ) async {
    return await _repository.exportCsvReport(reportType, filters);
  }

  Future<Either<NetworkExceptions, Uint8List>> exportPdf(
    String reportType,
    ReportFilterRequest filters,
  ) async {
    return await _repository.exportPdfReport(reportType, filters);
  }

  Future<Either<NetworkExceptions, Uint8List>> exportTaskReportCsv(
    ReportFilterRequest filters,
  ) async {
    return await _repository.exportCsvReport('task', filters);
  }

  Future<Either<NetworkExceptions, Uint8List>> exportProjectReportCsv(
    ReportFilterRequest filters,
  ) async {
    return await _repository.exportCsvReport('project', filters);
  }

  Future<Either<NetworkExceptions, Uint8List>> exportAnalysisReportCsv(
    ReportFilterRequest filters,
  ) async {
    return await _repository.exportCsvReport('analysis', filters);
  }
}
