import 'base.dart';

class CartModel extends Model {
  late final List<CartItemModle> items;
  late final CartSummaryModel summary;

  CartModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, "id");
    items = listFromJson<CartItemModle>(json, "items", callback: (e) => CartItemModle.fromJson(e));
    summary = CartSummaryModel.fromJson(json?["summary"] as Map<String, dynamic>?);
  }

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "items": items.map((e) => e.toJson()).toList(),
    "summary": summary.toJson(),
  };
}

class CartItemModle extends Model {
  late final CartProductModel product;
  late final int quantity;
  late final double unitPrice;
  late final double total;

  CartItemModle.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, "id");
    product = CartProductModel.fromJson(json?["product"] as Map<String, dynamic>?);
    quantity = intFromJson(json, "quantity");
    unitPrice = doubleFromJson(json, "unit_price");
    total = doubleFromJson(json, "total");
  }

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product.toJson(),
    "quantity": quantity,
    "unit_price": unitPrice,
    "total": total,
  };
}

class CartProductModel extends Model {
  late final String name;
  late final String description;
  late final double price;
  late final String image;
  late final String storeId;

  CartProductModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, "id");
    name = stringFromJson(json, "name");
    description = stringFromJson(json, "description");
    price = doubleFromJson(json, "price");
    image = stringFromJson(json?["image"], "path");
    storeId = stringFromJson(json, "store_id");
  }

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "image": {"path": image},
    "store_id": storeId,
  };
}

// class CartSummaryModel extends Model {
//   late final double subtotal;
//   late final double deliveryFees;
//   late final double codFees;
//   late final double total;
//   late final int storesCount;
//   late final LoyaltyInfoModel loyalty;

//   CartSummaryModel.fromJson([Map<String, dynamic>? json]) {
//     subtotal = doubleFromJson(json, "subtotal");
//     deliveryFees = doubleFromJson(json, "delivery_fees");
//     codFees = doubleFromJson(json, "cod_fees");
//     total = doubleFromJson(json, "total");
//     storesCount = intFromJson(json, "stores_count");
//     loyalty = LoyaltyInfoModel.fromJson(json?["loyalty"] as Map<String, dynamic>?);
//   }

//   @override
//   Map<String, dynamic> toJson() => {
//     "subtotal": 22,
//     "delivery_fees": 0,
//     "cod_fees": 0,
//     "total": 22,
//     "stores_count": 1,
//     "loyalty": {
//       "enabled": true,
//       "points_balance": 100,
//       "point_value": 10.5,
//       "max_usable_points": 1,
//       "max_usable_value": 10.5,
//       "requested_points": null,
//       "can_use_points": true,
//       "cannot_use_points_reason": null,
//       "remaining_after_loyalty": 11.5,
//       "min_order_amount": 10,
//       "max_points_per_order": 1,
//       "expiry_days": 0,
//     },
//     "wallet": {
//       "balance": 0,
//       "max_usable_value": 0,
//       "can_cover_remaining_after_loyalty": false,
//       "remaining_after_wallet": 11.5,
//     },
//     "payment_coverage": {
//       "can_pay_full_by_loyalty_and_wallet": false,
//       "requires_external_payment": true,
//     },
//   };
// }

class CartSummaryModel extends Model {
  late final double subtotal;
  late final double deliveryFees;
  late final double codFees;
  late final double total;
  late final int storesCount;

  // loyalty
  late final bool loyaltyEnabled;
  late final int pointsBalance;
  late final double pointValue;
  late final int maxUsablePoints;
  late final double maxUsableValue;
  late final int? requestedPoints;
  late final bool canUsePoints;
  late final String? cannotUsePointsReason;
  late final double remainingAfterLoyalty;
  late final double minOrderAmount;
  late final int maxPointsPerOrder;
  late final int expiryDays;

  // wallet
  late final double walletBalance;
  late final double walletMaxUsableValue;
  late final bool canCoverRemainingAfterLoyalty;
  late final double remainingAfterWallet;

  // payment coverage
  late final bool canPayFullByLoyaltyAndWallet;
  late final bool requiresExternalPayment;

  CartSummaryModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, "id");

    subtotal = doubleFromJson(json, "subtotal");
    deliveryFees = doubleFromJson(json, "delivery_fees");
    codFees = doubleFromJson(json, "cod_fees");
    total = doubleFromJson(json, "total");
    storesCount = intFromJson(json, "stores_count");

    final loyaltyJson = json?['loyalty'];
    loyaltyEnabled = boolFromJson(loyaltyJson, "enabled");
    pointsBalance = intFromJson(loyaltyJson, "points_balance");
    pointValue = doubleFromJson(loyaltyJson, "point_value");
    maxUsablePoints = intFromJson(loyaltyJson, "max_usable_points");
    maxUsableValue = doubleFromJson(loyaltyJson, "max_usable_value");
    requestedPoints = intNullFromJson(loyaltyJson, "requested_points");
    canUsePoints = boolFromJson(loyaltyJson, "can_use_points");
    cannotUsePointsReason = stringNullFromJson(loyaltyJson, "cannot_use_points_reason");
    remainingAfterLoyalty = doubleFromJson(loyaltyJson, "remaining_after_loyalty");
    minOrderAmount = doubleFromJson(loyaltyJson, "min_order_amount");
    maxPointsPerOrder = intFromJson(loyaltyJson, "max_points_per_order");
    expiryDays = intFromJson(loyaltyJson, "expiry_days");

    final walletJson = json?['wallet'];
    walletBalance = doubleFromJson(walletJson, "balance");
    walletMaxUsableValue = doubleFromJson(walletJson, "max_usable_value");
    canCoverRemainingAfterLoyalty = boolFromJson(walletJson, "can_cover_remaining_after_loyalty");
    remainingAfterWallet = doubleFromJson(walletJson, "remaining_after_wallet");

    final paymentCoverageJson = json?['payment_coverage'];
    canPayFullByLoyaltyAndWallet = boolFromJson(
      paymentCoverageJson,
      "can_pay_full_by_loyalty_and_wallet",
    );
    requiresExternalPayment = boolFromJson(paymentCoverageJson, "requires_external_payment");
  }

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "subtotal": subtotal,
    "delivery_fees": deliveryFees,
    "cod_fees": codFees,
    "total": total,
    "stores_count": storesCount,
  };
}
