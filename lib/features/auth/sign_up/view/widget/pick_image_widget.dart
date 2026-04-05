import 'package:flutter/material.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CustomImage(Assets.icons.pickImage),
    );
  }
}
