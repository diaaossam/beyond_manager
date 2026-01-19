import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:injectable/injectable.dart';

part 'terms_state.dart';

@injectable
class TermsCubit extends Cubit<BaseState<String>>
    with AsyncHandler<String> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  TermsCubit(this.policiesRepositoryImpl) : super(BaseState()) {
    getTerms();
  }

  Future<void> getTerms() async {
    await handleAsync(
      call: () => policiesRepositoryImpl.getTerms(),
      onSuccess: (data) => data,
      identifier: 'get_terms',
    );
  }
}
