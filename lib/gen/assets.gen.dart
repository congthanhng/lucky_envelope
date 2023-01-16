/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesEnvolopesGen get envolopes => const $AssetsImagesEnvolopesGen();
  $AssetsImagesMoneyGen get money => const $AssetsImagesMoneyGen();
}

class $AssetsImagesEnvolopesGen {
  const $AssetsImagesEnvolopesGen();

  /// File path: assets/images/envolopes/envolope1.png
  AssetGenImage get envolope1 =>
      const AssetGenImage('assets/images/envolopes/envolope1.png');

  /// File path: assets/images/envolopes/envolope10.png
  AssetGenImage get envolope10 =>
      const AssetGenImage('assets/images/envolopes/envolope10.png');

  /// File path: assets/images/envolopes/envolope11.png
  AssetGenImage get envolope11 =>
      const AssetGenImage('assets/images/envolopes/envolope11.png');

  /// File path: assets/images/envolopes/envolope12.png
  AssetGenImage get envolope12 =>
      const AssetGenImage('assets/images/envolopes/envolope12.png');

  /// File path: assets/images/envolopes/envolope2.png
  AssetGenImage get envolope2 =>
      const AssetGenImage('assets/images/envolopes/envolope2.png');

  /// File path: assets/images/envolopes/envolope3.png
  AssetGenImage get envolope3 =>
      const AssetGenImage('assets/images/envolopes/envolope3.png');

  /// File path: assets/images/envolopes/envolope4.png
  AssetGenImage get envolope4 =>
      const AssetGenImage('assets/images/envolopes/envolope4.png');

  /// File path: assets/images/envolopes/envolope5.png
  AssetGenImage get envolope5 =>
      const AssetGenImage('assets/images/envolopes/envolope5.png');

  /// File path: assets/images/envolopes/envolope6.png
  AssetGenImage get envolope6 =>
      const AssetGenImage('assets/images/envolopes/envolope6.png');

  /// File path: assets/images/envolopes/envolope7.png
  AssetGenImage get envolope7 =>
      const AssetGenImage('assets/images/envolopes/envolope7.png');

  /// File path: assets/images/envolopes/envolope8.png
  AssetGenImage get envolope8 =>
      const AssetGenImage('assets/images/envolopes/envolope8.png');

  /// File path: assets/images/envolopes/envolope9.png
  AssetGenImage get envolope9 =>
      const AssetGenImage('assets/images/envolopes/envolope9.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        envolope1,
        envolope10,
        envolope11,
        envolope12,
        envolope2,
        envolope3,
        envolope4,
        envolope5,
        envolope6,
        envolope7,
        envolope8,
        envolope9
      ];
}

class $AssetsImagesMoneyGen {
  const $AssetsImagesMoneyGen();

  /// File path: assets/images/money/money1.png
  AssetGenImage get money1 =>
      const AssetGenImage('assets/images/money/money1.png');

  /// File path: assets/images/money/money2.png
  AssetGenImage get money2 =>
      const AssetGenImage('assets/images/money/money2.png');

  /// File path: assets/images/money/money3.png
  AssetGenImage get money3 =>
      const AssetGenImage('assets/images/money/money3.png');

  /// File path: assets/images/money/money4.png
  AssetGenImage get money4 =>
      const AssetGenImage('assets/images/money/money4.png');

  /// File path: assets/images/money/money5.png
  AssetGenImage get money5 =>
      const AssetGenImage('assets/images/money/money5.png');

  /// File path: assets/images/money/money6.png
  AssetGenImage get money6 =>
      const AssetGenImage('assets/images/money/money6.png');

  /// File path: assets/images/money/money7.png
  AssetGenImage get money7 =>
      const AssetGenImage('assets/images/money/money7.png');

  /// File path: assets/images/money/money8.png
  AssetGenImage get money8 =>
      const AssetGenImage('assets/images/money/money8.png');

  /// File path: assets/images/money/money9.png
  AssetGenImage get money9 =>
      const AssetGenImage('assets/images/money/money9.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [money1, money2, money3, money4, money5, money6, money7, money8, money9];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
