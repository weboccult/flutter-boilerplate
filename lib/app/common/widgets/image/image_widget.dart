import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? url;
  final Widget errorWidget;
  final BoxFit boxFit;
  final Widget Function(BuildContext context,Widget child,ImageChunkEvent? loadingProgress)? loadingWidget;
  const NetworkImageWidget({Key? key,required this.url, required this.errorWidget, required this.boxFit, this.loadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url != null && url != "" ? Image.network(
      url!,
      fit: boxFit,
      loadingBuilder: loadingWidget,
      isAntiAlias: true,
      errorBuilder: (context, error, stackTrace) {
        return errorWidget;
      },
    ) : errorWidget;
  }
}
