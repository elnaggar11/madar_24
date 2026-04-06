import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';

class HighRateMarkets extends StatelessWidget {
  final String marketImagePath;
  final String marketTitle;
  final String rate;
  final String location;

  const HighRateMarkets({
    super.key,
    required this.marketImagePath,
    required this.marketTitle,
    required this.rate,
    required this.location,
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
                marketImagePath,
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
          Text(
            marketTitle,
            style: context.mediumText.copyWith(fontSize: 14.sp),
          ),
          8.verticalSpace,
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(Assets.icons.location),
              8.horizontalSpace,
              Flexible(
                child: Text(
                  location,
                  style: context.regularText.copyWith(
                    fontSize: 12.sp,
                    color: context.hintColor,
                  ),

                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
