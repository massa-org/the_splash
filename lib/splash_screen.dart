import 'package:flutter/material.dart';
import 'package:the_splash/the_splash.dart';

/// default splash screen that looks exactly like native splash
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // get config and image
  SplashOptions get options => SplashScreenData.options;
  ImageProvider get image => SplashScreenData.image;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      backgroundColor: brightness == Brightness.dark
          ? options.darkColor ?? const Color(0xff303030)
          : options.lightColor ?? const Color(0xffffffff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image(
              image: image,
              alignment: options.gravity.alignment,
              fit: options.gravity.fit,
            ),
          ),
        ],
      ),
    );
  }
}
