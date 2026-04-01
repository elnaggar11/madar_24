import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';

import '../utils/extensions.dart';

class CustomAppSheet extends StatelessWidget {
  final String? title;
  final List<Widget>? children;
  final EdgeInsetsGeometry? padding;
  final bool isScrollable;
  const CustomAppSheet({
    super.key,
    this.title,
    this.children,
    this.padding,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: context.primaryColorLight,
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      constraints: BoxConstraints(maxHeight: context.h / 1.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          Row(
            spacing: 12.w,
            children: [
              Expanded(
                child: Text(
                  title ?? "",
                  style: context.mediumText.copyWith(fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: CustomImage(Assets.icons.closeCircle),
              ),
            ],
          ).withPadding(horizontal: 16.w, bottom: 16.h),
          Flexible(
            child: isScrollable
                ? SingleChildScrollView(
                    padding: (padding ?? EdgeInsets.zero),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: children ?? [],
                    ),
                  )
                : Padding(
                    padding: (padding ?? EdgeInsets.zero),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: children ?? [],
                    ),
                  ),
          ),
          SafeArea(top: false, child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
