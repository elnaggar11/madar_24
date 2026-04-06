import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/app_theme.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/custom_image.dart';

class CategoriesItem extends StatelessWidget {
  final String categoryName;
  final String gategoryPath;
  const CategoriesItem({
    super.key,
    required this.categoryName,
    required this.gategoryPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        gradient: AppThemes.gradient,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            categoryName,
            style: context.mediumText.copyWith(fontSize: 15.sp),
          ),

          CustomImage(gategoryPath),
        ],
      ),
    );
  }
}
