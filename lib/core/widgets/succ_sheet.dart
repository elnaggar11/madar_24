import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';
import 'package:madar_24/gen/locale_keys.g.dart';

class SuccSheet extends StatelessWidget {
  final String? title;
  const SuccSheet({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: context.w,
          constraints: BoxConstraints(maxHeight: context.h / 4),
          margin: EdgeInsets.only(top: 70.h),
          padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 24.h),
          decoration: BoxDecoration(
            color: context.scaffoldBackgroundColor,
            borderRadius: BorderRadiusDirectional.vertical(
              top: Radius.circular(32.r),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title ?? LocaleKeys.success.tr(),
            style: context.boldText.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        ClipOval(
          child: CustomImage(
            Assets.images.succ.path,
            fit: BoxFit.fill,
            height: 130.w,
            width: 130.w,
          ),
        ),
      ],
    );
  }
}
