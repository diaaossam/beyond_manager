import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';

import '../../data/models/recommended_product_model.dart';
import '../widgets/product_benefits_dialog.dart';

@RoutePage()
class InsuranceProductsScreen extends StatefulWidget {
  final String industryName;
  final int productsCount;

  const InsuranceProductsScreen({
    super.key,
    this.industryName = 'Healthcare',
    this.productsCount = 10,
  });

  @override
  State<InsuranceProductsScreen> createState() => _InsuranceProductsScreenState();
}

class _InsuranceProductsScreenState extends State<InsuranceProductsScreen> {
  MatchLevel? _selectedFilter;
  late List<RecommendedProductModel> _allProducts;
  static const Color _highColor = Color(0xFFE85D04);
  static const Color _mediumColor = Color(0xFF16A34A);
  static const Color _lowColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _allProducts = _defaultProducts();
  }

  List<RecommendedProductModel> _defaultProducts() {
    return [
      const RecommendedProductModel(
        name: 'Property All Risk',
        matchLevel: MatchLevel.high,
        description:
            'Comprehensive coverage for property damage from various risks including fire, theft, and natural disasters.',
      ),
      const RecommendedProductModel(
        name: 'Machinery Breakdown',
        matchLevel: MatchLevel.high,
        description:
            'Protects against the cost of repairing or replacing machinery that breaks down unexpectedly.',
      ),
      const RecommendedProductModel(
        name: 'Deterioration of Stock',
        matchLevel: MatchLevel.high,
        description:
            'Covers loss or damage to stock due to breakdown of refrigeration or cooling equipment.',
      ),
      const RecommendedProductModel(
        name: 'Cyber Insurance',
        matchLevel: MatchLevel.high,
        description:
            'Protects your business from cyber threats, data breaches, and related liabilities.',
      ),
      const RecommendedProductModel(
        name: 'Professional Indemnity',
        matchLevel: MatchLevel.medium,
        description:
            'It protects you and your employees financially against clients that can sue you for your work.',
      ),
      const RecommendedProductModel(
        name: 'Fire',
        matchLevel: MatchLevel.medium,
        description:
            'Covers damage to property and assets caused by fire and related perils.',
      ),
      const RecommendedProductModel(
        name: 'Cash in transit',
        matchLevel: MatchLevel.medium,
        description:
            'Protects cash and valuables while being transported between locations.',
      ),
    ];
  }

  List<RecommendedProductModel> get _filteredProducts {
    if (_selectedFilter == null) return _allProducts;
    return _allProducts.where((p) => p.matchLevel == _selectedFilter!).toList();
  }

  Color _matchColor(MatchLevel level) {
    switch (level) {
      case MatchLevel.high:
        return _highColor;
      case MatchLevel.medium:
        return _mediumColor;
      case MatchLevel.low:
        return _lowColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.insuranceProducts),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            _buildIndustryCard(context),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            _buildMatchLegend(context),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText(
              text: context.localizations.insuranceProducts,
              fontWeight: FontWeight.w700,
              textSize: 16,
              color: context.colorScheme.onSurface,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
            _buildFilterChips(context),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            ..._filteredProducts.map((product) => _buildProductCard(context, product)),
            SizedBox(height: SizeConfig.bodyHeight * .03),
          ],
        ),
      ),
    );
  }

  Widget _buildIndustryCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.shield_outlined,
              size: 28,
              color: context.colorScheme.primary,
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * .04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: context.localizations.yourIndustry,
                  textSize: 12,
                  color: context.colorScheme.shadow,
                ),
                AppText(
                  text: widget.industryName,
                  textSize: 16,
                  fontWeight: FontWeight.w700,
                  color: context.colorScheme.onSurface,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                text: '${widget.productsCount}',
                textSize: 22,
                fontWeight: FontWeight.w700,
                color: _highColor,
              ),
              AppText(
                text: context.localizations.productsAvailable,
                textSize: 11,
                color: context.colorScheme.shadow,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMatchLegend(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .03,
        vertical: SizeConfig.bodyHeight * .015,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _legendItem(context, _highColor, context.localizations.highMatch70),
          _legendItem(context, _mediumColor, context.localizations.mediumMatch40),
          _legendItem(context, _lowColor, context.localizations.lowMatchBelow40),
        ],
      ),
    );
  }

  Widget _legendItem(BuildContext context, Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: SizeConfig.screenWidth * .02),
        AppText(
          text: label,
          textSize: 11,
          color: context.colorScheme.onSurface,
        ),
      ],
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _filterChip(context, null, context.localizations.allProducts),
          SizedBox(width: SizeConfig.screenWidth * .02),
          _filterChip(context, MatchLevel.high, context.localizations.highMatch),
          SizedBox(width: SizeConfig.screenWidth * .02),
          _filterChip(context, MatchLevel.medium, context.localizations.mediumMatch),
          SizedBox(width: SizeConfig.screenWidth * .02),
          _filterChip(context, MatchLevel.low, context.localizations.lowMatch),
        ],
      ),
    );
  }

  Widget _filterChip(BuildContext context, MatchLevel? level, String label) {
    final isSelected = _selectedFilter == level;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => setState(() => _selectedFilter = level),
      selectedColor: _highColor,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : context.colorScheme.onSurface,
        fontSize: 12,
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, RecommendedProductModel product) {
    final matchColor = _matchColor(product.matchLevel);

    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .015),
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => ProductBenefitsDialog.show(
          context,
          product: product,
          onGetQuote: () {
            // Navigate to quote/insurance flow if needed
          },
        ),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.shield_outlined,
                    size: 24,
                    color: context.colorScheme.primary,
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * .03),
                Expanded(
                  child: AppText(
                    text: product.name,
                    fontWeight: FontWeight.w700,
                    textSize: 14,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: matchColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppText(
                    text: product.matchLabel,
                    textSize: 12,
                    fontWeight: FontWeight.w600,
                    color: matchColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .008),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth * .03 + 24 + 12),
              child: InkWell(
                onTap: () => ProductBenefitsDialog.show(
                  context,
                  product: product,
                ),
                child: Row(
                  children: [
                    AppText(
                      text: context.localizations.showProductBenefits,
                      textSize: 12,
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: context.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
