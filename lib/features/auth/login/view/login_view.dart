import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/routes/routes.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/app_btn.dart';
import 'package:madar_24/core/widgets/app_field.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/features/splash/widget/guest_button.dart';
import 'package:madar_24/gen/assets.gen.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.hSpace,
              Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomImage(Assets.icons.logo),
              ),
              32.hSpace,
              Text(
                'قم بتسجيل الدخول الي حسابك',
                style: context.boldText.copyWith(fontSize: 16.sp),
              ),
              48.hSpace,
              Text(
                'رقم الهاتف',
                style: context.semiboldText.copyWith(fontSize: 12.sp),
              ),
              12.hSpace,
              AppField(
                hintText: 'رقم الهاتف',
                keyboardType: TextInputType.phone,
              ),
              12.hSpace,
              Text(
                'كلمة المرور',
                style: context.semiboldText.copyWith(fontSize: 12.sp),
              ),
              12.hSpace,
              AppField(
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              // 12.hSpace,
              TextButton(
                onPressed: () {
                  push(NamedRoutes.confirmIdentity);
                },
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: context.semiboldText.copyWith(
                    fontSize: 14.sp,
                    color: context.primaryColor,
                  ),
                ),
              ),
              24.hSpace,
              AppBtn(
                title: 'تسجيل الدخول',
                onPressed: () {},
                borderRadius: 12.r,
                textSize: 14.sp,
              ),
              16.hSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'لا يوجد لديك حساب؟ ',
                    style: context.regularText.copyWith(
                      fontSize: 14.sp,
                      color: context.hintColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      push(NamedRoutes.register);
                    },
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      'سجل الان',
                      style: context.boldText.copyWith(
                        fontSize: 14.sp,
                        color: context.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: const GuestButton(),
          ),
        ],
      ),
    );
  }
}
