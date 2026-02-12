enum MatchLevel { high, medium, low }

class RecommendedProductModel {
  final String name;
  final MatchLevel matchLevel;
  final String description;

  const RecommendedProductModel({
    required this.name,
    required this.matchLevel,
    required this.description,
  });

  String get matchLabel {
    switch (matchLevel) {
      case MatchLevel.high:
        return 'High';
      case MatchLevel.medium:
        return 'Medium';
      case MatchLevel.low:
        return 'Low';
    }
  }
}
