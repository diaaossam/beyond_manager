import 'dart:io';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../config/helper/excel_helper.dart';
import '../../../../../core/bloc/helper/base_state.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../../widgets/app_failure.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/no_item_design.dart';
import '../../../../policies/data/models/request/get_active_list_params.dart';
import '../../../../policies/data/models/response/active_list_model.dart';
import '../../../../policies/presentation/cubit/active_policy/active_policy_bloc.dart';
import '../../../data/models/request/sick_leave_params.dart';
import '../../cubit/create_sick_leave/create_sick_leave_cubit.dart';
import 'create_sick_leave_bottom_sheet.dart';
import 'widgets/member_list_header.dart';
import 'widgets/member_list_item.dart';
import 'widgets/member_search_bar.dart';
import 'widgets/other_member_input.dart';
import 'widgets/sick_leave_bottom_bar.dart';

class CreateSickLeaveBody extends StatefulWidget {
  final int policyId;

  const CreateSickLeaveBody({super.key, required this.policyId});

  @override
  State<CreateSickLeaveBody> createState() => _CreateSickLeaveBodyState();
}

class _CreateSickLeaveBodyState extends State<CreateSickLeaveBody> {
  int? _selectedIndex;
  String _otherMemberName = "";
  ActiveListParams? _activeListParams;
  int? _insuredMemberId;
  String? _otherName;
  Result? _selectedMember;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<ActivePolicyCubit>();
    _activeListParams = ActiveListParams(
      memberStatus: "all",
      pageSize: 8,
      policyId: widget.policyId,
      pageKey: 1,
    );
    bloc.initPagination();
    bloc.fetchFirstActiveList(params: _activeListParams!);
  }

  void _handleSearch(String? value, SearchType type) {
    setState(() {
      _selectedIndex = null;
      _selectedMember = null;
      if (type == SearchType.name) _otherName = value;
    });

    _activeListParams = _activeListParams?.copyWith(
      name: type == SearchType.name ? value : _activeListParams?.name,
      insuranceId: type == SearchType.insuranceId
          ? value
          : _activeListParams?.insuranceId,
      staffId: type == SearchType.staffId ? value : _activeListParams?.staffId,
    );

    context.read<ActivePolicyCubit>().fetchActiveList(
      params: _activeListParams!,
    );
  }

  void _handleOtherMemberChanged(String? value) {
    setState(() {
      _selectedIndex = null;
      _selectedMember = null;
      _otherMemberName = value ?? "";
    });

    if (value?.isNotEmpty ?? false) {
      _otherName = value;
      _insuredMemberId = null;
    } else {
      _otherName = null;
    }
  }

  void _handleMemberSelected(int index, Result member) {
    if (_otherMemberName.isNotEmpty) {
      AppConstant.showToast(
        color: Colors.red,
        msg: context.localizations.clearOtherFirst,
        gravity: ToastGravity.TOP,
      );
      return;
    }

    setState(() {
      if (_selectedIndex == index) {
        _insuredMemberId = null;
        _selectedMember = null;
        _selectedIndex = null;
      } else {
        _insuredMemberId = member.memberId;
        _selectedMember = member;
        _selectedIndex = index;
      }
    });
  }

  void _handleUploadAttachments() {
    if (_otherMemberName.isNotEmpty && _otherName != null) {
      _showUploadBottomSheet(null);
      return;
    }
    if (_selectedIndex != null && _selectedMember != null) {
      _showUploadBottomSheet(_selectedMember);
      return;
    }
    AppConstant.showToast(
      color: Colors.red,
      msg: context.localizations.chooseMember,
      gravity: ToastGravity.TOP,
    );
  }

  void _showUploadBottomSheet(Result? selectedMember) {
    final memberName = selectedMember?.member ?? _otherName ?? "";
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CombinedUploadBottomSheet(
        name: memberName,
        onSubmitRequest: (files) {
          context.read<CreateSickLeaveCubit>().updateFiles(files: files);
          if (selectedMember != null) {
            setState(() => _insuredMemberId = selectedMember.memberId);
          }
        },
      ),
    );
  }

  void _handleSubmit(List<File> files) {
    if (files.isEmpty) {
      AppConstant.showCustomSnakeBar(
        context,
        context.localizations.attachmentsValidation,
        false,
      );
      return;
    }

    context.read<CreateSickLeaveCubit>().createNewSickLeave(
      sickLeaveParams: SickLeaveParams(
        insuredMemberId: _insuredMemberId,
        name: _otherName,
        policyId: widget.policyId,
      ),
    );
  }

  Future<void> _exportToExcel() async {
    final response = await context
        .read<ActivePolicyCubit>()
        .policiesRepositoryImpl
        .getActivePolicy(
          activeListParams: ActiveListParams(policyId: widget.policyId),
        );
    final model = response.getOrElse(() => ActiveListModel());
    ExcelHelper().createActiveListExcel(
      bigRecord: model.result ?? [],
      isBusinessLife: model.isLife ?? true,
      isMedical: model.isMedical ?? true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivePolicyCubit, BaseState<ActiveListModel>>(
      builder: (context, activeState) {
        return Scaffold(
          appBar: CustomAppBar(
            title: context.localizations.createNewRequest,
            actions: [
              if ((activeState.data?.result ?? []).isNotEmpty)
                InkWell(
                  onTap: _exportToExcel,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * .04,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: AppImage.asset(Assets.icons.excel),
                        ),
                        AppImage.asset(Assets.icons.downloadExcel),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          body: _buildBody(activeState),
        );
      },
    );
  }

  Widget _buildBody(BaseState<ActiveListModel> activeState) {
    return BlocConsumer<CreateSickLeaveCubit, BaseState<List<File>>>(
      listener: _handleCreateStateChanges,
      builder: (context, createState) {
        return activeState.builder(
          onTapRetry: () => context
              .read<ActivePolicyCubit>()
              .fetchFirstActiveList(params: _activeListParams!),
          onSuccess: (data) => _buildContent(data, createState),
        );
      },
    );
  }

  void _handleCreateStateChanges(
    BuildContext context,
    BaseState<List<File>> state,
  ) {
    if (state.isSuccess && state.identifier == 'create_sick_leave') {
      setState(() {
        _insuredMemberId = null;
        _otherName = null;
        _selectedIndex = null;
        _selectedMember = null;
      });
      Navigator.of(context).pop();
      AppConstant.showCustomSnakeBar(
        context,
        context.localizations.sickLeaveCreatedSuccessfully,
        true,
      );
    }
  }

  Widget _buildContent(
    ActiveListModel data,
    BaseState<List<File>> createState,
  ) {
    final bloc = context.read<ActivePolicyCubit>();
    final createBloc = context.read<CreateSickLeaveCubit>();
    final files = createState.data ?? [];
    final isLoading =
        createState.isLoading && createState.identifier == 'create_sick_leave';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: MemberSearchBar(onSearch: _handleSearch),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: SizeConfig.bodyHeight * .005),
          ),
          OtherMemberInput(onChanged: _handleOtherMemberChanged),
          SliverToBoxAdapter(
            child: SizedBox(height: SizeConfig.bodyHeight * .01),
          ),
          MemberListHeader(
            totalMembers: data.statistics?.totalMembers?.toInt(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: SizeConfig.bodyHeight * .01),
          ),
          _buildMemberList(bloc, data),
        ],
      ),
      bottomNavigationBar: SickLeaveBottomBar(
        files: files,
        isLoading: isLoading,
        onUploadAttachments: _handleUploadAttachments,
        onSubmit: () => _handleSubmit(files),
        onRemoveFile: (file) => createBloc.removeFileFromList(file: file),
      ),
    );
  }

  Widget _buildMemberList(ActivePolicyCubit bloc, ActiveListModel data) {
    return PagingListener<int, Result>(
      controller: bloc.pagingController,
      builder: (context, pagingState, fetchNextPage) =>
          PagedSliverList<int, Result>(
            state: pagingState,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<Result>(
              firstPageProgressIndicatorBuilder: (_) => const LoadingWidget(),
              firstPageErrorIndicatorBuilder: (_) => AppFailureWidget(
                callback: () => bloc.pagingController.refresh(),
              ),
              noItemsFoundIndicatorBuilder: (_) => const EmptyWidgetDesign(),
              itemBuilder: (context, item, index) => MemberListItem(
                member: item,
                index: index,
                isSelected: _selectedIndex == index,
                onSelected: (idx) => _handleMemberSelected(idx, item),
              ),
            ),
          ),
    );
  }
}
