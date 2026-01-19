import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/models/response/user_model_helper.dart';
import '../../../auth/data/repositories/auth_repo_impl.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final AuthRepository authRepository;

  MainCubit(this.authRepository) : super(MainInitial()) {
    if (UserDataService().getUserData() != null) {
      authRepository.updateFcm();
    }
  }
}
