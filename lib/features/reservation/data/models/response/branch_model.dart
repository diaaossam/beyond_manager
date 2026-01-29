import 'package:equatable/equatable.dart';

class BranchModel extends Equatable {
  final int id;
  final String name;

  const BranchModel({required this.name, required this.id});

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      name: json['name'] as String,
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }

  @override
  List<Object> get props => [name, id];
}
