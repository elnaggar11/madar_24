import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/widgets/loading.dart';

import '../utils/extensions.dart';

class AppBtn extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  final bool loading, enable, safeArea;
  final Color? backgroundColor, textColor, borderColor;
  final Widget? icon, child;
  final double? height, width, textSize, borderRadius;

  const AppBtn({
    super.key,
    this.title,
    this.onPressed,
    this.loading = false,
    this.safeArea = true,
    this.backgroundColor,
    this.height,
    this.borderColor,
    this.width,
    this.icon,
    this.textColor,
    this.enable = true,
    this.child,
    this.textSize,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: safeArea,
      child: ElevatedButton(
        onPressed: () {
          if (!loading && enable) onPressed?.call();
        },
        style: ButtonStyle(
          elevation: !enable || loading || backgroundColor?.a != 1
              ? WidgetStateProperty.all(0)
              : null,
          side: WidgetStateProperty.all(
            BorderSide(
              style: BorderStyle.solid,
              color: borderColor ?? textColor ?? Colors.transparent,
              width: 1.0,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 24.r),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            (backgroundColor ?? context.primaryColor).withValues(
              alpha: loading || !enable
                  ? 0.4
                  : (backgroundColor ?? context.secondaryColor).a,
            ),
          ),
        ),
        child: Container(
          height: height ?? 56.h,
          width: width ?? double.infinity,
          alignment: Alignment.center,
          child:
              child ??
              Row(
                spacing: 4.w,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (loading)
                    CustomProgress(
                      size: 15.h,
                      color: (textColor ?? context.primaryColorLight),
                    ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title ?? "",
                          style: context.mediumText.copyWith(
                            fontSize: textSize ?? 15,
                            color: textColor ?? context.primaryColorLight,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (icon != null) ...[icon!, SizedBox(width: 5.w)],
                      ],
                    ),
                  ),
                  if (loading) SizedBox(width: 15.h),
                ],
              ),
        ),
      ),
    );
  }
}
