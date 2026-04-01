import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/extensions.dart';

class CustomPinCode extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onCompleted;
  final int length;
  const CustomPinCode({super.key, this.controller, this.onCompleted, this.length = 6});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        pastedTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        length: length,
        hintCharacter: '-',
        controller: controller,
        obscureText: false,
        textStyle: context.mediumText.copyWith(fontSize: 13, color: context.primaryColor),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        hintStyle: TextStyle(color: context.hintColor),
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          activeColor: context.primaryColor,
          selectedColor: context.primaryColor,
          activeFillColor: context.primaryColorLight,
          borderWidth: 1.r,
          // activeFillColor: context.theme.scaffoldBackgroundColor,
          selectedFillColor: context.primaryColorLight,
          inactiveColor: context.hoverColor,
          inactiveFillColor: context.primaryColorLight,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(20.r),

          fieldHeight: (context.w - 65.w) / length,
          fieldWidth: (context.w - 65.w) / length,
        ),
        cursorColor: Colors.black,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        autovalidateMode: AutovalidateMode.always,
        keyboardType: TextInputType.number,
        animationCurve: Curves.easeInOutQuad,
        enablePinAutofill: true,
        useExternalAutoFillGroup: true,
        onChanged: (value) {},
        validator: (value) => value?.length == length ? null : "",
        onCompleted: onCompleted,
        beforeTextPaste: (text) {
          return false;
        },
      ),
    );
  }
}
