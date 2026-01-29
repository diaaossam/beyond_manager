import 'package:bond/features/sick_leave/data/models/sick_leave_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

class CompanyAnalyticsChart extends StatelessWidget {
  final Animation<double> animation;
  final List<SickLeaveAnalytic> data;

  const CompanyAnalyticsChart({
    super.key,
    required this.animation,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final dataList = data;
    final double maxY = dataList.isEmpty
        ? 0
        : (dataList
                .map((d) => math.max(d.numOfRequests ?? 0, d.totalSavedDays ?? 0))
                .reduce(math.max)
                .toDouble()) +
            1;
    
    final double interval = maxY > 10 ? (maxY / 5).ceilToDouble() : (maxY > 5 ? 2 : 1);
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Company Sick Leave Analytics',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Comprehensive insights and trends analysis',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Key Metrics Overview',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: maxY,
                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 45,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            const style = TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            final int index = value.toInt();
                            if (index >= 0 && index < dataList.length) {
                              return SideTitleWidget(
                                space: 16,
                                meta: meta,
                                child: Transform.rotate(
                                    angle: 12,
                                    child: Text(dataList[index].month ?? '', style: style)),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          interval: interval,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            if (value == 0) {
                              return Text(
                                '0',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              );
                            }
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: dataList.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: ((item.numOfRequests ?? 0).toDouble() * animation.value),
                            color: const Color(0xFFF08040),
                            width: 20,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                          BarChartRodData(
                            toY: ((item.totalSavedDays ?? 0).toDouble() * animation.value),
                            color: const Color(0xFF66BB6A),
                            width: 20,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                        ],
                        barsSpace: 4,
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem('Total Requests', const Color(0xFFF08040)),
              const SizedBox(width: 24),
              _buildLegendItem('Total Saved Days', const Color(0xFF66BB6A)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
