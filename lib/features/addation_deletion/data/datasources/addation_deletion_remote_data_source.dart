import 'package:bond/features/addation_deletion/data/models/relationship_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../../../policies/data/models/request/get_active_list_params.dart';
import '../models/deletion_response_model.dart';
import '../models/manual_entry_params.dart';

abstract class AddationDeletionRemoteDataSource {
  Future<List<RelationshipModel>> getRelationships();

  Future<String> submitMembers(List<MemberFormData> members);

  Future<DeletionResponseModel> fetchDeletionMembers({
    required ActiveListParams params,
  });
}

@LazySingleton(as: AddationDeletionRemoteDataSource)
class AddationDeletionRemoteDataSourceImpl
    implements AddationDeletionRemoteDataSource {
  final DioConsumer dioConsumer;

  AddationDeletionRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<RelationshipModel>> getRelationships() async {
    return await dioConsumer
        .get(EndPoints.getRelation)
        .factory((json) => RelationshipModel.fromJsonList(json['result']))
        .execute();
  }

  @override
  Future<String> submitMembers(List<MemberFormData> members) async {
    final List<num> policesId = (members.first.policies ?? [])
        .map<num>((e) => e.policyId ?? 0)
        .toList();

    // Convert all members to JSON
    final List<Map<String, dynamic>> membersJson = [];
    for (var member in members) {
      membersJson.add(await member.toJson());
    }

    return await dioConsumer
        .post(EndPoints.submitMembers)
        .body({"members": membersJson})
        .params({
          'policies': policesId,
          "name": "Ticket_${DateTime.now.toString()}",
          "ticket_type": 'Addition and Deletion',
        })
        .factory((json) => json['result']['message'])
        .execute();
  }

  @override
  Future<DeletionResponseModel> fetchDeletionMembers({
    required ActiveListParams params,
  }) async {
    return await dioConsumer
        .get(EndPoints.deletionMember)
        .params(params.toJson())
        .factory((json) async => DeletionResponseModel.fromJson(json))
        .execute();
  }
}
