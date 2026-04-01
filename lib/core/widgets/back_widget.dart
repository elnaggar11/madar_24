import 'package:flutter/material.dart';
import 'package:madar_24/core/utils/extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final bool withLeading;
  final List<Widget>? actions;
  final void Function()? onBack;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  const CustomAppBar({
    super.key,
    this.title,
    this.withLeading = true,
    this.actions,
    this.onBack,
    this.titleWidget,
    this.bottom,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? context.primaryColorLight,
      title: title != null
          ? Text(title!, style: context.mediumText.copyWith(fontSize: 16))
          : titleWidget,
      centerTitle: false,
      // leadingWidth: withLeading ? 60.w : null,
      automaticallyImplyLeading: false,
      bottom: bottom,
      leading: (() {
        if (withLeading) {
          return IconButton(
            onPressed: () {
              if (onBack != null) {
                onBack!();
              } else {
                Navigator.pop(context);
              }
            },
            icon: Icon(
              Icons.keyboard_backspace_sharp,
              color: context.textPrimaryColor,
            ),
          );
        }
      })(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
