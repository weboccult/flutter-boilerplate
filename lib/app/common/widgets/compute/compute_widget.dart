import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ComputeWidget<T> extends StatelessWidget {
  final Map<String,dynamic> data;
  final FutureOr<T> Function(dynamic) computeFunction;
  final Widget loader;
  final Widget errorWidget;
  final bool Function(T? data) errorOrEmptyCondition;
  final Widget Function(T? data) builder;
  const ComputeWidget({Key? key, required this.builder, required this.loader, required this.errorWidget,
    this.errorOrEmptyCondition = errorOrEmptyConditionHandler,required this.data, required this.computeFunction}) : super(key: key);

  static bool errorOrEmptyConditionHandler(data) => false;






  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: compute(computeFunction,data),
      builder: (context,AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
          return loader;
        }
        if (snapshot.connectionState == ConnectionState.done && (errorOrEmptyCondition(snapshot.data) || snapshot.data == null)) {
          return errorWidget;
        }
        return builder(snapshot.data as T);
      },
    );
  }
}



