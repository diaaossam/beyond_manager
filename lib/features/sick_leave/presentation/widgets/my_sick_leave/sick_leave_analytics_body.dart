import 'package:bond/features/sick_leave/data/models/sick_leave_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'charts/company_analytics_chart.dart';
import 'charts/employee_analytics_chart.dart';
import 'charts/trends_chart.dart';
import 'charts/diagnosis_chart.dart';

class SickLeaveAnalyticsBody extends StatefulWidget {
  final SickLeaveAnalytics analytics;
  
  const SickLeaveAnalyticsBody({super.key, required this.analytics});

  @override
  State<SickLeaveAnalyticsBody> createState() => _SickLeaveAnalyticsBodyState();
}

class _SickLeaveAnalyticsBodyState extends State<SickLeaveAnalyticsBody>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CompanyAnalyticsChart(
            animation: _animation,
            data: widget.analytics.sickLeaveAnalytic ?? [],
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 100.ms)
              .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),

          const SizedBox(height: 24),

          // Employee Analytics Chart
          EmployeeAnalyticsChart(
            animation: _animation,
            data: widget.analytics.top5EmployeeRequests ?? [],
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),

          const SizedBox(height: 24),

          // Trends Chart
          TrendsChart(
            animation: _animation,
            data: widget.analytics.keyMetricsOverviewAnalytic ?? [],
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 300.ms)
              .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),

          const SizedBox(height: 24),

          // Diagnosis Chart
          DiagnosisChart(
            animation: _animation,
            data: widget.analytics.top5Diagnosis ?? [],
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 400.ms)
              .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
        ],
      ),
    );
  }
}
