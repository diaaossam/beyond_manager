part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class ChangeCurrentIndexState extends MainState {
  final int index;
  final bool isEmergency;

  const ChangeCurrentIndexState(
      {required this.index, this.isEmergency = false});

  @override
  List<Object> get props => [index,isEmergency];
}

class ChangeHomeSliderIndexState extends MainState {
  final int index;

  const ChangeHomeSliderIndexState(this.index);

  @override
  List<Object> get props => [index];
}
