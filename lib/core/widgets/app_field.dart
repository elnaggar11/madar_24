import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/method_helper.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/core/widgets/phone_country.dart';
import 'package:madar_24/gen/assets.gen.dart';
import 'package:madar_24/models/country_model.dart';

import '../../gen/locale_keys.g.dart';
import '../utils/extensions.dart';
import 'loading.dart';

class AppField extends StatefulWidget {
  final String? hintText, title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String? v)? validator;
  final bool isRequired, loading;
  final int maxLines;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;

  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Widget? suffixIcon, suffix, prefixIcon;
  final Color? fillColor;
  final String? initialValue, labelText;
  final bool withBorder;
  final bool readOnly;
  final bool arabicOnly;
  final InputBorder? border;
  final bool? obscureText;
  final CountryModel? initCountry;
  final Function(CountryModel value)? onSelectCountry;

  const AppField({
    super.key,
    this.hintText,
    this.controller,
    this.maxLength,
    this.keyboardType,
    this.validator,
    this.isRequired = true,
    this.loading = false,
    this.onTap,
    this.onChanged,
    this.maxLines = 1,
    this.suffixIcon,
    this.fillColor,
    this.prefixIcon,
    this.title,
    this.initialValue,
    this.withBorder = true,
    this.border,
    this.readOnly = false,
    this.arabicOnly = false,
    this.suffix,
    this.obscureText,
    this.labelText,
    this.initCountry,
    this.onSelectCountry,
    this.onFieldSubmitted,
    this.textInputAction,
  });

  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  final _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: context.semiboldText.copyWith(
              fontSize: 15,
              color: context.textPrimaryColor,
            ),
          ),
          10.verticalSpace,
        ],
        Directionality(
          textDirection: context.locale.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: TextFormField(
            focusNode: _focusNode,

            initialValue: widget.initialValue,
            onChanged: widget.onChanged,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly || widget.onTap != null,
            onTap: widget.onTap,

            obscureText:
                widget.obscureText ??
                (widget.keyboardType == TextInputType.visiblePassword &&
                    !showPass),
            controller: widget.controller,
            keyboardType: TextInputType.number == widget.keyboardType
                ? const TextInputType.numberWithOptions(signed: true)
                : widget.keyboardType,
            validator: (v) {
              final emailRegex = RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              );
              if (v?.isEmpty == true) {
                if (!widget.isRequired) return null;
                return LocaleKeys.thisFieldIsRequired.tr();
              } else if (widget.keyboardType == TextInputType.emailAddress &&
                  v!.isNotEmpty &&
                  !emailRegex.hasMatch(v)) {
                return LocaleKeys.invalidEmailAddress.tr();
              } else if (widget.keyboardType == TextInputType.visiblePassword &&
                  v!.length < 8) {
                return LocaleKeys.thePasswordMustBeAtLeast_8Characters.tr();
              } else if (widget.validator != null) {
                return widget.validator?.call(v);
              } else if (widget.keyboardType == TextInputType.emailAddress) {
                return MethodHelper.emailValidator(v);
              }
              return null;
            },
            inputFormatters: [
              if (widget.arabicOnly)
                FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z]')),
              if ([
                TextInputType.phone,
                TextInputType.number,
              ].contains(widget.keyboardType))
                FilteringTextInputFormatter.digitsOnly,
              if ([TextInputType.phone].contains(widget.keyboardType))
                LengthLimitingTextInputFormatter(10),
            ],
            onFieldSubmitted: widget.onFieldSubmitted,

            style: context.regularText.copyWith(fontSize: 15),
            textInputAction:
                widget.textInputAction ??
                (widget.maxLines == 1
                    ? TextInputAction.done
                    : TextInputAction.newline),
            decoration: InputDecoration(
              floatingLabelStyle: context.regularText.copyWith(
                color: context.primaryColor,
                fontSize: 14,
              ),
              helperStyle: context.regularText.copyWith(
                fontSize: 12,
                color: context.textSecondaryColor,
              ),
              suffix: widget.suffix,
              labelText: widget.labelText,
              labelStyle: context.regularText.copyWith(
                color: context.hintColor,
                fontSize: 14,
              ),
              hintText:
                  widget.hintText ??
                  (widget.onTap != null
                      ? LocaleKeys.selected.tr(args: [widget.title ?? ''])
                      : LocaleKeys.enter.tr(args: [widget.title ?? ''])),
              fillColor: widget.fillColor,
              prefixIcon: buildPrefixIcon(context),
              suffixIcon: buildSuffixIcon(context),
              border:
                  widget.border ??
                  (widget.withBorder ? null : InputBorder.none),
              errorBorder:
                  widget.border ??
                  (widget.withBorder ? null : InputBorder.none),
              enabledBorder:
                  widget.border ??
                  (widget.withBorder ? null : InputBorder.none),
              focusedBorder:
                  widget.border ??
                  (widget.withBorder ? null : InputBorder.none),
              disabledBorder:
                  widget.border ??
                  (widget.withBorder ? null : InputBorder.none),
              focusedErrorBorder:
                  widget.border ??
                  (widget.withBorder ? null : InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }

  bool showPass = false;

  buildSuffixIcon(BuildContext context) {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    } else if (widget.loading) {
      return SizedBox(
        height: 20.h,
        width: 20.h,
        child: CustomProgress(size: 15.h),
      );
    } else if (widget.onTap != null) {
      return Icon(
        Icons.keyboard_arrow_down_sharp,
        size: 18.h,
        color: context.hintColor,
      );
    } else if (widget.keyboardType == TextInputType.visiblePassword) {
      return GestureDetector(
        onTap: () {
          setState(() {
            showPass = !showPass;
          });
        },
        child: CustomImage(
          showPass ? Assets.icons.eyeSlash : Assets.icons.eye,
          height: 22.h,
          width: 22.h,
        ),
      );
    }
  }

  buildPrefixIcon(BuildContext context) {
    if (widget.keyboardType == TextInputType.phone) {
      return PhoneCountry(
        onSelect: widget.onSelectCountry,
        initCountry: widget.initCountry,
      );
    }

    return widget.prefixIcon?.withPadding(horizontal: 14.w);
  }
}
