import 'base.dart';

class ProductModel extends Model {
  late final String name;
  late final String storeName;
  late final String image;
  late final double price;
  late final double avgRate;
  late final String description;
  late final String categoryId;
  late final String storeId;
  late  bool isFav;
  ProductModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, "id");
    name = stringFromJson(json, "name");
    storeName = stringFromJson(json, "store_name");
    image = stringFromJson(json?["image"], "path");
    price = doubleFromJson(json, "price");
    avgRate = doubleFromJson(json, "avg_rate");
    description = stringFromJson(json, "description");
    categoryId = stringFromJson(json, "category_id");
    storeId = stringFromJson(json, "store_id");
    isFav = boolFromJson(json, "is_fav");
  }

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": {"path": image},
    "price": price,
    "description": description,
    "category_id": categoryId,
    "store_id": storeId,
    "is_fav": isFav,
  };
}
