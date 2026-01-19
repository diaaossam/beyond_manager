import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/settings/data/repositories/settings_repo_impl.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class TermsCubit extends Cubit<BaseState<String>> with AsyncHandler<String> {
  final SettingsRepositoryImpl settingsRepositoryImpl;

  TermsCubit(this.settingsRepositoryImpl) : super(BaseState());

  Future<void> getTerms() async {
    handleAsync(
      call: () => settingsRepositoryImpl.getTerms(),
      onSuccess: (data) => data,
    );
  }
}
