import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/app_sheet.dart';
import 'package:madar_24/core/widgets/custom_circle_icon.dart';
import 'package:madar_24/gen/locale_keys.g.dart';

class MediaSourceSheet extends StatelessWidget {
  const MediaSourceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Future<XFile?> pick(ImageSource source) async {
      final pick = ImagePicker();
      return await pick.pickImage(source: source);
    }

    return CustomAppSheet(
      title: LocaleKeys.chooseImageSource.tr(),
      padding: EdgeInsets.all(16.sp),
      children: [
        _MediaSourceTile(
          title: LocaleKeys.camera.tr(),
          icon: Icons.camera_alt,
          onTap: () async {
            Navigator.pop(
              navigator.currentContext!,
              await pick(ImageSource.camera),
            );
          },
          //
        ),
        12.verticalSpace,
        _MediaSourceTile(
          title: LocaleKeys.gallery.tr(),
          icon: Icons.photo_library,
          onTap: () async {
            Navigator.pop(
              navigator.currentContext!,
              await pick(ImageSource.gallery),
            );
          },
        ),
      ],
    );
  }
}

class _MediaSourceTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _MediaSourceTile({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          CustomRadiusIcon(
            // padding: EdgeInsets.all(10.w),
            // decoration: BoxDecoration(color: context.primaryColor.withOpacity(0.12), borderRadius: BorderRadius.circular(10.r)),
            child: Icon(icon, size: 24.sp),
          ),
          12.horizontalSpace,
          Text(title, style: context.mediumText.copyWith(fontSize: 15)),
        ],
      ),
    );
  }
}
