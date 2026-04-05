import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/routes/routes.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/app_btn.dart';
import 'package:madar_24/core/widgets/app_field.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/features/auth/sign_up/view/widget/pick_image_widget.dart';
import 'package:madar_24/gen/assets.gen.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomImage(Assets.icons.logo),
              ),
              32.verticalSpace,
              Text(
                'قم بانشاء حسابك',
                style: context.boldText.copyWith(fontSize: 16.sp),
              ),
              32.verticalSpace,
              PickImageWidget(),
              16.verticalSpace,
              Text(
                'الاسم',
                style: context.semiboldText.copyWith(fontSize: 12.sp),
              ),
              12.verticalSpace,
              AppField(
                hintText: 'قم بإدخال اسمك',
                keyboardType: TextInputType.text,
              ),
              12.verticalSpace,
              Text(
                'البريد الاكتروني',
                style: context.semiboldText.copyWith(fontSize: 12.sp),
              ),
              12.verticalSpace,
              AppField(
                hintText: 'البريد الاكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              12.verticalSpace,
              Text(
                'رقم الهاتف',
                style: context.semiboldText.copyWith(fontSize: 12.sp),
              ),
              12.verticalSpace,
              AppField(
                hintText: 'رقم الهاتف',
                keyboardType: TextInputType.phone,
              ),
              12.verticalSpace,
              Text(
                'كلمة المرور',
                style: context.semiboldText.copyWith(fontSize: 12.sp),
              ),
              12.verticalSpace,
              AppField(
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              12.verticalSpace,
              Text(
                'تأكيد كلمة المرور',
                style: context.semiboldText.copyWith(fontSize: 12.sp),
              ),
              12.hSpace,
              AppField(
                hintText: 'تأكيد كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              33.verticalSpace,
              AppBtn(
                title: 'إنشاء حساب',
                onPressed: () {
                  push(NamedRoutes.login);
                },
                borderRadius: 12.r,
                textSize: 14.sp,
              ),
              12.verticalSpace,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          16.horizontalSpace,
          Text(
            'لديك حساب؟ ',
            style: context.regularText.copyWith(fontSize: 14.sp),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
            ),
            child: Text(
              'تسجيل الدخول',
              style: context.boldText.copyWith(
                fontSize: 14.sp,
                color: context.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
