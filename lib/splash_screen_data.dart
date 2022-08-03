part of the_splash;

/// native splash data holder used to load and access image, option in native splash widget
class SplashScreenData {
  SplashScreenData._();

  /// provider for current splash image, that already loaded and decoded
  static late ImageProvider image;
  static late SplashOptions options;

  static Future<void> _preloadOptions() async {
    try {
      options = await rootBundle.loadStructuredData(
        'flutter_native_splash.yaml',
        (v) async => SplashOptions.fromJson(
          loadYaml(v)['flutter_native_splash'],
        ),
      );
    } catch (error) {
      // todo check error is load error or parse error
      throw Exception(
        'the_splash: can\'t load splash screen configuration from flutter_native_splash.yaml file',
      );
    }
  }

  static Future<void> _preloadImage() async {
    try {
      final dpi = window.devicePixelRatio;
      final brightness = window.platformBrightness;
      image = await _preloadAssetImage(
        brightness == Brightness.dark
            ? 'assets/generated/splash_dark.png'
            : 'assets/generated/splash.png',
        dpi: dpi,
      );
    } catch (error) {
      throw Exception(
        'the_splash: error while preload generated splash image'
        'maybe you forgot to run `flutter pub run the_splash` command',
      );
    }
  }

  // preload splash image and options
  static Future<void> preload() async {
    await Future.wait([
      _preloadOptions(),
      _preloadImage(),
    ]);
  }
}
