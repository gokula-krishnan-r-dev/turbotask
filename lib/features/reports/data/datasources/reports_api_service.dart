import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:turbotask/core/network/api_service.dart';
import 'package:turbotask/core/network/network_exceptions.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';

abstract class ReportsApiService {
  Future<ReportsOverview> getReportsOverview(ReportFilterRequest filters);
  Future<TaskReportMetrics> getTaskReport(ReportFilterRequest filters);
  Future<ProjectReportMetrics> getProjectReport(ReportFilterRequest filters);
  Future<ReportsOverview> getAnalysisReport(ReportFilterRequest filters);
  Future<ComparisonReport> getComparisonReport(ReportFilterRequest filters);
  Future<Map<String, dynamic>> getDrillDownReport(
    String projectId,
    ReportFilterRequest filters,
  );
  Future<Uint8List> exportReport(ExportRequest request);
  Future<void> invalidateCache();
}

@LazySingleton(as: ReportsApiService)
class ReportsApiServiceImpl implements ReportsApiService {
  final ApiService _apiService;

  static const String _baseEndpoint = '/api/v1/reports';

  ReportsApiServiceImpl(this._apiService);

  /// Build query string from report filters with proper validation
  String _buildQueryString(ReportFilterRequest filters) {
    final queryParams = <String, dynamic>{
      'date_range': filters.dateRange.name,
      'page': filters.page.clamp(1, 1000),
      'limit': filters.limit.clamp(1, 100),
    };

    // Add optional date parameters
    if (filters.startDate != null) {
      queryParams['start_date'] = _formatDateForApi(filters.startDate!);
    }

    if (filters.endDate != null) {
      queryParams['end_date'] = _formatDateForApi(filters.endDate!);
    }

    // Add optional filter parameters
    _addOptionalParam(queryParams, 'project_id', filters.projectId);
    _addOptionalParam(queryParams, 'status', filters.status?.name);
    _addOptionalParam(queryParams, 'category', filters.category?.name);
    _addOptionalParam(queryParams, 'priority', filters.priority?.name);

    return queryParams.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');
  }

  /// Format date for API consumption
  String _formatDateForApi(DateTime date) {
    return date.toIso8601String().split('T')[0];
  }

  /// Add optional parameter if not null
  void _addOptionalParam(
    Map<String, dynamic> params,
    String key,
    dynamic value,
  ) {
    if (value != null) {
      params[key] = value;
    }
  }

  /// Generic method to handle API calls with consistent error handling
  Future<T> _handleApiCall<T>(
    String endpoint,
    T Function(Object?) fromJson, {
    Map<String, dynamic>? data,
    Options? options,
    String? errorMessage,
  }) async {
    try {
      final response = data != null
          ? await _apiService.post(endpoint, data: data, options: options)
          : await _apiService.get(endpoint, options: options);

      final reportResponse = ReportApiResponse<T>.fromJson(
        response.data,
        fromJson,
      );

      if (!reportResponse.success || reportResponse.data == null) {
        throw NetworkExceptions.defaultError(
          reportResponse.error?['message'] ?? errorMessage ?? 'API call failed',
        );
      }

      return reportResponse.data!;
    } on DioException catch (e) {
      throw NetworkExceptions.fromDioException(e);
    } catch (e) {
      throw NetworkExceptions.defaultError(e.toString());
    }
  }

  /// Handle raw API calls that return bytes or basic types
  Future<T> _handleRawApiCall<T>(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
    String? errorMessage,
  }) async {
    try {
      final response = data != null
          ? await _apiService.post(endpoint, data: data, options: options)
          : await _apiService.get(endpoint, options: options);

      if (response.data == null) {
        throw NetworkExceptions.defaultError(
          errorMessage ?? 'No data received from API',
        );
      }

      return response.data as T;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        // Try to parse error message from response
        try {
          final errorData = json.decode(String.fromCharCodes(e.response!.data));
          throw NetworkExceptions.defaultError(
            errorData['error']?['message'] ?? errorMessage ?? 'API call failed',
          );
        } catch (_) {
          throw NetworkExceptions.defaultError(
            errorMessage ?? 'API call failed',
          );
        }
      }
      throw NetworkExceptions.fromDioException(e);
    } catch (e) {
      throw NetworkExceptions.defaultError(e.toString());
    }
  }

  @override
  Future<ReportsOverview> getReportsOverview(
    ReportFilterRequest filters,
  ) async {
    final queryString = _buildQueryString(filters);
    return _handleApiCall<ReportsOverview>(
      '$_baseEndpoint/overview?$queryString',
      (json) => ReportsOverview.fromJson(json as Map<String, dynamic>),
      errorMessage: 'Failed to get reports overview',
    );
  }

  @override
  Future<TaskReportMetrics> getTaskReport(ReportFilterRequest filters) async {
    final queryString = _buildQueryString(filters);
    return _handleApiCall<TaskReportMetrics>(
      '$_baseEndpoint/tasks?$queryString',
      (json) => TaskReportMetrics.fromJson(json as Map<String, dynamic>),
      errorMessage: 'Failed to get task report',
    );
  }

  @override
  Future<ProjectReportMetrics> getProjectReport(
    ReportFilterRequest filters,
  ) async {
    final queryString = _buildQueryString(filters);
    return _handleApiCall<ProjectReportMetrics>(
      '$_baseEndpoint/projects?$queryString',
      (json) => ProjectReportMetrics.fromJson(json as Map<String, dynamic>),
      errorMessage: 'Failed to get project report',
    );
  }

  @override
  Future<ReportsOverview> getAnalysisReport(ReportFilterRequest filters) async {
    final queryString = _buildQueryString(filters);
    return _handleApiCall<ReportsOverview>(
      '$_baseEndpoint/analysis?$queryString',
      (json) => ReportsOverview.fromJson(json as Map<String, dynamic>),
      errorMessage: 'Failed to get analysis report',
    );
  }

  @override
  Future<ComparisonReport> getComparisonReport(
    ReportFilterRequest filters,
  ) async {
    final queryString = _buildQueryString(filters);
    return _handleApiCall<ComparisonReport>(
      '$_baseEndpoint/comparison?$queryString',
      (json) => ComparisonReport.fromJson(json as Map<String, dynamic>),
      errorMessage: 'Failed to get comparison report',
    );
  }

  @override
  Future<Map<String, dynamic>> getDrillDownReport(
    String projectId,
    ReportFilterRequest filters,
  ) async {
    final queryString = _buildQueryString(filters);
    return _handleApiCall<Map<String, dynamic>>(
      '$_baseEndpoint/projects/$projectId/drill-down?$queryString',
      (json) => json as Map<String, dynamic>,
      errorMessage: 'Failed to get drill-down report',
    );
  }

  @override
  Future<Uint8List> exportReport(ExportRequest request) async {
    final response = await _handleRawApiCall<List<int>>(
      '$_baseEndpoint/export',
      data: request.toJson(),
      options: Options(
        responseType: ResponseType.bytes,
        headers: {'Content-Type': 'application/json'},
      ),
      errorMessage: 'Export failed',
    );

    return Uint8List.fromList(response);
  }

  @override
  Future<void> invalidateCache() async {
    await _handleApiCall<Map<String, dynamic>>(
      '$_baseEndpoint/cache/invalidate',
      (json) => json as Map<String, dynamic>,
      data: {},
      errorMessage: 'Failed to invalidate cache',
    );
  }
}

// Helper extensions for better API usage
extension ReportsApiServiceExtensions on ReportsApiService {
  /// Get reports with default monthly filter
  Future<ReportsOverview> getDefaultReports({int page = 1, int limit = 50}) {
    return getReportsOverview(
      ReportFilterRequest(
        dateRange: ReportDateRange.monthly,
        page: page,
        limit: limit,
      ),
    );
  }

  /// Get today's reports
  Future<ReportsOverview> getTodayReports({
    String? projectId,
    int page = 1,
    int limit = 50,
  }) {
    return getReportsOverview(
      ReportFilterRequest(
        dateRange: ReportDateRange.daily,
        projectId: projectId,
        page: page,
        limit: limit,
      ),
    );
  }

  /// Get this week's reports
  Future<ReportsOverview> getWeeklyReports({
    String? projectId,
    TaskStatus? status,
    int page = 1,
    int limit = 50,
  }) {
    return getReportsOverview(
      ReportFilterRequest(
        dateRange: ReportDateRange.weekly,
        projectId: projectId,
        status: status,
        page: page,
        limit: limit,
      ),
    );
  }

  /// Get custom date range reports with validation
  Future<ReportsOverview> getCustomRangeReports(
    DateTime startDate,
    DateTime endDate, {
    String? projectId,
    TaskStatus? status,
    PriorityLevel? priority,
    int page = 1,
    int limit = 50,
  }) {
    // Validate date range
    if (startDate.isAfter(endDate)) {
      throw ArgumentError('Start date must be before end date');
    }

    final daysDifference = endDate.difference(startDate).inDays;
    if (daysDifference > 365) {
      throw ArgumentError('Date range cannot exceed 365 days');
    }

    return getReportsOverview(
      ReportFilterRequest(
        dateRange: ReportDateRange.custom,
        startDate: startDate,
        endDate: endDate,
        projectId: projectId,
        status: status,
        priority: priority,
        page: page,
        limit: limit,
      ),
    );
  }

  /// Get project-specific reports with enhanced filtering
  Future<ReportsOverview> getProjectReports(
    String projectId,
    ReportDateRange dateRange, {
    TaskStatus? status,
    PriorityLevel? priority,
    ProjectCategory? category,
    int page = 1,
    int limit = 50,
  }) {
    return getReportsOverview(
      ReportFilterRequest(
        dateRange: dateRange,
        projectId: projectId,
        status: status,
        priority: priority,
        category: category,
        page: page,
        limit: limit,
      ),
    );
  }

  /// Export reports as CSV with validation
  Future<Uint8List> exportCsvReport(
    String reportType,
    ReportFilterRequest filters,
  ) {
    _validateExportParams(reportType, 'csv');
    return exportReport(
      ExportRequest(format: 'csv', reportType: reportType, filters: filters),
    );
  }

  /// Export reports as PDF with validation
  Future<Uint8List> exportPdfReport(
    String reportType,
    ReportFilterRequest filters,
  ) {
    _validateExportParams(reportType, 'pdf');
    return exportReport(
      ExportRequest(format: 'pdf', reportType: reportType, filters: filters),
    );
  }

  /// Export reports as Excel with validation
  Future<Uint8List> exportExcelReport(
    String reportType,
    ReportFilterRequest filters,
  ) {
    _validateExportParams(reportType, 'excel');
    return exportReport(
      ExportRequest(format: 'excel', reportType: reportType, filters: filters),
    );
  }

  /// Validate export parameters
  void _validateExportParams(String reportType, String format) {
    const validReportTypes = ['task', 'project', 'analysis'];
    const validFormats = ['csv', 'pdf', 'excel'];

    if (!validReportTypes.contains(reportType)) {
      throw ArgumentError(
        'Invalid report type: $reportType. Valid types: ${validReportTypes.join(', ')}',
      );
    }

    if (!validFormats.contains(format)) {
      throw ArgumentError(
        'Invalid format: $format. Valid formats: ${validFormats.join(', ')}',
      );
    }
  }

  /// Get performance summary for dashboard
  Future<ReportsOverview> getPerformanceSummary({
    String? projectId,
    ReportDateRange dateRange = ReportDateRange.weekly,
  }) {
    return getReportsOverview(
      ReportFilterRequest(
        dateRange: dateRange,
        projectId: projectId,
        page: 1,
        limit: 20, // Smaller limit for summary
      ),
    );
  }
}
