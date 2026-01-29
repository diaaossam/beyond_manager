import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/car_service/data/models/service_center_model.dart';
import 'package:bond/features/car_service/presentation/cubit/car_service_cubit.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarServiceBody extends StatefulWidget {
  const CarServiceBody({super.key});

  @override
  State<CarServiceBody> createState() => _CarServiceBodyState();
}

class _CarServiceBodyState extends State<CarServiceBody> {
  String? selectedInsurance;
  String? selectedVehicle;
  String? selectedArea;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarServiceCubit, BaseState<List<ServiceCenterModel>>>(
      builder: (context, state) {
        final cubit = context.read<CarServiceCubit>();
        
        return Padding(
          padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              _buildFilterTile(
                icon: Assets.icons.insurance,
                title: "Insurance Company",
                value: selectedInsurance,
                onTap: () {},
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              _buildFilterTile(
                icon: Assets.icons.card,
                title: "Vehicle Brand",
                value: selectedVehicle,
                onTap: () {},
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              _buildFilterTile(
                icon: Assets.icons.area,
                title: "Area",
                value: selectedArea,
                onTap: () {},
              ),
              SizedBox(height: SizeConfig.bodyHeight * .03),
              CustomButton(
                text: "Search",
                press: () {},
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomButton(
                text: "Reset",
                press: () {
                  setState(() {
                    selectedInsurance = null;
                    selectedVehicle = null;
                    selectedArea = null;
                  });
                  cubit.resetResultData();
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              if (state.isLoading)
                const Expanded(child: LoadingWidget())
              else if (state.isSuccess && cubit.serviceCenterList.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.serviceCenterList.length,
                    itemBuilder: (context, index) {
                      final center = cubit.serviceCenterList[index];
                      return Card(
                        margin: EdgeInsets.only(
                          bottom: SizeConfig.bodyHeight * .02,
                        ),
                        child: ListTile(
                          title: AppText(
                            text: "Service Center",
                            fontWeight: FontWeight.w600,
                          ),
                          subtitle: AppText(
                            text: center.city ?? "",
                            textSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterTile({
    required String icon,
    required String title,
    String? value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            AppImage.asset(icon, width: 24),
            SizedBox(width: SizeConfig.screenWidth * .03),
            Expanded(
              child: AppText(
                text: value ?? title,
                color: value != null
                    ? context.colorScheme.onSurface
                    : context.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: context.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ],
        ),
      ),
    );
  }
}
