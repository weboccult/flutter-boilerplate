import 'dart:async';
import 'package:flutter/material.dart';

import '../../services/http/base_http.dart';



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
  const HttpWidget({required Key key, required this.builder, required this.loader, required this.errorWidget, required this.api,
    required this.apiURL,
    this.errorOrEmptyCondition = errorOrEmptyConditionHandler,  this.useCache = true, this.onDone, this.onData}) : super(key: key);
  static bool errorOrEmptyConditionHandler(data) => false;

  @override
  State<HttpWidget<T>> createState() => _HttpWidgetState<T>();
}

class _HttpWidgetState<T> extends State<HttpWidget<T>> {




  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(widget.onData != null) {
        if(BaseHttp.apiCacheStorage.read(widget.apiURL) != null) {
          widget.onData!(widget.useCache ? BaseHttp.apiCacheStorage.read(widget.apiURL): null);
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
      initialData: widget.useCache ? BaseHttp.apiCacheStorage.read(widget.apiURL): null,
      future: widget.api,
      builder: (context,AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
          return widget.loader;
        }
        if (snapshot.connectionState == ConnectionState.done && (widget.errorOrEmptyCondition(snapshot.data) || snapshot.data == null)) {
          return widget.errorWidget;
        }
        if(snapshot.connectionState == ConnectionState.done && widget.onDone != null) {
          if(widget.onData != null) {
            widget.onData!(widget.useCache ? BaseHttp.apiCacheStorage.read(widget.apiURL): null);
          }
          // widget.onDone!(snapshot.data);
        }
        return widget.builder(snapshot.data as T);
      },
    );
    return ValueListenableBuilder(
      valueListenable: ValueNotifier(widget.useCache ? BaseHttp.apiCacheStorage.read(widget.apiURL): null),
      builder: (_, data, __) {
        return FutureBuilder<T>(
          initialData: data,
          future: widget.api,
          builder: (context,AsyncSnapshot<T> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
              return widget.loader;
            }
            if (snapshot.connectionState == ConnectionState.done && (widget.errorOrEmptyCondition(snapshot.data) || snapshot.data == null)) {
              return widget.errorWidget;
            }
            if(snapshot.connectionState == ConnectionState.done && widget.onDone != null) {
              widget.onDone!(snapshot.data);
            }
            return widget.builder(snapshot.data as T);
          },
        );
      },
    );
  }
}



