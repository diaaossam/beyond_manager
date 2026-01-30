import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/config/theme/theme_helper.dart';
import 'package:bond/core/utils/app_assets.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/network/data/models/response/hospital_model.dart';
import 'package:bond/features/network/data/models/response/search_params.dart';
import 'package:bond/features/network/presentation/bloc/search_result/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchResultTff extends StatelessWidget {
  final SearchParamsModel searchParamsModel;
  final PagingController<int, HospitalModel> pagingController;

  const SearchResultTff({
    super.key,
    required this.searchParamsModel,
    required this.pagingController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, BaseState<List<HospitalModel>>>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) async {
            if (value.isNotEmpty) {
              SearchParamsModel paramsModel = searchParamsModel.copyWith(provider: value);
              pagingController.refresh();
            }
          },
          decoration: InputDecoration(
            hintText: context.localizations.searchByName,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffEDEDED)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffEDEDED)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffEDEDED)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffEDEDED)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffEDEDED)),
            ),
            filled: true,
            fillColor: const Color(0xffF3F3F3),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppAssets.search2),
            ),
            hintStyle: ThemeHelper().hintTFFTextStyle(color: const Color(0xffCACACA)),
          ),
        );
      },
    );
  }
}

OutlineInputBorder inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(50),
  borderSide: const BorderSide(color: Colors.white),
);
