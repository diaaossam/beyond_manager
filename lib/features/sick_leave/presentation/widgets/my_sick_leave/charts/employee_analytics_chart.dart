import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/sick_leave/data/models/sick_leave_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

class EmployeeAnalyticsChart extends StatelessWidget {
  final Animation<double> animation;
  final List<Top5EmployeeRequests> data;

  const EmployeeAnalyticsChart({
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
                .map((d) => math.max((d.requestedDays ?? 0).toDouble(), 
                    math.max((d.approvedDays ?? 0).toDouble(), (d.totalRequests ?? 0).toDouble())))
                .reduce(math.max)
                .toDouble()) +
            1;
    
    // Calculate a proper interval to avoid overlapping labels
    final double interval = maxY > 10 ? (maxY / 5).ceilToDouble() : (maxY > 5 ? 2 : 1);
    return Container(
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
            'Top 5 Employees by Sick Leave Monthly Requests',
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
                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 70,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            if (value.toInt() >= 0 && value.toInt() < dataList.length) {
                              final name = dataList[value.toInt()].name ?? '';
                              // Truncate long names
                              final displayName = name.length > 10 ? '${name.substring(0, 10)}...' : name;
                              return SideTitleWidget(
                                space: 8,
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
                            toY: ((item.requestedDays ?? 0).toDouble() * animation.value),
                            color: const Color(0xFFFFD54F),
                            width: 16,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                          BarChartRodData(
                            toY: ((item.approvedDays ?? 0).toDouble() * animation.value),
                            color: const Color(0xFFEF5350),
                            width: 16,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                          BarChartRodData(
                            toY: (((item.requestedDays??0)-(item.approvedDays??0)).toDouble() * animation.value),
                            color: const Color(0xFF66BB6A),
                            width: 16,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                          ),
                        ],
                        barsSpace: 2,
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendItem('Requested Days', const Color(0xFFFFD54F)),
                  const SizedBox(width: 16),
                  _buildLegendItem('Approved Days', const Color(0xFFEF5350)),
                  const SizedBox(width: 16),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight*.02,),
              _buildLegendItem('Saved Days After Requests Approval', const Color(0xFF66BB6A)),
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
