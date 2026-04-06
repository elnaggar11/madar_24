// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar_24/core/utils/extensions.dart';
import 'package:madar_24/features/home/widget/categories_item.dart';
import 'package:madar_24/features/home/widget/category_item.dart';
import 'package:madar_24/features/home/widget/high_rate_markets.dart';
import 'package:madar_24/features/home/widget/home_appbar.dart';
import 'package:madar_24/features/home/widget/home_field.dart';
import 'package:madar_24/features/home/widget/search.dart';
import 'package:madar_24/features/home/widget/slider_widget.dart';
import 'package:madar_24/gen/assets.gen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            SearchWidget(),
            24.verticalSpace,
            SliderWidget(),
            24.verticalSpace,
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16.0),
              child: Text(
                'اكتشف مدار 24!',
                style: context.boldText.copyWith(fontSize: 15.sp),
              ),
            ),
            16.verticalSpace,
            SizedBox(
              height: 110.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(start: 16.w),
                    child: CategoriesItem(
                      categoryName: 'سوبر ماركت',
                      gategoryPath: Assets.images.category.path,
                    ),
                  );
                },
              ),
            ),
            16.verticalSpace,
            HomeField(
              isOffer: true,
              fieldTitle: 'العروض',
              fieldWidget: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.w),
                    child: CategoryItem(
                      categoryName: 'تفاح أحمر 1 كيلو',
                      gategoryPath: Assets.images.category1.path,
                      marketTitle: 'كارفور',
                      rate: '2.5',
                      originalPrice: '50.00',
                      discountPrice: '40.00',
                      discountPercentage: '20',
                    ),
                  ),
                ),
              ),
            ),
            24.verticalSpace,
            HomeField(
              fieldTitle: 'المتاجر الأعلى تقييما',
              fieldWidget: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.w),
                    child: HighRateMarkets(
                      marketImagePath: Assets.images.market.path,
                      marketTitle: 'مترو ماركت',
                      rate: '2.5',
                      location:
                          'شارع 48 المدينة الصناعية الاولى الدمام 32234 المملكة العربية السعودية',
                    ),
                  ),
                ),
              ),
            ),
            24.verticalSpace,
            HomeField(
              fieldTitle: 'الأكثر مبيعا',
              fieldWidget: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.w),
                    child: CategoryItem(
                      categoryName: 'تفاح أحمر 1 كيلو',
                      gategoryPath: Assets.images.category1.path,
                      marketTitle: 'كارفور',
                      rate: '2.5',
                      originalPrice: '50.00',
                      discountPrice: '40.00',
                      discountPercentage: '20',
                    ),
                  ),
                ),
              ),
            ),
            24.verticalSpace,
            HomeField(
              fieldTitle: 'الأعلى تقييم',
              fieldWidget: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.w),
                    child: CategoryItem(
                      categoryName: 'تفاح أحمر 1 كيلو',
                      gategoryPath: Assets.images.category1.path,
                      marketTitle: 'كارفور',
                      rate: '2.5',
                      originalPrice: '50.00',
                      discountPrice: '40.00',
                      discountPercentage: '20',
                    ),
                  ),
                ),
              ),
            ),
            24.verticalSpace,
            HomeField(
              fieldTitle: 'مقترحات',
              fieldWidget: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.w),
                    child: CategoryItem(
                      categoryName: 'تفاح أحمر 1 كيلو',
                      gategoryPath: Assets.images.category1.path,
                      marketTitle: 'كارفور',
                      rate: '2.5',
                      originalPrice: '50.00',
                      discountPrice: '40.00',
                      discountPercentage: '20',
                    ),
                  ),
                ),
              ),
            ),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}
