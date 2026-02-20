import 'package:bond/features/addation_deletion/data/models/response/relationship_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../../../policies/data/models/request/get_active_list_params.dart';
import '../models/request/policies_branches_params.dart';
import '../models/request/policies_data_params.dart';
import '../models/request/ticket_params.dart';
import '../models/response/addition_deletion_ticket.dart';
import '../models/response/branch_response.dart';
import '../models/response/deletion_response_model.dart';
import '../models/response/manual_entry_params.dart';
import '../models/response/policies_data_addation.dart';

abstract class AddationDeletionRemoteDataSource {
  Future<List<RelationshipModel>> getRelationships();

  Future<String> submitMembers(List<MemberFormData> members);

  Future<DeletionResponseModel> fetchDeletionMembers({
    required ActiveListParams params,
  });

  Future<PoliciesDataAddation> fetchPoliciesData({
    required PoliciesDataParams policies,
  });

  Future<BranchesResponse> fetchPoliciesBranches({required List<num> ids});

  Future<BranchesResponse> fetchPoliciesPlans({required List<num> ids});

  Future<String> submitMembersToDelete(
    Map<num, String> selectedMemberDates,
    List<num> ids,
  );

  Future<AdditionDeletionTicket> fetchTickets({required TicketParams params});
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
    String? idsString = (params.polices ?? []).join(",");
    Map<String, dynamic> queryParams = params.toJson()
      ..addAll({"policies": idsString});
    return await dioConsumer
        .get(EndPoints.deletionMember)
        .params(queryParams)
        .factory((json) async => DeletionResponseModel.fromJson(json))
        .execute();
  }

  @override
  Future<PoliciesDataAddation> fetchPoliciesData({
    required PoliciesDataParams policies,
  }) async {
    return await dioConsumer
        .get(EndPoints.getPoliciesTicketData)
        .params(policies.toJson())
        .factory((json) async => PoliciesDataAddation.fromJson(json))
        .execute();
  }

  @override
  Future<BranchesResponse> fetchPoliciesBranches({
    required List<num> ids,
  }) async {
    String idsString = ids.join(",");
    return await dioConsumer
        .get(EndPoints.getPoliciesBranches)
        .params({"policies": idsString})
        .factory((json) async => BranchesResponse.fromJson(json))
        .execute();
  }

  @override
  Future<BranchesResponse> fetchPoliciesPlans({required List<num> ids}) async {
    String idsString = ids.join(",");
    return await dioConsumer
        .get(EndPoints.getPoliciesPlans)
        .params({"policy_ids": idsString})
        .factory((json) async => BranchesResponse.fromJson(json))
        .execute();
  }

  @override
  Future<String> submitMembersToDelete(
    Map<num, String> selectedMemberDates,
    List<num> ids,
  ) async {
    final List<num> memberIds = selectedMemberDates.keys.toList();
    List<Map<String, dynamic>> mapList = [
      for (var entry in selectedMemberDates.entries)
        {"deletion_date": entry.value},
    ];
    String idsString = ids.join(",");

    return await dioConsumer
        .post(EndPoints.submitMembersToDelete)
        .params({
          "deletion_member_ids": memberIds.join(","),
          "ticket_type": "Addition and Deletion",
          "policies": idsString,
        })
        .body({"members": mapList})
        .factory((json) => json['result']['message'])
        .execute();
  }

  @override
  Future<AdditionDeletionTicket> fetchTickets({
    required TicketParams params,
  }) async {
    return await dioConsumer
        .get(EndPoints.getMyTickets)
        .params(params.toJson())
        .factory((json) async => AdditionDeletionTicket.fromJson(json))
        .execute();
  }
}
