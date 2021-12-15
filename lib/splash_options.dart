part of the_splash;

Color? _parseColor(String? json) {
  if (json == null) return null;
  json = json.replaceFirst('#', '');
  return Color(
    int.parse(json, radix: 16) + (json.length == 6 ? 0xff000000 : 0),
  );
}

/// structure that contains parsed native splash config
class SplashOptions {
  final Color? lightColor;
  final Color? darkColor;
  final String? lightImage;
  final String? darkImage;

  final SplashGravity androidGravity;
  final SplashGravity iosGravity;
  final SplashGravity webGravity;

  /// return splash gravity for current platform
  SplashGravity get gravity {
    if (kIsWeb) return webGravity;
    if (Platform.isAndroid) return androidGravity;
    if (Platform.isIOS) return iosGravity;
    return SplashGravity.fromJson(null);
  }

  factory SplashOptions.fromJson(dynamic json) {
    return SplashOptions(
      _parseColor(json['color']),
      _parseColor(json['color_dark']),
      json['image'],
      json['image_dark'],
      SplashGravity.fromJson(json['android_gravity']),
      SplashGravity.fromJson(json['ios_content_mode']),
      SplashGravity.fromJson(json['web_image_mode']),
    );
  }

  SplashOptions(
    this.lightColor,
    this.darkColor,
    this.lightImage,
    this.darkImage,
    this.androidGravity,
    this.iosGravity,
    this.webGravity,
  );
}
