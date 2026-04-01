import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/gen/fonts.gen.dart';
import 'package:madar_24/gen/locale_keys.g.dart';

import '../utils/extensions.dart';
import 'app_btn.dart';
import 'app_sheet.dart';

class SlelectItemSheet extends StatefulWidget {
  final List<dynamic> items;
  final dynamic selectedItem;
  final String? title;
  final bool withConfirmBtn;
  const SlelectItemSheet({
    super.key,
    required this.items,
    this.selectedItem,
    this.title,
    this.withConfirmBtn = false,
  });

  @override
  State<SlelectItemSheet> createState() => _SlelectItemSheetState();
}

class _SlelectItemSheetState extends State<SlelectItemSheet> {
  late dynamic selectedItem = widget.selectedItem;
  @override
  Widget build(BuildContext context) {
    return CustomAppSheet(
      title: widget.title,
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(widget.items.length, (i) {
                return GestureDetector(
                  onTap: () {
                    if (widget.withConfirmBtn) {
                      selectedItem = widget.items[i];
                      setState(() {});
                    } else {
                      Navigator.pop(context, widget.items[i]);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 12.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: context.hoverColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.items[i].name,
                            style: context.mediumText.copyWith(
                              fontSize: 13,
                              fontFamily:
                                  widget.items[i].name.toString().isArabic
                                  ? FontFamily.uRWDINArabic
                                  : FontFamily.uRWDINArabic,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Opacity(
                          opacity: widget.items[i] == selectedItem ? 1 : 0,
                          child: Icon(Icons.check, color: context.primaryColor),
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
              log('$selectedItem');
              if (selectedItem == null) return;
              Navigator.pop(context, selectedItem);
            },
          ).withPadding(horizontal: 20.w, vertical: 12.h),
      ],
    );
  }
}

class SlelectMultipleItemSheet extends StatefulWidget {
  final List items;
  final List? selectedItem;
  final String? title;
  const SlelectMultipleItemSheet({
    super.key,
    required this.items,
    this.selectedItem,
    this.title,
  });

  @override
  State<SlelectMultipleItemSheet> createState() =>
      _SlelectMultipleItemSheetState();
}

class _SlelectMultipleItemSheetState extends State<SlelectMultipleItemSheet> {
  late List selectedItem = [
    if (widget.selectedItem?.isNotEmpty == true) ...widget.selectedItem!,
  ];
  @override
  Widget build(BuildContext context) {
    return CustomAppSheet(
      title: widget.title,
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(widget.items.length, (i) {
                final selected = selectedItem.contains(widget.items[i]);
                return GestureDetector(
                  onTap: () {
                    if (selected) {
                      selectedItem.remove(widget.items[i]);
                    } else {
                      selectedItem.add(widget.items[i]);
                    }
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 6.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: context.hoverColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.items[i].name,
                            style: context.mediumText.copyWith(fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: Checkbox(
                            value: selected,
                            onChanged: null,
                            activeColor: context.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: AppBtn(
                safeArea: false,
                borderColor: context.primaryColor,
                backgroundColor: context.primaryColorLight,
                textColor: context.primaryColor,
                title: LocaleKeys.resetAll.tr(),
                onPressed: () {
                  selectedItem.clear();
                  setState(() {});
                },
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppBtn(
                safeArea: false,
                title: LocaleKeys.apply.tr(),
                onPressed: () {
                  Navigator.pop(context, selectedItem);
                },
              ),
            ),
          ],
        ).withPadding(horizontal: 20.w, bottom: 12.h),
      ],
    );
  }
}
