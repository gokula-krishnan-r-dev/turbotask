import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/core/di/injection.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_bloc.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_event.dart';
import 'package:turbotask/features/reports/presentation/bloc/reports_state.dart';
import 'package:turbotask/features/reports/presentation/widgets/reports_app_bar.dart';
import 'package:turbotask/features/reports/presentation/widgets/reports_dashboard.dart';
import 'package:turbotask/features/reports/presentation/widgets/reports_error_widget.dart';
import 'package:turbotask/features/reports/presentation/widgets/reports_loading_widget.dart';
import 'package:turbotask/features/reports/presentation/widgets/reports_filter_panel.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ReportsBloc>()..add(const ReportsEvent.loadReports()),
      child: const ReportsView(),
    );
  }
}

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Custom App Bar
          ReportsAppBar(
            onFilterToggle: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
            onExportTap: () {
              _showExportDialog(context);
            },
            onRefreshTap: () {
              context.read<ReportsBloc>().add(
                const ReportsEvent.refreshReports(),
              );
            },
          ),

          // Filter Panel (Collapsible)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _showFilters ? 120 : 0,
            child: _showFilters
                ? const ReportsFilterPanel()
                : const SizedBox.shrink(),
          ),

          // Tab Bar
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              tabs: const [
                Tab(icon: Icon(Icons.dashboard_outlined), text: 'Overview'),
                Tab(icon: Icon(Icons.analytics_outlined), text: 'Analysis'),
                Tab(icon: Icon(Icons.compare_arrows), text: 'Compare'),
              ],
            ),
          ),

          // Content
          Expanded(
            child: BlocConsumer<ReportsBloc, ReportsState>(
              listener: (context, state) {
                state.maybeWhen(
                  exportSuccess: (filename, format) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Report exported successfully: $filename',
                        ),
                        backgroundColor: AppColors.success,
                      ),
                    );
                  },
                  exportError: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Export failed: $error'),
                        backgroundColor: AppColors.error,
                      ),
                    );
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => const ReportsLoadingWidget(),
                  loading: () => const ReportsLoadingWidget(),
                  loaded:
                      (
                        overview,
                        filters,
                        comparison,
                        drillDown,
                        isExporting,
                        isRefreshing,
                      ) {
                        return TabBarView(
                          controller: _tabController,
                          children: [
                            // Overview Tab
                            ReportsDashboard(
                              overview: overview,
                              filters: filters,
                              isRefreshing: isRefreshing,
                            ),

                            // Analysis Tab
                            ReportsDashboard(
                              overview: overview,
                              filters: filters,
                              isRefreshing: isRefreshing,
                              showAnalysisView: true,
                            ),

                            // Compare Tab
                            ReportsDashboard(
                              overview: overview,
                              filters: filters,
                              comparison: comparison,
                              isRefreshing: isRefreshing,
                              showComparisonView: true,
                            ),
                          ],
                        );
                      },
                  error: (error, previousData, currentFilters) {
                    return ReportsErrorWidget(
                      error: error,
                      onRetry: () {
                        context.read<ReportsBloc>().add(
                          const ReportsEvent.retryLastAction(),
                        );
                      },
                      previousData: previousData,
                    );
                  },
                  exportSuccess: (filename, format) {
                    // This state is handled by the listener
                    return const ReportsLoadingWidget();
                  },
                  exportError: (error) {
                    // This state is handled by the listener
                    return const ReportsLoadingWidget();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Report'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Choose export format:'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ExportButton(
                  icon: Icons.table_chart,
                  label: 'CSV',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.read<ReportsBloc>().exportAsCsv();
                  },
                ),
                _ExportButton(
                  icon: Icons.picture_as_pdf,
                  label: 'PDF',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.read<ReportsBloc>().exportAsPdf();
                  },
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}

class _ExportButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ExportButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
