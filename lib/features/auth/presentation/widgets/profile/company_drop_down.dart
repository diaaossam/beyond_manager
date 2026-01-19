import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:bond/features/auth/presentation/cubit/profile/profile_cubit.dart';
import 'package:bond/widgets/main_widget/app_drop_down.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/dependencies/injectable_dependencies.dart';

class CompanyDropDown extends StatelessWidget {
  const CompanyDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>(),
      child: BlocBuilder<ProfileCubit, BaseState<UserModel>>(
        builder: (context, state) {
          final bloc = context.read<ProfileCubit>();
          return AppDropDown<num>(
            initialValue: UserDataService().getUserData()?.currentCompanyId,
            onChanged: (data) => bloc.updateCompany(id: data!),
            items: (UserDataService().getUserData()?.companyIds ?? [])
                .map<DropdownMenuItem<num>>(
                  (e) => DropdownMenuItem(
                    value: e.id,
                    child: AppText(text: e.name),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
