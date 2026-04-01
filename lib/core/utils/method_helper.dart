import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/succ_sheet.dart';
import 'package:madar_24/core/widgets/app_btn.dart';
import 'package:madar_24/core/widgets/app_sheet.dart';
import 'package:madar_24/core/widgets/confirmation_sheet.dart';
import 'package:madar_24/core/widgets/media_source_sheet.dart';
import 'package:madar_24/gen/locale_keys.g.dart';

class MethodHelper {
  static String? emailValidator(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return LocaleKeys.emailIsRequired.tr();
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(trimmed))
      return LocaleKeys.invalidEmailFormat.tr();
    return null;
  }

  static Future openSuccSheet({String? title}) async {
    showModalBottomSheet<void>(
      context: navigator.currentContext!,
      isDismissible: false,

      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (_) => SuccSheet(title: title),
    );
    await Future.delayed(2.seconds);
    Navigator.of(navigator.currentContext!).pop();
    return;
  }

  static Future<T?> sheet<T>(Widget child) {
    return showModalBottomSheet<T?>(
      context: navigator.currentContext!,
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        // Ensure the sheet content stays above the keyboard.
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: child,
      ),
    );
  }

  static Future<bool?> confirmationSheet({
    String? title,
    String? subTitle,
    String? image,
  }) {
    return showModalBottomSheet<bool?>(
      context: navigator.currentContext!,
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          ConfirmationSheet(title: title, subTitle: subTitle, image: image),
    );
  }

  static Future<XFile?> showMediaSourceSheet(BuildContext context) {
    return showModalBottomSheet<XFile?>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const MediaSourceSheet(),
    );
  }

  static Future<DateTime?> showCupertinoDatePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? minimumDate,
    DateTime? maximumDate,
    String? title,
  }) {
    final now = DateTime.now();
    final minDate = minimumDate ?? now.subtract(40.years);
    final maxDate = maximumDate ?? now.add(40.years);
    var tempDate = initialDate ?? now;

    return showCupertinoModalPopup<DateTime?>(
      context: context,
      builder: (_) => CustomAppSheet(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        title: title,
        children: [
          SizedBox(
            height: 220,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: tempDate,
              minimumDate: minDate,
              maximumDate: maxDate,
              onDateTimeChanged: (value) => tempDate = value,
            ),
          ),
          AppBtn(
            title: LocaleKeys.confirm.tr(),
            onPressed: () => Navigator.of(context).pop(tempDate),
          ),
        ],
      ),
    );
  }
}
