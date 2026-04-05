import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 21.h),
      decoration: BoxDecoration(
        color: context.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          'متابعة كزائر',
          style: context.semiboldText.copyWith(
            fontSize: 14.sp,
            color: context.primaryColor,
          ),
        ),
      ),
    );
  }
}
