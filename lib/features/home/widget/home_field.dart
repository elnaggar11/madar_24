import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/app_theme.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';

class HomeField extends StatelessWidget {
  const HomeField({
    super.key,
    this.onPressed,
    required this.fieldTitle,
    required this.fieldWidget,
    this.isOffer = false,
  });
  final void Function()? onPressed;
  final String fieldTitle;
  final Widget fieldWidget;
  final bool isOffer;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isOffer ? AppThemes.offerGradient : null,
        color: isOffer ? null : context.secondaryContainer,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                fieldTitle,
                style: context.boldText.copyWith(fontSize: 15.sp),
              ),
              Spacer(),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  'عرض الكل',
                  style: context.boldText.copyWith(
                    fontSize: 14.sp,
                    color: context.primaryColor,
                  ),
                ),
              ),
              Transform.rotate(
                angle: Directionality.of(context) == TextDirection.rtl
                    ? 1.57
                    : -1.57,
                child: CustomImage(
                  Assets.icons.arrowDown,
                  color: context.primaryColor,
                ),
              ),
            ],
          ).withPadding(horizontal: 16.r),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: fieldWidget,
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
