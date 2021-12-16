import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_splash/the_splash.dart';

/// default splash screen that looks exactly like native splash
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // get config and image
  SplashOptions get options => SplashScreenData.options;

  ImageProvider get image => SplashScreenData.image;

  @override
  void initState() {
    if (options.fullscreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (options.fullscreen) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      backgroundColor: brightness == Brightness.dark
          ? options.darkColor ?? const Color(0xff303030)
          : options.lightColor ?? const Color(0xffffffff),
      body: SizedBox.expand(
        child: Image(
          image: image,
          alignment: options.gravity.alignment,
          fit: options.gravity.fit,
        ),
      ),
    );
  }
}
