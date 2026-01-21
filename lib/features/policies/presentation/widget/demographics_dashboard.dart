import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/policies/data/models/response/active_list_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../cubit/active_policy/active_policy_bloc.dart';

class DemographicsDashboard extends StatefulWidget {
  const DemographicsDashboard({super.key});

  @override
  State<DemographicsDashboard> createState() => _DemographicsDashboardState();
}

class _DemographicsDashboardState extends State<DemographicsDashboard>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _chartController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _chartAnimation;

  bool _showChart = false;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _chartController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _chartAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _chartController, curve: Curves.easeInOut),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    _fadeController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _scaleController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      _showChart = true;
    });
    _chartController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _chartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivePolicyCubit, BaseState<ActiveListModel>>(
      builder: (context, state) {
        return state.builder(
          onSuccess: (data) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDemographicsOverview(model: data.statistics!),
                SizedBox(height: SizeConfig.screenWidth * 0.06),
                _buildGenderDistribution(model: data.statistics!),
                SizedBox(height: SizeConfig.screenWidth * 0.06),
                _buildAverageAgeComparison(model: data.statistics!),
                SizedBox(height: SizeConfig.screenWidth * 0.06),
                _buildMonthlyTrend(model: data.statistics!),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDemographicsOverview({required Statistics model}) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.screenWidth * 0.02,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      color: context.colorScheme.shadow,
                      size: 20,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.02),
                    AppText(
                      text: context.localizations.demographicsOverview,
                      fontWeight: FontWeight.w600,
                      textSize: 18,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.06),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        title: context.localizations.avgAge,
                        value:
                            model.ageStatistics?.avgAge?.toStringAsFixed(1) ??
                            "0",
                        delay: 0,
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.04),
                    Expanded(
                      child: _buildStatCard(
                        title: context.localizations.employees,
                        value: model.employee?.toString() ?? "0",
                        delay: 200,
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.04),
                    Expanded(
                      child: _buildStatCard(
                        title: context.localizations.familyMembers,
                        value: model.familyMembers?.toString() ?? "0",
                        delay: 400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required int delay,
  }) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.screenWidth * 0.04,
            ),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: context.colorScheme.outline, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  text: value,
                  fontWeight: FontWeight.bold,
                  textSize: 22,
                  align: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.01),
                AppText(
                  text: title,
                  fontWeight: FontWeight.w400,
                  textSize: 12,
                  color: context.colorScheme.shadow,
                  align: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGenderDistribution({required Statistics model}) {
    return AnimatedBuilder(
      animation: _chartAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _chartAnimation.value,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: context.localizations.genderDistribution,
                  fontWeight: FontWeight.w600,
                  textSize: 16,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.06),

                // Gender bars
                _buildGenderBar(
                  context.localizations.male,
                  model.genderDistribution?.male?.toInt() ?? 0,
                  Colors.blue,
                  _chartAnimation.value,
                  model.totalMembers?.toInt() ?? 1,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.04),
                _buildGenderBar(
                  context.localizations.female,
                  model.genderDistribution?.female?.toInt() ?? 0,
                  Colors.pink,
                  _chartAnimation.value,
                  model.totalMembers?.toInt() ?? 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGenderBar(
    String label,
    int count,
    Color color,
    double animationValue,
    int totalMembers,
  ) {
    double maxWidth = SizeConfig.screenWidth * 0.6;
    double barWidth = totalMembers > 0
        ? (count / totalMembers) * maxWidth * animationValue
        : 0;

    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: SizeConfig.screenWidth * 0.02),
        SizedBox(
          width: SizeConfig.screenWidth * 0.15,
          child: AppText(
            text: label,
            fontWeight: FontWeight.w500,
            textSize: 14,
          ),
        ),
        SizedBox(width: SizeConfig.screenWidth * 0.04),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: context.colorScheme.outline,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              AnimatedContainer(
                duration: Duration(
                  milliseconds: (800 * animationValue).round(),
                ),
                width: barWidth,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: SizeConfig.screenWidth * 0.02),
        AppText(
          text: count.toString(),
          fontWeight: FontWeight.w600,
          textSize: 14,
        ),
      ],
    );
  }

  Widget _buildAverageAgeComparison({required Statistics model}) {
    return AnimatedBuilder(
      animation: _chartAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _chartAnimation.value,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.people_outline,
                      color: context.colorScheme.shadow,
                      size: 20,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.02),
                    AppText(
                      text: context.localizations.averageAgeComparison,
                      fontWeight: FontWeight.w600,
                      textSize: 16,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.06),
                _buildAgeComparisonSection(
                  context.localizations.activeVsAdditions,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.04),
                _buildAgeRow(
                  context.localizations.activeMembers,
                  "${model.ageStatistics?.avgAge?.toStringAsFixed(1) ?? '0'} ${context.localizations.years}",
                  Colors.blue,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.02),
                _buildAgeRow(
                  context.localizations.additions,
                  "${model.ageStatistics?.additionsAgeAverage?.toStringAsFixed(1) ?? '0'} ${context.localizations.years}",
                  Colors.green,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.06),
                _buildAgeComparisonSection(
                  context.localizations.activeVsDeletions,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.04),
                _buildAgeRow(
                  context.localizations.activeMembers,
                  "${model.ageStatistics?.avgAge?.toStringAsFixed(1) ?? '0'} ${context.localizations.years}",
                  Colors.blue,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.02),
                _buildAgeRow(
                  context.localizations.deletions,
                  "${model.ageStatistics?.deletionsAgeAverage?.toStringAsFixed(1) ?? '0'} ${context.localizations.years}",
                  Colors.red,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAverageData({required Statistics model}) {
    return AnimatedBuilder(
      animation: _chartAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _chartAnimation.value,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.person_3_fill,
                      color: context.colorScheme.shadow,
                      size: 20,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.02),
                    AppText(
                      text: context.localizations.memberStatistics,
                      fontWeight: FontWeight.w600,
                      textSize: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.06),
                _buildAgeRow(
                  context.localizations.totalMembers,
                  model.totalMembersIncludingDeleted.toString(),
                  Colors.blue,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.02),
                _buildAgeRow(
                  context.localizations.activeMember,
                  model.totalMembers.toString(),
                  Colors.green,
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.02),
                _buildAgeRow(
                  context.localizations.deletion,
                  ((model.statusBreakdown?.underDeletion ?? 0) +
                          (model.statusBreakdown?.deleted ?? 0))
                      .toString(),
                  Colors.red,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAgeComparisonSection(String title) {
    return AppText(
      text: title,
      fontWeight: FontWeight.w500,
      textSize: 14,
      color: Colors.black,
    );
  }

  Widget _buildAgeRow(String label, String age, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: label,
          fontWeight: FontWeight.w400,
          textSize: 14,
          color: context.colorScheme.shadow,
        ),
        AppText(
          text: age,
          fontWeight: FontWeight.w600,
          textSize: 14,
          color: color,
        ),
      ],
    );
  }

  Widget _buildMonthlyTrend({required Statistics model}) {
    return AnimatedBuilder(
      animation: _chartAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _chartAnimation.value,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.trending_up,
                      color: context.colorScheme.shadow,
                      size: 20,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.02),
                    AppText(
                      text: context.localizations.monthlyTrend,
                      fontWeight: FontWeight.w600,
                      textSize: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenWidth * 0.06),

                // Chart
                if (_showChart)
                  SizedBox(
                    height: SizeConfig.bodyHeight * 0.3,
                    child: LineChart(
                      _buildLineChartData(model.monthlyTrend ?? []),
                    ),
                  ),
                SizedBox(height: SizeConfig.screenWidth * 0.04),

                // Legend
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLegendItem(
                      context.localizations.additions,
                      Colors.green,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.06),
                    _buildLegendItem(
                      context.localizations.deletions,
                      Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 3,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: SizeConfig.screenWidth * 0.02),
        AppText(
          text: label,
          fontWeight: FontWeight.w500,
          textSize: 12,
          color: context.colorScheme.shadow,
        ),
      ],
    );
  }

  LineBarSpot? _lastTouchedSpot;

  LineChartData _buildLineChartData(List<MonthlyTrend> monthlyTrend) {
    List<FlSpot> additionsSpots = [];
    List<FlSpot> deletionsSpots = [];
    List<String> monthLabels = [];
    final dataToShow = monthlyTrend;

    for (int i = 0; i < dataToShow.length; i++) {
      final trend = dataToShow[i];
      additionsSpots.add(
        FlSpot(i.toDouble(), trend.additions?.toDouble() ?? 0),
      );
      deletionsSpots.add(
        FlSpot(i.toDouble(), trend.deletions?.toDouble() ?? 0),
      );
      String monthName1 = trend.name?.split(' ').first ?? 'N/A';
      String monthName2 = trend.name?.split(' ')[1] ?? "";
      String monthName = "$monthName1\n ${monthName2}";
      monthLabels.add(monthName);
    }

    // Calculate max Y value for better scaling
    double maxY = 0;
    for (final spot in [...additionsSpots, ...deletionsSpots]) {
      if (spot.y > maxY) maxY = spot.y;
    }
    maxY = maxY < 10 ? 10 : maxY + 5; // Ensure minimum scale

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: maxY / 5,
        getDrawingHorizontalLine: (value) {
          return FlLine(color: context.colorScheme.outline, strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 45,
            interval: 1,
            getTitlesWidget: (double value, TitleMeta meta) {
              if (value.toInt() >= 0 && value.toInt() < monthLabels.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Transform.rotate(
                    angle: 1,
                    child: AppText(
                      text: monthLabels[value.toInt()],
                      textSize: 12,
                      color: context.colorScheme.shadow,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: maxY / 5,
            reservedSize: 32,
            getTitlesWidget: (double value, TitleMeta meta) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: AppText(
                  text: value.toInt().toString(),
                  textSize: 10,
                  color: context.colorScheme.shadow,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: (dataToShow.length - 1).toDouble(),
      minY: 0,
      maxY: maxY,
      lineBarsData: [
        // Additions line (green)
        LineChartBarData(
          spots: additionsSpots,
          isCurved: true,
          color: Colors.green,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 4,
                color: Colors.green,
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(show: false),
        ),
        // Deletions line (red)
        LineChartBarData(
          spots: deletionsSpots,
          isCurved: true,
          color: Colors.red,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 4,
                color: Colors.red,
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(show: false),
        ),
      ],

      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBorderRadius: BorderRadius.circular(9),
          getTooltipColor: (touchedSpot) => Colors.white.withValues(alpha: 0.9),
        ),
        touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
          if (!event.isInterestedForInteractions ||
              response == null ||
              response.lineBarSpots == null) {
            return;
          }

          final spot = response.lineBarSpots!.first;
          setState(() {
            _lastTouchedSpot = spot; // خزِّن آخر نقطة
          });

          // خلي التولتيب يختفي بعد 2 ثانية
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _lastTouchedSpot = null;
              });
            }
          });
        },
      ),
    );
  }
}
