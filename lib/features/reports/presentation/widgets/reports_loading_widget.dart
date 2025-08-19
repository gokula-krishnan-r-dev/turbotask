import 'package:flutter/material.dart';
import 'package:turbotask/core/theme/app_colors.dart';

class ReportsLoadingWidget extends StatelessWidget {
  const ReportsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Metrics Cards Loading
          _buildMetricsLoading(),

          const SizedBox(height: 24),

          // Charts Loading
          Expanded(
            child: Row(
              children: [
                // Left side - Chart placeholders
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _buildChartLoading(height: 300),
                      const SizedBox(height: 16),
                      _buildChartLoading(height: 200),
                    ],
                  ),
                ),

                const SizedBox(width: 24),

                // Right side - Stats placeholders
                Expanded(
                  child: Column(
                    children: [
                      _buildStatsLoading(),
                      const SizedBox(height: 16),
                      _buildListLoading(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsLoading() {
    return Row(
      children: List.generate(6, (index) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: index < 5 ? 16 : 0),
            child: _buildShimmerCard(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerBar(width: 80, height: 16),
                  const SizedBox(height: 12),
                  _buildShimmerBar(width: 60, height: 24),
                  const SizedBox(height: 8),
                  _buildShimmerBar(width: 40, height: 12),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildChartLoading({required double height}) {
    return _buildShimmerCard(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerBar(width: 150, height: 20),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                return _buildShimmerBar(
                  width: 30,
                  height: (height - 60) * (0.3 + (index % 4) * 0.2),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsLoading() {
    return _buildShimmerCard(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerBar(width: 120, height: 20),
          const SizedBox(height: 16),
          // Pie chart placeholder
          Expanded(
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Legend placeholders
          ...List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildShimmerBar(width: 60, height: 12),
                  const Spacer(),
                  _buildShimmerBar(width: 30, height: 12),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildListLoading() {
    return _buildShimmerCard(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerBar(width: 100, height: 20),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildShimmerBar(width: double.infinity, height: 14),
                          const SizedBox(height: 4),
                          _buildShimmerBar(width: 80, height: 12),
                        ],
                      ),
                    ),
                    _buildShimmerBar(width: 40, height: 12),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerCard({required double height, required Widget child}) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(20),
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
      child: child,
    );
  }

  Widget _buildShimmerBar({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const _ShimmerEffect(),
    );
  }
}

class _ShimmerEffect extends StatefulWidget {
  const _ShimmerEffect();

  @override
  State<_ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<_ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.background,
                AppColors.background.withOpacity(0.5),
                AppColors.background,
              ],
              stops: [
                _animation.value - 0.3,
                _animation.value,
                _animation.value + 0.3,
              ].map((stop) => stop.clamp(0.0, 1.0)).toList(),
            ),
          ),
        );
      },
    );
  }
}
