import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/routes/routes.dart';
import 'package:madar_24/core/services/service_locator.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/app_btn.dart';
import 'package:madar_24/core/widgets/back_widget.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/core/widgets/pin_code.dart';
import 'package:madar_24/features/auth/verify/cubit/verify_cubit.dart';
import 'package:madar_24/gen/assets.gen.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final cubit = sl<VerifyCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تأكيد الهوية'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              16.verticalSpace,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'أرسلنا رمز تحقق مكون من 4 أرقام إلى ',
                      style: context.regularText.copyWith(fontSize: 16.sp),
                    ),
                    TextSpan(
                      text: cubit.maskPhone(context.arg['phone']),
                      style: context.mediumText.copyWith(fontSize: 16.sp),
                    ),
                    TextSpan(
                      text:
                          '\nالرجاء إدخال الرمز الموجود في المربع أدناه للمتابعة.',
                      style: context.regularText.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              16.verticalSpace,
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text(
                      'تعديل رقم الهاتف',
                      style: context.boldText.copyWith(
                        fontSize: 14.sp,
                        color: context.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: context.primaryColor,
                        decorationThickness: 1.5,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                    8.horizontalSpace,
                    CustomImage(Assets.icons.arrowLeft),
                  ],
                ),
              ),
              12.verticalSpace,
              CustomPinCode(length: 4),
              16.verticalSpace,
              Row(
                children: [
                  Text(
                    'لم تستلم الكود؟',
                    style: context.regularText.copyWith(fontSize: 14.sp),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                    child: Text(
                      ' اعادة ارسال',
                      style: context.regularText.copyWith(
                        fontSize: 14.sp,
                        color: context.primaryColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '00:59',
                    style: context.regularText.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
              32.verticalSpace,
              AppBtn(
                title: 'إرسال',
                onPressed: () {
                  push(NamedRoutes.resetPassword);
                },
                borderRadius: 12.r,
                textSize: 14.sp,
              ),
            ],
          ).withPadding(horizontal: 16.w),
        ),
      ),
    );
  }
}
