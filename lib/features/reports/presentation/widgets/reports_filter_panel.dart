import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_bloc.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_event.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_state.dart';

class ReportsFilterPanel extends StatelessWidget {
  const ReportsFilterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: BlocBuilder<ReportsBloc, ReportsState>(
        builder: (context, state) {
          final currentFilters =
              state.currentFilters ??
              const ReportFilterRequest(dateRange: ReportDateRange.monthly);

          return Column(
            children: [
              // First Row - Date Range and Project Filter
              Row(
                children: [
                  // Date Range Dropdown
                  Expanded(
                    flex: 2,
                    child: _FilterDropdown<ReportDateRange>(
                      label: 'Date Range',
                      value: currentFilters.dateRange,
                      items: ReportDateRange.values,
                      itemBuilder: (range) => Text(range.displayName),
                      onChanged: (range) {
                        if (range != null) {
                          context.read<ReportsBloc>().changeDateRange(range);
                        }
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Custom Date Range (only show if custom is selected)
                  if (currentFilters.dateRange == ReportDateRange.custom) ...[
                    Expanded(
                      child: _CustomDateRangeSelector(
                        startDate: currentFilters.startDate,
                        endDate: currentFilters.endDate,
                        onDateRangeChanged: (start, end) {
                          context.read<ReportsBloc>().setCustomDateRange(
                            start,
                            end,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],

                  // Status Filter
                  Expanded(
                    child: _FilterDropdown<TaskStatus>(
                      label: 'Status',
                      value: currentFilters.status,
                      items: TaskStatus.values,
                      itemBuilder: (status) => Text(status.displayName),
                      onChanged: (status) {
                        if (status != null) {
                          context.read<ReportsBloc>().add(
                            ReportsEvent.filterByStatus(status: status),
                          );
                        }
                      },
                      allowNull: true,
                      nullLabel: 'All Statuses',
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Priority Filter
                  Expanded(
                    child: _FilterDropdown<PriorityLevel>(
                      label: 'Priority',
                      value: currentFilters.priority,
                      items: PriorityLevel.values,
                      itemBuilder: (priority) => Text(priority.displayName),
                      onChanged: (priority) {
                        if (priority != null) {
                          context.read<ReportsBloc>().add(
                            ReportsEvent.filterByPriority(priority: priority),
                          );
                        }
                      },
                      allowNull: true,
                      nullLabel: 'All Priorities',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Second Row - Category Filter and Actions
              Row(
                children: [
                  // Category Filter
                  Expanded(
                    child: _FilterDropdown<ProjectCategory>(
                      label: 'Category',
                      value: currentFilters.category,
                      items: ProjectCategory.values,
                      itemBuilder: (category) => Text(category.displayName),
                      onChanged: (category) {
                        if (category != null) {
                          context.read<ReportsBloc>().add(
                            ReportsEvent.filterByCategory(category: category),
                          );
                        }
                      },
                      allowNull: true,
                      nullLabel: 'All Categories',
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Spacer
                  const Expanded(flex: 2, child: SizedBox()),

                  // Clear Filters Button
                  TextButton.icon(
                    onPressed: () {
                      context.read<ReportsBloc>().add(
                        const ReportsEvent.clearFilters(),
                      );
                    },
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear Filters'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FilterDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final void Function(T?) onChanged;
  final bool allowNull;
  final String? nullLabel;

  const _FilterDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.itemBuilder,
    required this.onChanged,
    this.allowNull = false,
    this.nullLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<T>(
            value: value,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            items: [
              if (allowNull)
                DropdownMenuItem<T>(
                  value: null,
                  child: Text(
                    nullLabel ?? 'All',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ...items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: itemBuilder(item),
                );
              }),
            ],
            onChanged: onChanged,
            style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class _CustomDateRangeSelector extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final void Function(DateTime start, DateTime end) onDateRangeChanged;

  const _CustomDateRangeSelector({
    required this.startDate,
    required this.endDate,
    required this.onDateRangeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DatePickerField(
            label: 'Start Date',
            date: startDate,
            onDateSelected: (date) {
              if (date != null) {
                final end = endDate ?? date.add(const Duration(days: 30));
                onDateRangeChanged(date, end);
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _DatePickerField(
            label: 'End Date',
            date: endDate,
            onDateSelected: (date) {
              if (date != null) {
                final start =
                    startDate ?? date.subtract(const Duration(days: 30));
                onDateRangeChanged(start, date);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _DatePickerField extends StatelessWidget {
  final String label;
  final DateTime? date;
  final void Function(DateTime?) onDateSelected;

  const _DatePickerField({
    required this.label,
    required this.date,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: date ?? DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
            );
            onDateSelected(selectedDate);
          },
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    date != null
                        ? '${date!.day}/${date!.month}/${date!.year}'
                        : 'Select date',
                    style: TextStyle(
                      color: date != null
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
