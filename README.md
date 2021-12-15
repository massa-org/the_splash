That package simplify native and second splash creation

It use [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) to create native splash and provide `SplashScreen` widget that looks exactly like native splash

# Features

- Second splash that looks exactly like native
- Remove blinking in transition between native and second splashes
- Utils to build your own splash

# Getting started

Add dependencies
```yaml
dependencies:
    the_splash: ^0.1.0

# required to launch native splash generation script
dev_dependencies:
    flutter_native_splash: ^1.3.0
```

# Usage

## 1. Configure native splash

**WARN:** right now package only work with config in `flutter_native_splash.yaml` file

Configure the native splash by this [instruction](https://pub.dev/packages/flutter_native_splash#usage).

## 2. Configure assets
```yaml
# pubspec.yaml
flutter:
  assets:
    # this need to use splash images inside app 
    - assets/generated/
    # for read the config
    - flutter_native_splash.yaml
```

## 3. Run the command
This command run `flutter_native_splash` and copy images generated for different dpi to `assets/generated` location
```sh
flutter pub run the_splash
```

## 4. Use splash screen in app
```dart 
void main(){
  WidgetsFlutterBinding.ensureInitialized();

  // add to your app after initialize binding to preload splash assets and config
  await SplashScreenData.preload();

  runApp(MaterialApp(home: SplashScreen()));
}
```

You also can create custom splash based on preload data for example see [splash_screen.dart](lib/splash_screen.dart)

# Additional information

Now package has some unsoported configuration options from `flutter_native_splash`
List of it:
- fullscreen
- android_gravity - center_horizontal, center_vertical, clip_horizontal, clip_vertical, end, fill_horizontal, fill_vertical, start

**WARN:** Not properly tested if only one theme defined.

# Bugs or Requests
If you encounter any problems or has any feature request feel free to open an issue. Pull request are also welcome.