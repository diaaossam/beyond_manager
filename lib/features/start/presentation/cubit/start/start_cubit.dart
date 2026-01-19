import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/base_state.dart';
import '../../../data/repositories/init_repo_impl.dart';

@Injectable()
class StartCubit extends Cubit<BaseState<PageRouteInfo>> {
  final InitRepo initRepo;

  StartCubit(this.initRepo) : super(BaseState.initial()) {
    _initializeApp();
  }

  /// Initialize the app when connected
  Future<void> _initializeApp() async {
    emit(state.loading());
    final response = await initRepo.initApp();
    response.fold(
      (failure) => emit(state.failure(failure)),
      (data) => emit(state.success(data: data)),
    );
  }
}
