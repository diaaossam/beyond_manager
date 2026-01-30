import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/network/data/models/response/hospital_model.dart';
import 'package:bond/features/network/presentation/bloc/search_result/search_result_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultTitleCard extends StatelessWidget {
  final HospitalModel hospital;

  const SearchResultTitleCard({super.key, required this.hospital});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, BaseState<List<HospitalModel>>>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .015),
              AppText(
                text: hospital.provider ?? "",
                fontWeight: FontWeight.w600,
                textSize: 12,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .015),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        AppText(
                          text: "${context.localizations.city}: ",
                          textSize: 11,
                          color: context.colorScheme.shadow,
                        ),
                        AppText(
                          text: hospital.city ?? "",
                          textSize: 12,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.shadow,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        AppText(
                          text: "${context.localizations.area}: ",
                          textSize: 12,
                          color: context.colorScheme.shadow,
                        ),
                        AppText(
                          text: hospital.area ?? "",
                          textSize: 12,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.shadow,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .015),
            ],
          ),
        );
      },
    );
  }
}
