import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/policies/data/models/request/utilization_notification_values.dart';
import 'package:bond/features/policies/data/models/response/notification_value_model.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:bond/features/policies/presentation/cubit/utilization/utilization_notification_data.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/request/utilization_notification_params.dart';

@Injectable()
class UtilizationNotificationCubit
    extends Cubit<BaseState<UtilizationNotificationData>>
    with AsyncHandler<UtilizationNotificationData> {
  final PoliciesRepositoryImpl _policiesRepositoryImpl;

  UtilizationNotificationCubit(this._policiesRepositoryImpl)
    : super(BaseState());

  Future<void> updateUtilizationNotification({
    required UtilizationNotificationValues values,
  }) async {
    handleAsync(
      identifier: "updateUtilizationNotification",
      call: () => _policiesRepositoryImpl.setUtilizationNotification(
        utilizationNotificationValues: values,
      ),
      onSuccess: (data) =>
          (state.data ?? UtilizationNotificationData()).copyWith(msg: data),
    );
  }

  Future<void> getUtilizationNotifications({
    required NotificationValueModel params,
    required num policyId,
  }) async {
    handleAsync(
      identifier: "getUtilizationNotifications",
      call: () => _policiesRepositoryImpl.getUtilizationNotifications(
        params: UtilizationNotificationParams(
          policyId: policyId,
          notificationValueModel: params,
        ),
      ),
      onSuccess: (notifications) =>
          (state.data ?? UtilizationNotificationData()).copyWith(
            notifications: notifications,
          ),
    );
  }

  Future<void> getDeepDiveStudy() async {
    handleAsync(
      identifier: "getDeepDiveStudy",
      call: () => _policiesRepositoryImpl.getDeepStudy(),
      onSuccess: (deepStudy) => (state.data ?? UtilizationNotificationData())
          .copyWith(deepStudy: deepStudy),
    );
  }

  Future<void> getNotificationValues({required num policyId}) async {
    handleAsync(
      identifier: "getNotificationValues",
      call: () =>
          _policiesRepositoryImpl.getNotificationValues(policyId: policyId),
      onSuccess: (data) => (state.data ?? UtilizationNotificationData())
          .copyWith(notificationValueModel: data),
    );
  }

  Future<void> sendDeepDive({
    required num policyId,
    required String message,
  }) async {
    handleAsync(
      identifier: "sendDeepDive",
      call: () => _policiesRepositoryImpl.sendDeepDive(
        policyId: policyId,
        message: message,
      ),
      onSuccess: (_) => state.data ?? UtilizationNotificationData(),
    );
  }
}
