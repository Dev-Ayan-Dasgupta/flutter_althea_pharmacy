import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/analytics_entity.dart';

class EarningsChart extends StatelessWidget {
  final List<DailyEarning> dailyEarnings;

  const EarningsChart({super.key, required this.dailyEarnings});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (dailyEarnings.isEmpty) {
      return _buildEmptyState(isDark);
    }

    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: _calculateInterval(),
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: (isDark ? Colors.white : Colors.black).withValues(
                  alpha: 0.1,
                ),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: _calculateBottomInterval(),
                getTitlesWidget: (value, meta) {
                  if (value.toInt() >= 0 &&
                      value.toInt() < dailyEarnings.length) {
                    final date = dailyEarnings[value.toInt()].date;
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        DateFormat('MMM dd').format(date),
                        style: AppTypography.caption(
                          isDark
                              ? AppColors.textTertiaryDark
                              : AppColors.textTertiaryLight,
                        ),
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                interval: _calculateInterval(),
                getTitlesWidget: (value, meta) {
                  return Text(
                    '₹${(value / 1000).toStringAsFixed(0)}k',
                    style: AppTypography.caption(
                      isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: (dailyEarnings.length - 1).toDouble(),
          minY: 0,
          maxY: _getMaxY(),
          lineBarsData: [
            LineChartBarData(
              spots: dailyEarnings.asMap().entries.map((entry) {
                return FlSpot(entry.key.toDouble(), entry.value.amount);
              }).toList(),
              isCurved: true,
              gradient: AppColors.primaryGradient,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: dailyEarnings.length <= 7,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: AppColors.primaryDark,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryDark.withValues(alpha: 0.3),
                    AppColors.primaryDark.withValues(alpha: 0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) =>
                  isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
              tooltipBorderRadius: BorderRadius.circular(8),
              tooltipPadding: const EdgeInsets.all(8),
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  final date = dailyEarnings[spot.x.toInt()].date;
                  final amount = spot.y;
                  final orders = dailyEarnings[spot.x.toInt()].orderCount;

                  return LineTooltipItem(
                    '${DateFormat('MMM dd').format(date)}\n₹${amount.toStringAsFixed(0)}\n$orders orders',
                    TextStyle(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.show_chart,
              size: 48,
              color:
                  (isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight)
                      .withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No data available',
              style: AppTypography.bodyMedium(
                isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getMaxY() {
    if (dailyEarnings.isEmpty) return 10000;
    final maxAmount = dailyEarnings
        .map((e) => e.amount)
        .reduce((a, b) => a > b ? a : b);
    return (maxAmount * 1.2).ceilToDouble();
  }

  double _calculateInterval() {
    final maxY = _getMaxY();
    return (maxY / 5).ceilToDouble();
  }

  double _calculateBottomInterval() {
    if (dailyEarnings.length <= 7) return 1;
    if (dailyEarnings.length <= 14) return 2;
    if (dailyEarnings.length <= 30) return 5;
    return 7;
  }
}
