import 'package:bond/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../widgets/app_failure.dart';
import '../../../../../widgets/loading/loading_widget.dart';
import '../../../../../widgets/no_item_design.dart';
import '../../../../addation_deletion/data/models/response/policies_data_addation.dart';
import 'custom_policy_grid_item.dart';

class PolicyGridDesign extends StatelessWidget {
  final PagingController<int, PoliciesDataModel> pagingController;
  final Function(PoliciesDataModel) onItemTap;
  final List<num>? selectedPolicyIds;
  final Function(List<PoliciesDataModel>)? onSelectionChanged;
  final bool enableMultiSelect;

  const PolicyGridDesign({
    super.key,
    required this.pagingController,
    required this.onItemTap,
    this.selectedPolicyIds,
    this.onSelectionChanged,
    this.enableMultiSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return PagingListener<int, PoliciesDataModel>(
      controller: pagingController,
      builder: (context, state, fetchNextPage) {
        final allItems = state.items ?? [];
        return PagedSliverGrid<int, PoliciesDataModel>(
          state: state,
          fetchNextPage: fetchNextPage,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) {
              final isSelected =
                  selectedPolicyIds?.contains(item.policyId) ?? false;
              return Container(
                margin: EdgeInsets.all(SizeConfig.bodyHeight * .01),
                child: CustomPolicyGridItem(
                  onItemTap: (policy) {
                    if (enableMultiSelect && onSelectionChanged != null) {
                      final currentSelected = allItems
                          .where(
                            (p) =>
                                selectedPolicyIds?.contains(p.policyId) ??
                                false,
                          )
                          .toList();

                      if (isSelected) {
                        currentSelected.removeWhere(
                          (p) => p.policyId == policy.policyId,
                        );
                      } else {
                        currentSelected.add(policy);
                      }

                      onSelectionChanged!(currentSelected);
                    } else {
                      onItemTap(policy);
                    }
                  },
                  result: item,
                  isSelected: isSelected,
                  showCheckbox: enableMultiSelect,
                ),
              );
            },
            firstPageProgressIndicatorBuilder: (context) =>
                const LoadingWidget(),
            firstPageErrorIndicatorBuilder: (context) =>
                const AppFailureWidget(),
            noItemsFoundIndicatorBuilder: (context) =>
                const EmptyWidgetDesign(),
          ),
        );
      },
    );
  }
}
