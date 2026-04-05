import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/routes/routes.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/app_btn.dart';
import 'package:madar_24/core/widgets/app_field.dart';
import 'package:madar_24/core/widgets/back_widget.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تغيير كلمة المرور'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              16.verticalSpace,
              Text(
                'قم بإدخال كلمة المرور الجديدة',
                style: context.mediumText.copyWith(
                  fontSize: 14.sp,
                  color: context.hintColor,
                ),
              ),
              16.verticalSpace,
              Text(
                'كلمة المرور الجديدة',
                style: context.boldText.copyWith(fontSize: 12.sp),
              ),
              12.verticalSpace,
              AppField(
                hintText: 'كلمة المرور الجديدة',
                keyboardType: TextInputType.visiblePassword,
              ),
              12.verticalSpace,
              Text(
                'تأكيد كلمة المرور',
                style: context.boldText.copyWith(fontSize: 12.sp),
              ),
              12.verticalSpace,
              AppField(
                hintText: 'تأكيد كلمة المرور الجديدة',
                keyboardType: TextInputType.visiblePassword,
              ),
              AppBtn(
                title: 'تأكيد',
                onPressed: () {
                  push(NamedRoutes.login);
                },
                borderRadius: 12.r,
                textSize: 14.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
