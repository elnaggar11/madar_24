import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/custom_image.dart';

class AppbarIconWidget extends StatelessWidget {
  final String imagePath;
  final void Function()? onTap;
  const AppbarIconWidget({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: context.hintColor.withValues(alpha: 0.1),
        child: CustomImage(imagePath, width: 20.w, height: 20.h),
      ),
    );
  }
}
