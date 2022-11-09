import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeListWidget<T> extends StatefulWidget {
  final List<dynamic> dataList;
  final FutureOr<List<T>> Function(dynamic) computeFunction;
  final Widget loader;
  final Widget errorWidget;
  final Widget Function(Widget) wrapperWidget;
  final bool Function(List<T>? data) errorOrEmptyCondition;
  final Widget Function(T? data) builder;
  final Axis scrollDirection;
  final ScrollController? scrollController;
  const ComputeListWidget({Key? key, required this.builder, required this.loader, required this.errorWidget,
    this.errorOrEmptyCondition = errorOrEmptyConditionHandler, required this.dataList, required this.computeFunction, this.scrollDirection = Axis.vertical, this.scrollController,
    this.wrapperWidget = staticWrapperWidget}) : super(key: key);

  static Widget staticWrapperWidget(child) => Container(child: child);
  static bool errorOrEmptyConditionHandler(data) => false;

  @override
  State<ComputeListWidget<T>> createState() => _ComputeListWidgetState<T>();
}

class _ComputeListWidgetState<T> extends State<ComputeListWidget<T>> {



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<T>>(
      future: compute<List<dynamic>,List<T>>(widget.computeFunction, widget.dataList),
      builder: (context, AsyncSnapshot<List<T>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
          return widget.loader;
        }
        if (snapshot.connectionState == ConnectionState.done &&  snapshot.data == null) {
          return widget.errorWidget;
        }
        return widget.wrapperWidget(
            ListView.builder(
          itemCount: snapshot.data?.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: widget.scrollDirection,
          controller: widget.scrollController,
          itemBuilder: (context, index) {
            return widget.builder(snapshot.data![index]);
          },
        ));
      },
    );
  }
}
