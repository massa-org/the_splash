part of the_splash;

/// native splash data holder used to access image and option in native splash widget
class SplashScreenData {
  SplashScreenData._();

  static late ImageProvider image;
  static late SplashOptions options;

  // preload splash image and options
  static Future<void> preload() async {
    final dpi = window.devicePixelRatio;
    final brightness = window.platformBrightness;

    await Future.wait([
      rootBundle
          .loadStructuredData(
            'flutter_native_splash.yaml',
            (v) async => SplashOptions.fromJson(
              loadYaml(v)['flutter_native_splash'],
            ),
          )
          .then((value) => options = value),
      _preloadAssetImage(
        brightness == Brightness.dark
            ? 'assets/generated/splash_dark.png'
            : 'assets/generated/splash.png',
        dpi: dpi,
      ).then((value) => image = value),
    ]);
  }
}
