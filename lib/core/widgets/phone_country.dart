import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';
import 'package:madar_24/models/country_model.dart';

class PhoneCountry extends StatefulWidget {
  final CountryModel? initCountry;
  final Function(CountryModel value)? onSelect;
  const PhoneCountry({super.key, this.initCountry, required this.onSelect});

  @override
  State<PhoneCountry> createState() => _PhoneCountryState();
}

class _PhoneCountryState extends State<PhoneCountry> {
  String _currentCode = '966';

  @override
  void initState() {
    super.initState();
    if (widget.initCountry != null) {
      _currentCode = widget.initCountry!.phoneCode;
    }
  }

  @override
  void didUpdateWidget(covariant PhoneCountry oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initCountry != null &&
        widget.initCountry != oldWidget.initCountry) {
      _currentCode = widget.initCountry!.phoneCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final bool useSaudiDefault = _currentFlag.isEmpty;

    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18.h,
            color: context.hintColor,
          ),
          4.horizontalSpace,
          Text(
            '$_currentCode +',
            textAlign: TextAlign.right,
            style: context.regularText.copyWith(fontSize: 16),
          ),
          CustomImage(
            Assets.icons.saudiArabiaFlag,
            width: 21.w,
            height: 15.h,
            borderRadius: BorderRadius.circular(3.r),
            fit: BoxFit.fill,
          ),
          8.horizontalSpace,
          Text(
            '|',
            style: context.boldText.copyWith(
              fontSize: 16,
              color: context.textSecondaryColor.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    ).withPadding(start: 16.w, end: 4.w);
  }
}
