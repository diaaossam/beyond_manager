import 'package:auto_route/annotations.dart';
import 'package:bond/features/settings/contact_helper.dart';
import 'package:bond/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';

@RoutePage()
class UniqueServiceScreen extends StatelessWidget {
  const UniqueServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Unique services'),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            disableGestures: true,
            imageProvider: AssetImage(Assets.images.beyondServicesEN1.path),
            initialScale: PhotoViewComputedScale.covered,
            heroAttributes: PhotoViewHeroAttributes(
              tag: Assets.images.beyondServicesEN1.path,
            ),
          );
        },
        itemCount: 1,
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded /
                        (event.expectedTotalBytes ?? 1),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          final phoneNumber =
              context.read<SettingsCubit>().state.data?.sickLeave ?? "";
          ContactHelper.contactUsWithWhatsApp(phoneNumber: phoneNumber);
        },
        child: AppImage.asset(Assets.icons.whats),
        // child: SvgPicture.asset(AppAssets.whats),
      ),
    );
  }
}
