import 'package:flutter/material.dart';

import '../services/navigation/navigation.dart';

abstract class CustomLoaders {
  static circularLoader(
      {double size = 50.0, Color? color, double? strokeWidth}) {
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

  static get isLoading => _isLoading;
  static set setLoading(bool value) => _isLoading = value;
  static bool _isLoading = false;
  static loaderDialog(
      {bool? show,
      double loaderSize = 50.0,
      Color? color,
      double? strokeWidth}) {
    if (show!) {
      _isLoading = show;
      showDialog(
        context: navigationService.context,
        builder: (context) {
          return WillPopScope(
              onWillPop: () => Future.value(false),
              child: circularLoader(
                  color: color, size: loaderSize, strokeWidth: strokeWidth));
        },
      );
    } else {
      if (_isLoading) {
        _isLoading = show;
        navigationService.back();
      }
    }
  }

  static Widget imageLoadingBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          color: Colors.black,
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
          strokeWidth: 1.5,
        ),
      ),
    );
  }
}
