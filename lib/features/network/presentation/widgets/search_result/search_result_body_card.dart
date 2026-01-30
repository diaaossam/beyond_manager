import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_assets.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/settings/contact_helper.dart';
import 'package:bond/features/network/data/models/response/hospital_model.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultBodyCard extends StatelessWidget {
  const SearchResultBodyCard({super.key, required this.hospital});

  final HospitalModel hospital;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .02),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.bodyHeight * .01,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(text: "${context.localizations.phoneNumber}: "),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: AppText(
                  text: hospital.phoneNumber ?? "",
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                 ContactHelper.contactUsWithPhoneNumber(phoneNumber: hospital.phoneNumber??"");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.bodyHeight * .006,
                      horizontal: SizeConfig.bodyHeight * .03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: context.colorScheme.primary,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.phone,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppText(
                        text: context.localizations.call,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.bodyHeight * .01,
          ),
          Row(
            children: [
              AppText(text: "${context.localizations.address}: ",textSize: 10,),
              Expanded(
                child: AppText(
                  textSize: 11,
                  text: hospital.address ?? "",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.bodyHeight * .01,
          ),
          Row(
            children: [
              AppText(text: "${context.localizations.providerType}: ",textSize: 10),
              Expanded(
                child: AppText(
                  textSize: 11,
                  text: hospital.providerType ?? "",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.bodyHeight * .01,
          ),
          Row(
            children: [
              AppText(text: "${context.localizations.specialty}: ",textSize: 10,),
              Expanded(
                child: AppText(
                  textSize: 11,
                  text: hospital.specialty ?? "",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.bodyHeight * .02,
          ),
        ],
      ),
    );
  }
}
