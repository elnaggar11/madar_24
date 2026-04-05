import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/features/layout/cubit/layout_cubit.dart';
import 'package:madar_24/gen/assets.gen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });
  final Function(int)? onTap;
  final int currentIndex;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(24),
        //   topRight: Radius.circular(24),
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 100,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navBarItem(
            Assets.icons.home,
            'الرئيسية',
            0,
            Assets.icons.selectedHome,
          ),
          navBarItem(
            Assets.icons.orders,
            'الطلبات',
            1,
            Assets.icons.selectedOrders,
          ),
          navBarItem(Assets.icons.cart, 'السلة', 2, Assets.icons.selectedCart),
          navBarItem(
            Assets.icons.profile,
            'حسابي',
            3,
            Assets.icons.selectedProfile,
          ),
        ],
      ),
    );
  }

  Widget navBarItem(
    String path,
    String title,
    int index,
    String pathActive, {
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          context.read<LayoutCubit>().changeTab(index);
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              context.read<LayoutCubit>().tabController.index == index
                  ? Column(
                      children: [
                        CustomImage(pathActive, width: 28, height: 28),
                        6.verticalSpace,
                        Text(
                          title,
                          style: context.boldText.copyWith(
                            fontSize: 12,
                            color: context.primaryColor,
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 27.0),
                      child: CustomImage(path, width: 24, height: 24),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
