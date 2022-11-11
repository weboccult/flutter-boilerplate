import 'dart:async';
import 'package:flutter/material.dart';
import '../../services/http/base_http.dart';

/// [HttpWidget] is a ready to use future builder of [BaseHttp] api calls.
///
/// [loader] shows loading while data is fetched.
///
/// [errorWidget] shows Error when there is some data in fetching.
///
/// [builder] is shown when data is fetched successfully.
///
/// Specify your api i.e [Future] function in [api] field.
///
/// Specify your apiURL in [apiURL] inorder to use cache functionality.
///
/// [useCache] is used to get data from cache for get directly from API.
/// set it [true] to get data from cache and vica versa.
///
/// [errorOrEmptyCondition] is used to specify certain condition when an error is occurred or data is empty.
/// [errorWidget] will be shown if condition is true.
///
/// [onData] will returns the data when there is data in cache or after [api] request.
/// It will be called twice i.e once when getting data from cache & 2nd time after getting from [api] request.
///
/// [onDone] will be called after the [api] request.
///
///
class HttpWidget<T> extends StatefulWidget {
  final Widget Function(T? data) builder;
  final Widget loader;
  final Widget errorWidget;
  final Function(T? data)? onDone;
  final Function(T? data)? onData;
  final Future<T> api;
  final String apiURL;
  final bool useCache;
  final bool Function(T? data) errorOrEmptyCondition;
  const HttpWidget({required Key key, required this.builder, required this.loader, required this.errorWidget, required this.api, required this.apiURL, this.errorOrEmptyCondition = errorOrEmptyConditionHandler, this.useCache = true, this.onDone, this.onData}) : super(key: key);
  static bool errorOrEmptyConditionHandler(data) => false;

  @override
  State<HttpWidget<T>> createState() => _HttpWidgetState<T>();
}

class _HttpWidgetState<T> extends State<HttpWidget<T>> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.onData != null) {
        if (widget.useCache && BaseHttp.apiCacheStorage.read(widget.apiURL) != null) {
          widget.onData!(widget.useCache ? BaseHttp.apiCacheStorage.read(widget.apiURL) : null);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      initialData: widget.useCache ? BaseHttp.apiCacheStorage.read(widget.apiURL) : null,
      future: widget.api,
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
          return widget.loader;
        }
        if (snapshot.connectionState == ConnectionState.done && (widget.errorOrEmptyCondition(snapshot.data) || snapshot.data == null)) {
          return widget.errorWidget;
        }
        if (snapshot.connectionState == ConnectionState.done && widget.onData != null) {
          widget.onData!(snapshot.data);
        }
        if (snapshot.connectionState == ConnectionState.done && widget.onDone != null) {
          widget.onDone!(snapshot.data);
        }
        return widget.builder(snapshot.data as T);
      },
    );
  }
}
