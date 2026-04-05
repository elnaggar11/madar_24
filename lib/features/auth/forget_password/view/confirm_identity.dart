import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/routes/routes.dart';
import 'package:madar_24/core/services/service_locator.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/app_btn.dart';
import 'package:madar_24/core/widgets/app_field.dart';
import 'package:madar_24/core/widgets/back_widget.dart';
import 'package:madar_24/features/auth/forget_password/cubit/forget_password_cubit.dart';

class ConfirmIdentityView extends StatefulWidget {
  const ConfirmIdentityView({super.key});

  @override
  State<ConfirmIdentityView> createState() => _ConfirmIdentityViewState();
}

class _ConfirmIdentityViewState extends State<ConfirmIdentityView> {
  final cubit = sl<ForgetPasswordCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'رقم الهاتف'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            Text(
              'يرجي إدخال رقم الهاتف المسجل حتي نتمكن من التحقق من هويتك',
              style: context.regularText.copyWith(fontSize: 14.sp),
            ),
            16.verticalSpace,
            Text(
              'رقم الهاتف',
              style: context.semiboldText.copyWith(fontSize: 12.sp),
            ),
            12.verticalSpace,
            AppField(
              hintText: 'رقم الهاتف',
              keyboardType: TextInputType.phone,
              controller: cubit.phone,
            ),
            32.verticalSpace,
            AppBtn(
              title: 'تأكيد ',
              onPressed: () {
                push(NamedRoutes.verify, arg: {'phone': cubit.phone.text});
              },
              borderRadius: 12.r,
              textSize: 14.sp,
            ),
          ],
        ).withPadding(horizontal: 16.w),
      ),
    );
  }
}
