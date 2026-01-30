import '../response/tiers_model.dart';

class SelectedTierModel {
  final int lenght;
  final List<MainTiersModel> list;
  final List<MainTiersModel> selectedList;

  const SelectedTierModel({
    required this.lenght,
    required this.list,
    required this.selectedList,
  });
}
