import 'package:bond/features/sick_leave/data/models/sick_leave_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

class DiagnosisByDaysChart extends StatelessWidget {
  final Animation<double> animation;
  final List<Top5DiagnosisByDays> data;

  const DiagnosisByDaysChart({
    super.key,
    required this.animation,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final dataList = data;
    final double maxY = dataList.isEmpty
        ? 0
        : dataList.map((d) => (d.totalDays ?? 0).toDouble()).reduce(math.max) + 1;
    
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
            'Top 5 Diagnosis by Total Days',
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
                return BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: maxY,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final item = dataList[group.x.toInt()];
                          return BarTooltipItem(
                            '${item.diagnosisName}\n',
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Days: ${item.totalDays}\n',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'Count: ${item.count}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 45,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            if (value.toInt() >= 0 && value.toInt() < dataList.length) {
                              final diagnosisName = dataList[value.toInt()].diagnosisName ?? '';
                              // Truncate long names
                              final displayName = diagnosisName.length > 12 
                                  ? '${diagnosisName.substring(0, 12)}...' 
                                  : diagnosisName;
                              return SideTitleWidget(
                                space: 16,
                                meta: meta,
                                child: Transform.rotate(
                                  angle: -0.5,
                                  child: Text(
                                    displayName,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
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
                          reservedSize: 40,
                          interval: interval,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            if (value == 0) {
                              return const Text(
                                '0',
                                style: TextStyle(
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
                            toY: ((item.totalDays ?? 0).toDouble() * animation.value),
                            color: Color.lerp(
                              const Color(0xFF9C27B0),
                              const Color(0xFF4A148C),
                              dataList.length > 1 ? index / (dataList.length - 1) : 0,
                            )!,
                            width: 30,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
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
