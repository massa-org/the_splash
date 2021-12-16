part of the_splash;

/// SplashGravity define how image must be displayed
class SplashGravity {
  final Alignment alignment;
  final BoxFit fit;

  SplashGravity._([
    this.alignment = Alignment.center,
    this.fit = BoxFit.none,
  ]);

  factory SplashGravity.fromJson(String? json) {
    switch (json) {
      // android
      case 'center':
        return SplashGravity._();
      case 'fill':
        return SplashGravity._(Alignment.center, BoxFit.fill);
      case 'bottom':
        return SplashGravity._(Alignment.bottomCenter);
      case 'top':
        return SplashGravity._(Alignment.topCenter);
      case 'right':
        return SplashGravity._(Alignment.centerRight);
      case 'left':
        return SplashGravity._(Alignment.centerLeft);

      // web
      case 'contain':
        return SplashGravity._(Alignment.center, BoxFit.contain);
      case 'stretch':
        return SplashGravity._(Alignment.center, BoxFit.fill);
      case 'cover':
        return SplashGravity._(Alignment.center, BoxFit.cover);

      // ios
      case 'bottomLeft':
        return SplashGravity._(Alignment.bottomLeft);
      case 'bottomRight':
        return SplashGravity._(Alignment.bottomRight);
      case 'topLeft':
        return SplashGravity._(Alignment.topLeft);
      case 'topRight':
        return SplashGravity._(Alignment.topRight);
      case 'scaleAspectFit':
        return SplashGravity._(Alignment.center, BoxFit.contain);
      case 'scaleToFill':
        return SplashGravity._(Alignment.center, BoxFit.fill);
      case 'scaleAspectFill':
        return SplashGravity._(Alignment.center, BoxFit.cover);

      default:
        return SplashGravity._();
    }
  }
}
