import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/other_line/data/repositories/other_line_repository_impl.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/helper/async_handler.dart';
import 'other_line_state.dart';

@injectable
class OtherLineCubit extends Cubit<BaseState<OtherLineStateData>>
    with AsyncHandler<OtherLineStateData> {
  final OtherLineRepositoryImpl otherLineRepositoryImpl;

  OtherLineCubit(this.otherLineRepositoryImpl) : super(BaseState());

  Future<void> getOtherLineTemplates() async {
    handleAsync(
      call: () => otherLineRepositoryImpl.getOtherLineTemplates(),
      onSuccess: (data) =>
          (state.data ?? OtherLineStateData()).copyWith(templates: data),
    );
  }

  Future<void> getTopRecommendation() async {
    handleAsync(
      call: () => otherLineRepositoryImpl.getTopRecommended(),
      onSuccess: (data) =>
          (state.data ?? OtherLineStateData()).copyWith(recommendedModel: data),
    );
  }
}
