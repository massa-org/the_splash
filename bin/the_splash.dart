#!/usr/bin/env dart

import 'package:universal_io/io.dart';

import 'package:flutter_native_splash/cli_commands.dart';

void main(List<String> args) async {
  createSplash(path: null, flavor: null);

  // TODO use path instead of string concat

  // assets roots
  const androidRoot = 'android/app/src/main/res';
  const flutterRoot = 'assets/generated/';

  // directories with different splash dpi and type
  final flutter = [
    '',
    '1.5x',
    '2.0x',
    '3.0x',
    '4.0x',
  ];

  final androidLight = [
    '/drawable-mdpi/',
    '/drawable-hdpi/',
    '/drawable-xhdpi/',
    '/drawable-xxhdpi/',
    '/drawable-xxxhdpi/',
  ];

  final androidDark = [
    '/drawable-night-mdpi/',
    '/drawable-night-hdpi/',
    '/drawable-night-xhdpi/',
    '/drawable-night-xxhdpi/',
    '/drawable-night-xxxhdpi/',
  ];

  for (final e in flutter) {
    Directory(flutterRoot + e).createSync(recursive: true);
  }

  androidLight.asMap().forEach((key, value) {
    File('$androidRoot${value}splash.png')
        .copySync('$flutterRoot${flutter[key]}/splash.png');
  });

  // stupid, simple and buggy
  final hasDarkImage =
      File('$androidRoot${androidDark[0]}splash.png').existsSync();
  if (hasDarkImage) {
    androidDark.asMap().forEach((key, value) {
      File('$androidRoot${value}splash.png')
          .copySync('$flutterRoot${flutter[key]}/splash_dark.png');
    });
  }
}
