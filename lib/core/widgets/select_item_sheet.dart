import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/app_btn.dart';
import 'package:madar_24/core/widgets/app_sheet.dart';
import 'package:madar_24/gen/locale_keys.g.dart';

class SelectItemSheet<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T item) itemLabel;
  final String? title;
  final bool withConfirmBtn;

  const SelectItemSheet({
    super.key,
    required this.items,
    required this.itemLabel,
    this.selectedItem,
    this.title,
    this.withConfirmBtn = false,
  });

  @override
  State<SelectItemSheet<T>> createState() => _SelectItemSheetState<T>();
}

class _SelectItemSheetState<T> extends State<SelectItemSheet<T>> {
  late T? selectedItem = widget.selectedItem;

  @override
  Widget build(BuildContext context) {
    return CustomAppSheet(
      title: widget.title,
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(widget.items.length, (i) {
                final item = widget.items[i];
                return GestureDetector(
                  onTap: () {
                    if (widget.withConfirmBtn) {
                      selectedItem = item;
                      setState(() {});
                    } else {
                      Navigator.pop(context, item);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(12.r),
                      border: i == widget.items.length - 1
                          ? null
                          : Border(
                              bottom: BorderSide(color: context.borderColor),
                            ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.itemLabel(item),
                            style: context.mediumText.copyWith(fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Opacity(
                          opacity: item == selectedItem ? 1 : 0,
                          child: Icon(Icons.check),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        if (widget.withConfirmBtn)
          AppBtn(
            safeArea: false,
            title: LocaleKeys.confirm.tr(),
            onPressed: () {
              if (selectedItem == null) return;
              Navigator.pop(context, selectedItem);
            },
          ).withPadding(horizontal: 20.w, vertical: 12.h),
      ],
    );
  }
}
