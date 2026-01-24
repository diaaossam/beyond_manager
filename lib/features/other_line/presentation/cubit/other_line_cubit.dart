import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/other_line/data/models/template_model.dart';
import 'package:bond/features/other_line/data/repositories/other_line_repository_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtherLineCubit extends Cubit<BaseState<List<TemplateModel>>>
    with AsyncHandler<List<TemplateModel>> {
  final OtherLineRepositoryImpl otherLineRepositoryImpl;

  OtherLineCubit(this.otherLineRepositoryImpl) : super(BaseState());

  Future<void> getOtherLineTemplates() async {
    handleAsync(
      call: () => otherLineRepositoryImpl.getOtherLineTemplates(),
      onSuccess: (data) => data,
    );
  }
}
