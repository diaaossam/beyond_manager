import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/network/data/models/hospital_model.dart';
import 'package:bond/features/network/presentation/bloc/search_result/search_result_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultTitleCard extends StatelessWidget {
  final HospitalModel hospital;

  const SearchResultTitleCard({super.key, required this.hospital});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.bodyHeight * .015,
              ),
              AppText(
                text: hospital.provider ?? "",
                fontWeight: FontWeight.w600,
                textSize: 14,
              ),
              SizedBox(
                height: SizeConfig.bodyHeight * .015,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        AppText(
                          text: "${context.localizations.city}: ",
                          textSize: 12,
                          color: const Color(0xff707070),
                        ),
                        AppText(
                          text: hospital.city ?? "",
                          textSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff707070),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        AppText(text: "${context.localizations.area}: ",textSize: 12,
                          color: const Color(0xff707070),),
                        AppText(
                          text: hospital.area ?? "",
                          textSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff707070),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.bodyHeight * .015,
              ),
            ],
          ),
        );
      },
    );
  }
}
