import 'package:bond/features/sick_leave/data/models/sick_leave_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

class TrendsChart extends StatelessWidget {
  final Animation<double> animation;
  final List<SickLeaveAnalytic> data;

  const TrendsChart({
    super.key,
    required this.animation,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    // Use the same data as company analytics for the trends chart
    final monthsData = data;
    final double maxY = monthsData.isEmpty
        ? 0
        : (monthsData.map((d) => (d.numOfRequests ?? 0).toDouble()).reduce(math.max).toDouble()) + 1;
    
    // Calculate a proper interval to avoid overlapping labels
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
            'Monthly Sick Leave Request Trends',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: interval,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.2),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          reservedSize: 45,
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            const style = TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            final index = value.toInt();
                            if (index >= 0 && index < monthsData.length) {
                              return SideTitleWidget(
                                space: 16,
                                meta: meta,
                                child: Transform.rotate(
                                    angle: 12,
                                    child: Text(monthsData[index].month ?? '', style: style)),
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
                    minY: 0,
                    maxY: maxY,
                    lineBarsData: [
                      LineChartBarData(
                        spots: monthsData.asMap().entries.map((entry) {
                          final idx = entry.key;
                          final month = entry.value;
                          return FlSpot(
                            idx.toDouble(),
                            (month.numOfRequests ?? 0).toDouble() * animation.value,
                          );
                        }).toList(),
                        isCurved: true,
                        color: const Color(0xFFF08040),
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 4,
                              color: const Color(0xFFF08040),
                              strokeWidth: 2,
                              strokeColor: Colors.white,
                            );
                          },
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          color: const Color(0xFFF08040).withOpacity(0.1),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
