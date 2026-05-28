// dart format width=100

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

  /// File path: assets/icons/ic_arrow_right.svg
  String get icArrowRight => 'assets/icons/ic_arrow_right.svg';

  /// File path: assets/icons/ic_credit_icon.png
  AssetGenImage get icCreditIcon => const AssetGenImage('assets/icons/ic_credit_icon.png');

  /// File path: assets/icons/ic_home.svg
  String get icHome => 'assets/icons/ic_home.svg';

  /// File path: assets/icons/ic_image_to_dance.svg
  String get icImageToDance => 'assets/icons/ic_image_to_dance.svg';

  /// File path: assets/icons/ic_image_to_video.svg
  String get icImageToVideo => 'assets/icons/ic_image_to_video.svg';

  /// File path: assets/icons/ic_question.svg
  String get icQuestion => 'assets/icons/ic_question.svg';

  /// File path: assets/icons/ic_star_vip.png
  AssetGenImage get icStarVip => const AssetGenImage('assets/icons/ic_star_vip.png');

  /// File path: assets/icons/ic_translate_video.svg
  String get icTranslateVideo => 'assets/icons/ic_translate_video.svg';

  /// File path: assets/icons/ic_unifiled_video.svg
  String get icUnifiledVideo => 'assets/icons/ic_unifiled_video.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// List of all assets
  List<dynamic> get values => [
    icArrowRight,
    icCreditIcon,
    icHome,
    icImageToDance,
    icImageToVideo,
    icQuestion,
    icStarVip,
    icTranslateVideo,
    icUnifiledVideo,
    profile,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ai_nav_icon.svg
  String get aiNavIcon => 'assets/images/ai_nav_icon.svg';

  /// File path: assets/images/arrow_right.svg
  String get arrowRight => 'assets/images/arrow_right.svg';

  /// File path: assets/images/bg_app.png
  AssetGenImage get bgApp => const AssetGenImage('assets/images/bg_app.png');

  /// File path: assets/images/bg_splash.png
  AssetGenImage get bgSplash => const AssetGenImage('assets/images/bg_splash.png');

  /// File path: assets/images/card_1.png
  AssetGenImage get card1 => const AssetGenImage('assets/images/card_1.png');

  /// File path: assets/images/card_2.png
  AssetGenImage get card2 => const AssetGenImage('assets/images/card_2.png');

  /// File path: assets/images/credit_icon.png
  AssetGenImage get creditIcon => const AssetGenImage('assets/images/credit_icon.png');

  /// File path: assets/images/ellipse.svg
  String get ellipse => 'assets/images/ellipse.svg';

  /// File path: assets/images/empty_history.png
  AssetGenImage get emptyHistory => const AssetGenImage('assets/images/empty_history.png');

  /// File path: assets/images/home_banner.png
  AssetGenImage get homeBanner => const AssetGenImage('assets/images/home_banner.png');

  /// File path: assets/images/ic_radio_active.svg
  String get icRadioActive => 'assets/images/ic_radio_active.svg';

  /// File path: assets/images/ic_radio_inactive.svg
  String get icRadioInactive => 'assets/images/ic_radio_inactive.svg';

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/nav_home.svg
  String get navHome => 'assets/images/nav_home.svg';

  /// File path: assets/images/nav_user.svg
  String get navUser => 'assets/images/nav_user.svg';

  /// File path: assets/images/ob_1.png
  AssetGenImage get ob1 => const AssetGenImage('assets/images/ob_1.png');

  /// File path: assets/images/ob_2.png
  AssetGenImage get ob2 => const AssetGenImage('assets/images/ob_2.png');

  /// File path: assets/images/ob_3.png
  AssetGenImage get ob3 => const AssetGenImage('assets/images/ob_3.png');

  /// File path: assets/images/ob_4.png
  AssetGenImage get ob4 => const AssetGenImage('assets/images/ob_4.png');

  /// File path: assets/images/ob_5.png
  AssetGenImage get ob5 => const AssetGenImage('assets/images/ob_5.png');

  /// File path: assets/images/premium_banner.png
  AssetGenImage get premiumBanner => const AssetGenImage('assets/images/premium_banner.png');

  /// File path: assets/images/pro_badge_icon.png
  AssetGenImage get proBadgeIcon => const AssetGenImage('assets/images/pro_badge_icon.png');

  /// List of all assets
  List<dynamic> get values => [
    aiNavIcon,
    arrowRight,
    bgApp,
    bgSplash,
    card1,
    card2,
    creditIcon,
    ellipse,
    emptyHistory,
    homeBanner,
    icRadioActive,
    icRadioInactive,
    logo,
    navHome,
    navUser,
    ob1,
    ob2,
    ob3,
    ob4,
    ob5,
    premiumBanner,
    proBadgeIcon,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}, this.animation});

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
