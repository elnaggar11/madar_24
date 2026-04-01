import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/models/country_model.dart';

class PhoneCountry extends StatefulWidget {
  final CountryModel? initCountry;
  final Function(CountryModel calue)? onSelect;
  const PhoneCountry({super.key, this.initCountry, required this.onSelect});

  @override
  State<PhoneCountry> createState() => _PhoneCountryState();
}

class _PhoneCountryState extends State<PhoneCountry> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: widget.initCountry == null
            ? []
            : [
                CustomImage(
                  widget.initCountry?.flag,
                  width: 21.w,
                  height: 15.h,
                  borderRadius: BorderRadius.circular(3.r),
                  fit: BoxFit.fill,
                ),
                Text(
                  '+${widget.initCountry?.phoneCode}',
                  textAlign: TextAlign.right,
                  style: context.regularText.copyWith(fontSize: 16),
                ),
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
