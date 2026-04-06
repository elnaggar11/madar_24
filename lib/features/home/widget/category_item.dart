import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final String gategoryPath;
  final String marketTitle;
  final String rate;
  final String originalPrice;
  final String discountPrice;

  final String discountPercentage;
  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.gategoryPath,
    required this.marketTitle,
    required this.rate,
    required this.originalPrice,
    required this.discountPrice,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.38,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomImage(
                gategoryPath,
                borderRadius: BorderRadius.circular(10.r),
                width: 150.w,
                height: 150.h,
                // fit: BoxFit.none,
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                top: 0,
                start: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomImage(Assets.icons.heart),
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Text(
            marketTitle,
            style: context.regularText.copyWith(
              fontSize: 10.sp,
              color: context.hintColor,
            ),
          ),
          8.verticalSpace,

          Text(
            categoryName,
            style: context.mediumText.copyWith(fontSize: 14.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          10.verticalSpace,
          Row(
            children: [
              CustomImage(Assets.icons.star),
              2.horizontalSpace,
              Text(
                rate,
                style: context.mediumText.copyWith(
                  fontSize: 12.sp,
                  color: Color(0xffFFB01D),
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              Text(
                originalPrice,
                style: context.boldText.copyWith(fontSize: 14.sp),
              ),
              4.horizontalSpace,
              CustomImage(Assets.icons.sarCoin, width: 20.w, height: 20.h),
              4.horizontalSpace,
              Text(
                discountPrice,
                style: context.regularText.copyWith(
                  fontSize: 10.sp,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: context.hintColor,
                ),
              ),
              8.horizontalSpace,
              Text(
                '-$discountPercentage%',
                style: context.mediumText.copyWith(
                  fontSize: 12.sp,
                  color: context.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
