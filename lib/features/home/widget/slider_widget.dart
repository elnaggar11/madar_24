import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:madar_24/core/widgets/custom_image.dart';
import 'package:madar_24/gen/assets.gen.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomImage(Assets.images.discountCard.path),
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 347 / 174,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        reverse: true,
      ),
    );
  }
}
