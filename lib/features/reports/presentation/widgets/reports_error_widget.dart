import 'package:flutter/material.dart';
import 'package:turbotask/core/network/network_exceptions.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';
import 'package:turbotask/features/reports/presentation/widgets/reports_dashboard.dart';

class ReportsErrorWidget extends StatelessWidget {
  final NetworkExceptions error;
  final VoidCallback onRetry;
  final ReportsOverview? previousData;

  const ReportsErrorWidget({
    super.key,
    required this.error,
    required this.onRetry,
    this.previousData,
  });

  @override
  Widget build(BuildContext context) {
    // If we have previous data, show it with an error banner
    if (previousData != null) {
      return Column(
        children: [
          // Error Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: AppColors.error.withOpacity(0.1),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: AppColors.error, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Failed to refresh data: ${NetworkExceptions.getErrorMessage(error)}',
                    style: TextStyle(color: AppColors.error, fontSize: 14),
                  ),
                ),
                TextButton(
                  onPressed: onRetry,
                  child: Text(
                    'Retry',
                    style: TextStyle(
                      color: AppColors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Show previous data
          Expanded(
            child: ReportsDashboard(
              overview: previousData!,
              filters: const ReportFilterRequest(
                dateRange: ReportDateRange.monthly,
              ),
              isRefreshing: false,
            ),
          ),
        ],
      );
    }

    // Full error state
    return Center(
      child: Container(
        padding: const EdgeInsets.all(32),
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Error Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(_getErrorIcon(), size: 40, color: AppColors.error),
            ),

            const SizedBox(height: 24),

            // Error Title
            Text(
              _getErrorTitle(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            // Error Message
            Text(
              NetworkExceptions.getErrorMessage(error),
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: BorderSide(color: AppColors.border),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Go Back'),
                ),

                const SizedBox(width: 16),

                ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getErrorIcon() {
    return error.when(
      requestCancelled: () => Icons.cancel_outlined,
      requestTimeout: () => Icons.access_time,
      sendTimeout: () => Icons.send,
      noInternetConnection: () => Icons.wifi_off,
      unauthorisedRequest: () => Icons.lock_outline,
      badRequest: () => Icons.error_outline,
      notFound: (reason) => Icons.search_off,
      methodNotAllowed: () => Icons.block,
      notAcceptable: () => Icons.not_interested,
      conflict: () => Icons.merge_type,
      internalServerError: () => Icons.error,
      notImplemented: () => Icons.construction,
      serviceUnavailable: () => Icons.cloud_off,
      formatException: () => Icons.data_array,
      unableToProcess: () => Icons.error_outline,
      defaultError: (String error) => Icons.error_outline,
      unexpectedError: () => Icons.help_outline,
    );
  }

  String _getErrorTitle() {
    return error.when(
      requestCancelled: () => 'Request Cancelled',
      requestTimeout: () => 'Connection Timeout',
      sendTimeout: () => 'Send Timeout',
      noInternetConnection: () => 'No Internet Connection',
      unauthorisedRequest: () => 'Unauthorized Access',
      badRequest: () => 'Invalid Request',
      notFound: (reason) => 'Data Not Found',
      methodNotAllowed: () => 'Method Not Allowed',
      notAcceptable: () => 'Request Not Acceptable',
      conflict: () => 'Data Conflict',
      internalServerError: () => 'Server Error',
      notImplemented: () => 'Feature Not Available',
      serviceUnavailable: () => 'Service Unavailable',
      formatException: () => 'Data Format Error',
      unableToProcess: () => 'Processing Error',
      defaultError: (String error) => 'Error Occurred',
      unexpectedError: () => 'Unexpected Error',
    );
  }
}

// Additional helper widget for inline error messages
class InlineErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final bool showRetry;

  const InlineErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.showRetry = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.error, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: AppColors.error, fontSize: 14),
            ),
          ),
          if (showRetry && onRetry != null) ...[
            const SizedBox(width: 12),
            TextButton(
              onPressed: onRetry,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.error,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}
