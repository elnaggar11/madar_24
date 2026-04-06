// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_down.svg
  String get arrowDown => 'assets/icons/arrow_down.svg';

  /// File path: assets/icons/arrow_left.svg
  String get arrowLeft => 'assets/icons/arrow_left.svg';

  /// File path: assets/icons/cart.svg
  String get cart => 'assets/icons/cart.svg';

  /// File path: assets/icons/category.svg
  String get category => 'assets/icons/category.svg';

  /// File path: assets/icons/category1.svg
  String get category1 => 'assets/icons/category1.svg';

  /// File path: assets/icons/chas_method.svg
  String get chasMethod => 'assets/icons/chas_method.svg';

  /// File path: assets/icons/close-circle.svg
  String get closeCircle => 'assets/icons/close-circle.svg';

  /// File path: assets/icons/eye-slash.svg
  String get eyeSlash => 'assets/icons/eye-slash.svg';

  /// File path: assets/icons/eye.svg
  String get eye => 'assets/icons/eye.svg';

  /// File path: assets/icons/heart.svg
  String get heart => 'assets/icons/heart.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/notification_bing.svg
  String get notificationBing => 'assets/icons/notification_bing.svg';

  /// File path: assets/icons/orders.svg
  String get orders => 'assets/icons/orders.svg';

  /// File path: assets/icons/pick_image.svg
  String get pickImage => 'assets/icons/pick_image.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/sar_coin.svg
  String get sarCoin => 'assets/icons/sar_coin.svg';

  /// File path: assets/icons/saudi_arabia_flag.svg
  String get saudiArabiaFlag => 'assets/icons/saudi_arabia_flag.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/selected_cart.svg
  String get selectedCart => 'assets/icons/selected_cart.svg';

  /// File path: assets/icons/selected_home.svg
  String get selectedHome => 'assets/icons/selected_home.svg';

  /// File path: assets/icons/selected_orders.svg
  String get selectedOrders => 'assets/icons/selected_orders.svg';

  /// File path: assets/icons/selected_profile.svg
  String get selectedProfile => 'assets/icons/selected_profile.svg';

  /// File path: assets/icons/splash_logo.svg
  String get splashLogo => 'assets/icons/splash_logo.svg';

  /// File path: assets/icons/star.svg
  String get star => 'assets/icons/star.svg';

  /// List of all assets
  List<String> get values => [
    arrowDown,
    arrowLeft,
    cart,
    category,
    category1,
    chasMethod,
    closeCircle,
    eyeSlash,
    eye,
    heart,
    home,
    location,
    logo,
    notificationBing,
    orders,
    pickImage,
    profile,
    sarCoin,
    saudiArabiaFlag,
    search,
    selectedCart,
    selectedHome,
    selectedOrders,
    selectedProfile,
    splashLogo,
    star,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Discount Card.png
  AssetGenImage get discountCard =>
      const AssetGenImage('assets/images/Discount Card.png');

  /// File path: assets/images/category.png
  AssetGenImage get category =>
      const AssetGenImage('assets/images/category.png');

  /// File path: assets/images/category1.jpg
  AssetGenImage get category1 =>
      const AssetGenImage('assets/images/category1.jpg');

  /// File path: assets/images/empity.png
  AssetGenImage get empity => const AssetGenImage('assets/images/empity.png');

  /// File path: assets/images/market.png
  AssetGenImage get market => const AssetGenImage('assets/images/market.png');

  /// File path: assets/images/succ.gif
  AssetGenImage get succ => const AssetGenImage('assets/images/succ.gif');

  /// File path: assets/images/visa.png
  AssetGenImage get visa => const AssetGenImage('assets/images/visa.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    discountCard,
    category,
    category1,
    empity,
    market,
    succ,
    visa,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar-EG.json
  String get arEG => 'assets/translations/ar-EG.json';

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// List of all assets
  List<String> get values => [arEG, enUS];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
