import 'package:beymanger/core/utils/app_constant.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/main_policy_model.dart';
import 'package:beymanger/features/policies/policies_helper.dart';
import 'package:beymanger/features/policies/presentation/cubit/policies_cubit.dart';
import 'package:beymanger/features/policies/presentation/pages/policy_details_page2.dart';
import 'package:beymanger/features/policies/presentation/widgets/select_policy_page1/custom_policy_item.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomSelectPolicyListView extends StatefulWidget {
  const CustomSelectPolicyListView({super.key});

  @override
  State<CustomSelectPolicyListView> createState() =>
      _CustomSelectPolicyListViewState();
}

class _CustomSelectPolicyListViewState
    extends State<CustomSelectPolicyListView> {
  bool isSearch = false;

  @override
  void initState() {
    final bloc = context.read<PoliciesCubit>();
    bloc.pagingController.addPageRequestListener((pageKey) {
      if (!isSearch) {
        if (pageKey == 0) {
          pageKey = 1;
        }
        if(bloc.tag == 2){
          bloc.fetchPage(pageKey,"Expired");
        }if(bloc.tag == 1){
          bloc.fetchPage(pageKey,"Active Policy");
        }else{
          bloc.fetchPage(pageKey,"All");

        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoliciesCubit, PoliciesState>(
      builder: (context, state) {
        final cubit = context.read<PoliciesCubit>();
        return RefreshIndicator(
          onRefresh: () async=>context.read<PoliciesCubit>().pagingController.refresh() ,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: ChipsChoice<int>.single(
                value: cubit.tag,
                onChanged: (val) {
                  setState(() => isSearch = true);
                  cubit.choosePolicyTypeState(val);
                  String policiesStatus = PoliciesHelper.policiesStatus(value: val);
                  cubit.pagingController.refresh();
                  cubit.fetchPage(1, policiesStatus);
                  setState(() => isSearch = false);
                },
                choiceItems: C2Choice.listFrom<int, String>(
                  source: PoliciesHelper().options,
                  value: (i, v) => i,
                  label: (i, v) => v,
                ),
              )),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .05),
                sliver: PagedSliverList(
                    pagingController:
                        context.read<PoliciesCubit>().pagingController,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, MainPolicyModel item, index) =>
                          Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.bodyHeight * .01),
                        child: CustomPolicyItem(
                          result: item,
                          callback: () => AppConstant.navigateTo(
                              context: context,
                              widget: PolicyDetailsPage2(
                                model: item,
                              )),
                        ),
                      ),
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
