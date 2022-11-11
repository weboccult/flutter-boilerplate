import 'package:flutter/material.dart';
import '../services/navigation/navigation.dart';

/// [CustomLoaders] class includes basic Circular Process Loaders.
///
/// It also includes [loaderDialog] which can be used as full-screen loaders while loading something.
///
/// It also includes [ImageLoadingBuilder] which can be used as image loader while fetching Images from [Image.network]
///
abstract class CustomLoaders {
  /// Circular Progress Indicator.
  static circularLoader({double size = 50.0, Color? color, double? strokeWidth}) {
    return Center(
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 4.0,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.black),
        ),
      ),
    );
  }

  /// Loading status.
  static get isLoading => _isLoading;
  static set setLoading(bool value) => _isLoading = value;
  static bool _isLoading = false;

  /// Full Screen Loading Dialog.
  static loaderDialog({bool? show, double loaderSize = 50.0, Color? color, double? strokeWidth}) {
    if (show!) {
      _isLoading = show;
      showDialog(
        context: navigationService.context,
        builder: (context) {
          return WillPopScope(onWillPop: () => Future.value(false), child: circularLoader(color: color, size: loaderSize, strokeWidth: strokeWidth));
        },
      );
    } else {
      if (_isLoading) {
        _isLoading = show;
        navigationService.back();
      }
    }
  }

  /// Image loading builder.
  static Widget imageLoadingBuilder(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          color: Colors.black,
          value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
          strokeWidth: 1.5,
        ),
      ),
    );
  }
}
