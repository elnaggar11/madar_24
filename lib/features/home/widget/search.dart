import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/core/widgets/app_field.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppField(
      hintText: 'البحث عن منتج, متجر',
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomImage(Assets.icons.search, width: 20, height: 20),
      ),
    ).withPadding(horizontal: 16.w);
  }
}
