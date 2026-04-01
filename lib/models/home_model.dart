import 'package:madar_24/models/category_model.dart';
import 'package:madar_24/models/product_model.dart';
import 'package:madar_24/models/service_model.dart';
import 'package:madar_24/models/slider_model.dart';

import 'base.dart';
import 'company_model.dart';

class HomeModel extends Model {
  late final List<SliderModel> sliders;
  late final List<ServiceModel> serviceCategories;
  late final List<CategoryModel> productCategories;
  late final List<ProductModel> featuredProducts;

  late final List<StoreModel> stores;

  HomeModel.fromJson([Map<String, dynamic>? json]) {
    sliders = listFromJson<SliderModel>(
      json,
      "sliders",
      callback: (e) => SliderModel.fromJson(e),
    );
    serviceCategories = listFromJson<ServiceModel>(
      json,
      "featured_services",
      callback: (e) => ServiceModel.fromJson(e),
    );
    productCategories = listFromJson<CategoryModel>(
      json,
      "product_categories",
      callback: (e) => CategoryModel.fromJson(e),
    );
    featuredProducts = listFromJson<ProductModel>(
      json,
      "featured_products",
      callback: (e) => ProductModel.fromJson(e),
    );

    stores = listFromJson<StoreModel>(
      json,
      "stores",
      callback: (e) => StoreModel.fromJson(e),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    "sliders": sliders.map((slider) => slider.toJson()).toList(),
    "service_categories": serviceCategories
        .map((category) => category.toJson())
        .toList(),
    "product_categories": productCategories
        .map((category) => category.toJson())
        .toList(),
    "featured_products": featuredProducts
        .map((product) => product.toJson())
        .toList(),
    "stores": stores.map((store) => store.toJson()).toList(),
  };
}
