import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/widgets/custom_image.dart';

import '../utils/extensions.dart';
import 'app_btn.dart';
import 'app_sheet.dart';

class ConfirmationSheet extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? image;

  const ConfirmationSheet({super.key, this.title, this.subTitle, this.image});

  @override
  Widget build(BuildContext context) {
    return CustomAppSheet(
      title: title,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      children: [
        if (image != null) ...[
          CustomImage(image, height: 64.w, width: 64.w).center,
          16.verticalSpace,
        ],
        Text(
          subTitle ?? '',
          style: context.mediumText.copyWith(
            fontSize: 16,
            color: context.textSecondaryColor,
          ),
        ).center,
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: AppBtn(
                onPressed: () => Navigator.pop(context, false),
                title: "تراجع",
                textColor: context.hintColor,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppBtn(
                onPressed: () => Navigator.pop(context, true),
                title: 'تأكيد',
                backgroundColor: context.errorColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
