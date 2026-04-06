import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/back_widget.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/features/home/widget/appbar_icon.dart';
import 'package:madar_24/gen/assets.gen.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.horizontalSpace,
          CircleAvatar(radius: 20, child: CustomImage(Assets.icons.logo)),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحبا',
                  style: context.mediumText.copyWith(fontSize: 12.sp),
                ),
                Text(
                  'الرياض, حي المروج, شارع الياسمين, فيلا 1101',
                  style: context.mediumText.copyWith(
                    fontSize: 12.sp,
                    color: context.hintColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        AppbarIconWidget(imagePath: Assets.icons.heart),
        8.horizontalSpace,
        AppbarIconWidget(imagePath: Assets.icons.notificationBing),
        16.horizontalSpace,
      ],
    );
  }
}
