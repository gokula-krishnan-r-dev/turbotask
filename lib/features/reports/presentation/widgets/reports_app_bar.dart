import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_bloc.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_state.dart';

class ReportsAppBar extends StatelessWidget {
  final VoidCallback onFilterToggle;
  final VoidCallback onExportTap;
  final VoidCallback onRefreshTap;

  const ReportsAppBar({
    super.key,
    required this.onFilterToggle,
    required this.onExportTap,
    required this.onRefreshTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              // Back Button
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),

              const SizedBox(width: 16),

              // Title Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reports Overview',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'A birds eye view of your entire behaviour and productivity',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Action Buttons
              Row(
                children: [
                  // Refresh Button
                  BlocBuilder<ReportsBloc, ReportsState>(
                    builder: (context, state) {
                      final isRefreshing = state.isRefreshing;
                      return IconButton(
                        onPressed: isRefreshing ? null : onRefreshTap,
                        icon: isRefreshing
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.primary,
                                ),
                              )
                            : Icon(
                                Icons.refresh,
                                color: AppColors.textSecondary,
                              ),
                        tooltip: 'Refresh Data',
                      );
                    },
                  ),

                  const SizedBox(width: 8),

                  // Filter Button
                  IconButton(
                    onPressed: onFilterToggle,
                    icon: Icon(Icons.tune, color: AppColors.textSecondary),
                    tooltip: 'Filter Options',
                  ),

                  const SizedBox(width: 8),

                  // Export Button
                  BlocBuilder<ReportsBloc, ReportsState>(
                    builder: (context, state) {
                      final isExporting = state.isExporting;
                      return IconButton(
                        onPressed: isExporting ? null : onExportTap,
                        icon: isExporting
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.primary,
                                ),
                              )
                            : Icon(
                                Icons.download,
                                color: AppColors.textSecondary,
                              ),
                        tooltip: 'Export Report',
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Quick Date Range Buttons
          BlocBuilder<ReportsBloc, ReportsState>(
            builder: (context, state) {
              final currentFilters = state.currentFilters;
              final currentDateRange =
                  currentFilters?.dateRange ?? ReportDateRange.monthly;

              return Row(
                children: [
                  _QuickRangeButton(
                    label: 'Today',
                    isSelected: currentDateRange == ReportDateRange.daily,
                    onTap: () {
                      context.read<ReportsBloc>().changeDateRange(
                        ReportDateRange.daily,
                      );
                    },
                  ),

                  const SizedBox(width: 8),

                  _QuickRangeButton(
                    label: 'This Week',
                    isSelected: currentDateRange == ReportDateRange.weekly,
                    onTap: () {
                      context.read<ReportsBloc>().changeDateRange(
                        ReportDateRange.weekly,
                      );
                    },
                  ),

                  const SizedBox(width: 8),

                  _QuickRangeButton(
                    label: 'This Month',
                    isSelected: currentDateRange == ReportDateRange.monthly,
                    onTap: () {
                      context.read<ReportsBloc>().changeDateRange(
                        ReportDateRange.monthly,
                      );
                    },
                  ),

                  const SizedBox(width: 8),

                  _QuickRangeButton(
                    label: 'Last Month',
                    isSelected: currentDateRange == ReportDateRange.lastMonth,
                    onTap: () {
                      context.read<ReportsBloc>().changeDateRange(
                        ReportDateRange.lastMonth,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _QuickRangeButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _QuickRangeButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
