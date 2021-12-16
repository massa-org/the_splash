part of the_splash;

/// utility functions for await image loading
Future<ImageProvider> _preloadImage(
  ImageProvider image, {
  double? dpi,
}) async {
  final completer = Completer<void>();
  final imageStream = image.resolve(
    ImageConfiguration(devicePixelRatio: dpi),
  );

  late ImageStreamListener listener;
  listener = ImageStreamListener(
    (ImageInfo imageInfo, bool synchronousCall) {
      imageInfo.image.toByteData(format: ImageByteFormat.rawUnmodified).then(
        (ByteData? byteData) async {
          imageStream.removeListener(listener);
          completer.complete();
        },
      );
    },
    onError: (exception, stackTrace) {
      imageStream.removeListener(listener);
      completer.completeError(exception, stackTrace);
    },
  );

  imageStream.addListener(listener);

  await completer.future;

  return image;
}

/// utility functions for await asset image loading
Future<ImageProvider> _preloadAssetImage(
  String assetPath, {
  double? dpi,
}) async {
  return _preloadImage(AssetImage(assetPath), dpi: dpi);
}
