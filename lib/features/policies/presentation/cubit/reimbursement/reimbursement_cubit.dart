import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/response/reimbursement_model.dart';

class ReimbursementCubit extends Cubit<BaseState<ReimbursementResponseModel>> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  ReimbursementCubit(this.policiesRepositoryImpl) : super(BaseState()) {
    _getClaimStatusOptions();
  }

  final PagingController<int, ReimbursementModel> pagingController =
      PagingController(firstPageKey: 0);

  List<GenericModel> claimStatusOptions = [];
  String lastUpdateDate = "";
  String videoTutorial = "";
  num? totalMembers;
  bool showExcel = false;

  void _getClaimStatusOptions() async {
    emit(GetReimbursementStatusLoading());
    final response = await getReimbursementStatus();
    emit(
      response.fold((l) => GetReimbursementStatusFailure(), (r) {
        claimStatusOptions = r.data;
        return GetReimbursementStatusSuccess();
      }),
    );
  }

  Future<List<ReimbursementModel>> getReimbursement({
    required ReimbursementFilterModel params,
  }) async {
    List<ReimbursementModel> list = [];
    final response = await getReimursementResultUseCase(params: params);
    response.fold(
      (l) {
        return [];
      },
      (r) {
        list = r.data ?? [];
        if (r.message != null) {
          videoTutorial = r.message ?? "";
        }
        totalMembers = r.totalCount ?? 0;

        if (r.date != null) {
          lastUpdateDate = r.date ?? "";
        }

        // Show Excel button if we have data
        if (list.isNotEmpty) {
          showExcel = true;
        }

        emit(ReimbursementLoaded());
      },
    );
    return list;
  }

  Future<List<ReimbursementModel>> getReimbursementList({
    required ReimbursementFilterModel params,
  }) async {
    List<ReimbursementModel> list = [];
    final response = await getReimursementResultUseCase(params: params);
    response.fold(
      (l) {
        return [];
      },
      (r) {
        list = r.data ?? [];
        totalMembers = r.totalCount ?? 0;
        showExcel = true;
        emit(SetReimbursementListMembers());
      },
    );
    return list;
  }

  Future<void> fetchPage({required ReimbursementFilterModel params}) async {
    try {
      final newItems = await getReimbursement(params: params);

      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = params.pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  /*
  ReimbursementFilterModel get currentFilter => _currentFilter;

  Future<void> loadReimbursementRequests() async {
    emit(ReimbursementLoading());

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock data
    _allRequests = [
      ReimbursementRequestModel(
        id: '1',
        memberName: 'Ahmed Hassan',
        memberId: 'M001',
        staffId: 'S001',
        serviceType: 'Medical',
        serviceDate: DateTime.now().subtract(const Duration(days: 5)),
        claimedAmount: 1500.0,
        claimStatus: 'Approved',
        mobileNumber: '+966501234567',
        approvedAmount: 1400.0,
        paymentState: 'Paid',
        batchNumber: 'B001',
        isLifeClaim: false,
      ),
      ReimbursementRequestModel(
        id: '2',
        memberName: 'Sara Ali',
        memberId: 'M002',
        staffId: 'S002',
        serviceType: 'Dental',
        serviceDate: DateTime.now().subtract(const Duration(days: 3)),
        claimedAmount: 800.0,
        claimStatus: 'Pending',
        mobileNumber: '+966507654321',
        isLifeClaim: false,
      ),
      ReimbursementRequestModel(
        id: '3',
        memberName: 'Mohammed Omar',
        memberId: 'M003',
        staffId: 'S003',
        serviceType: 'Life Insurance',
        serviceDate: DateTime.now().subtract(const Duration(days: 7)),
        claimedAmount: 5000.0,
        claimStatus: 'Under Review',
        mobileNumber: '+966509876543',
        isLifeClaim: true,
      ),
      ReimbursementRequestModel(
        id: '4',
        memberName: 'Fatima Ahmed',
        memberId: 'M004',
        staffId: 'S004',
        serviceType: 'Medical',
        serviceDate: DateTime.now().subtract(const Duration(days: 1)),
        claimedAmount: 2200.0,
        claimStatus: 'Approved',
        mobileNumber: '+966501112233',
        approvedAmount: 2000.0,
        paymentState: 'Processing',
        batchNumber: 'B002',
        isLifeClaim: false,
      ),
    ];

    _filteredRequests = List.from(_allRequests);
    emit(ReimbursementLoaded(requests: _filteredRequests));
  }

  void applyFilters(ReimbursementFilterModel filter) {
    _currentFilter = filter;
    _filteredRequests = List.from(_allRequests);

    // Apply search filter
    if (filter.searchQuery != null && filter.searchQuery!.isNotEmpty) {
      _filteredRequests = _filteredRequests.where((request) {
        final query = filter.searchQuery!.toLowerCase();
        return (request.memberName?.toLowerCase().contains(query) ?? false) ||
            (request.memberId?.toLowerCase().contains(query) ?? false) ||
            (request.staffId?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    // Apply claim status filter
    if (filter.claimStatus != null && filter.claimStatus!.isNotEmpty) {
      _filteredRequests = _filteredRequests.where((request) {
        return request.claimStatus?.toLowerCase() ==
            filter.claimStatus!.toLowerCase();
      }).toList();
    }

    // Apply service type filter
    if (filter.serviceType != null && filter.serviceType!.isNotEmpty) {
      _filteredRequests = _filteredRequests.where((request) {
        return request.serviceType?.toLowerCase() ==
            filter.serviceType!.toLowerCase();
      }).toList();
    }

    // Apply life claim filter
    if (filter.isLifeClaim != null) {
      _filteredRequests = _filteredRequests.where((request) {
        return request.isLifeClaim == filter.isLifeClaim;
      }).toList();
    }

    // Apply date range filter
    if (filter.serviceDateFrom != null) {
      _filteredRequests = _filteredRequests.where((request) {
        return request.serviceDate != null &&
                request.serviceDate!.isAfter(filter.serviceDateFrom!) ||
            request.serviceDate!.isAtSameMomentAs(filter.serviceDateFrom!);
      }).toList();
    }

    if (filter.serviceDateTo != null) {
      _filteredRequests = _filteredRequests.where((request) {
        return request.serviceDate != null &&
                request.serviceDate!.isBefore(filter.serviceDateTo!) ||
            request.serviceDate!.isAtSameMomentAs(filter.serviceDateTo!);
      }).toList();
    }

    // Apply sorting
    if (filter.sortBy != null) {
      _filteredRequests.sort((a, b) {
        if (a.serviceDate == null || b.serviceDate == null) return 0;

        if (filter.sortBy == 'newest') {
          return b.serviceDate!.compareTo(a.serviceDate!);
        } else if (filter.sortBy == 'oldest') {
          return a.serviceDate!.compareTo(b.serviceDate!);
        }
        return 0;
      });
    }

    emit(ReimbursementLoaded(requests: _filteredRequests));
  }

  void clearFilters() {
    _currentFilter = ReimbursementFilterModel();
    _filteredRequests = List.from(_allRequests);
    emit(ReimbursementLoaded(requests: _filteredRequests));
  }

  List<ReimbursementRequestModel> getMemberClaims(String memberId) {
    return _allRequests
        .where((request) => request.memberId == memberId)
        .toList();
  }

  ReimbursementRequestModel? getRequestDetails(String requestId) {
    try {
      return _allRequests.firstWhere((request) => request.id == requestId);
    } catch (e) {
      return null;
    }
  }

  */
}
