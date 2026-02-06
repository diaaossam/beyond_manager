import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/policies/data/models/request/get_active_list_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api/api_handler_mixin.dart';
import '../datasources/addation_deletion_remote_data_source.dart';
import '../models/deletion_response_model.dart';
import '../models/manual_entry_params.dart';
import '../models/relationship_model.dart';

@LazySingleton()
class AddationDeletionRepository with ApiHandlerMixin {
  final AddationDeletionRemoteDataSource remoteDataSource;

  AddationDeletionRepository({required this.remoteDataSource});

  Future<Either<Failure, List<RelationshipModel>>> fetchRelations() async {
    return handleApi(() async => await remoteDataSource.getRelationships());
  }
  
  Future<Either<Failure, DeletionResponseModel>> fetchDeletionMembers({required ActiveListParams params}) async {
    return handleApi(() async => await remoteDataSource.fetchDeletionMembers(params: params));
  }

  Future<Either<Failure, String>> submitMembers(
    List<MemberFormData> members,
  ) async {
    return handleApi(() async => await remoteDataSource.submitMembers(members));
  }
}
