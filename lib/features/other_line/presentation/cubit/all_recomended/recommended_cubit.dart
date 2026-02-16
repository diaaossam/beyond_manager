import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/other_line/data/repositories/other_line_repository_impl.dart';
import 'package:bond/features/other_line/presentation/cubit/all_recomended/recommendation_data.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/enum/recommendation_status.dart';

@Injectable()
class RecommendedCubit extends Cubit<BaseState<RecommendationData>>
    with AsyncHandler<RecommendationData> {
  final OtherLineRepositoryImpl otherLineRepositoryImpl;

  RecommendedCubit(this.otherLineRepositoryImpl)
    : super(BaseState(data: RecommendationData()));

  Future<void> getAllRecommended({
    required MatchLevelEnum matchLevelEnum,
  }) async {
    handleAsync(
      identifier: "getAllRecommended",
      call: () => otherLineRepositoryImpl.getAllRecommended(
        matchLevelEnum: matchLevelEnum,
      ),
      onSuccess: (data) => (state.data ?? RecommendationData()).copyWith(
        recommendedMainModel: data,
      ),
    );
  }

  Future<void> createCrmLead({required num id}) async {
    handleAsync(
      identifier: "createCrmLead",
      call: () => otherLineRepositoryImpl.createCrmLead(recommendationId: id),
      onSuccess: (data) =>
          (state.data ?? RecommendationData()).copyWith(crmLeadResponse: data),
    );
  }
}
