part of 'policies_cubit.dart';

class PoliciesState extends Equatable {
  final String? selectedState;

  const PoliciesState({this.selectedState});

  @override
  List<Object?> get props => [selectedState];
}