import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/app_btn.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';

import '../../gen/locale_keys.g.dart';
import '../utils/enums.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;
  final String? subtitle, image;
  final ErrorType? errorType;
  final Function? onRetry;
  final String? btnText;

  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomErrorWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.image,
    this.errorType,
    this.height,
    this.padding,
    this.onRetry,
    this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (image != null)
            CustomImage(
              image,
              width: context.w,
              height: 120.h,
              borderRadius: BorderRadius.circular(12.r),
            )
          else if (errorType == ErrorType.empty)
            CustomImage(
              Assets.images.empity.path,
              width: context.w,
              height: 180.h,
              borderRadius: BorderRadius.circular(12.r),
            ),

          SizedBox(height: 20.h),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: context.mediumText.copyWith(
              fontSize: 16,
              color: context.textSecondaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          if (subtitle?.isNotEmpty == true)
            Text(
              subtitle ?? '',
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: context.regularText.copyWith(
                fontSize: 14,
                color: context.hintColor,
              ),
            ),
          const SizedBox(height: kTextTabBarHeight),
          if (onRetry != null)
            AppBtn(
              onPressed: () => onRetry?.call(),
              title: btnText ?? LocaleKeys.retry.tr(),
            ),
        ],
      ).withPadding(horizontal: 24.w),
    );
  }
}
