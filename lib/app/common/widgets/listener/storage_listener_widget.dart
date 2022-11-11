import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../services/storage/storage.dart';

/// [StorageListenerWidget] listens to a specific value of [GetStorage].
///
/// Specify the [listenKey] which you want to listen.
///
/// Specify the [storage] which has the key you want to listen.
/// By Default [StorageService.storage] is used.
///
/// [builder] function will return the stored value.
///
class StorageListenerWidget extends StatefulWidget {
  final String listenKey;
  final GetStorage? storage;
  final Widget Function(dynamic value) builder;
  const StorageListenerWidget({Key? key, required this.listenKey, required this.builder, this.storage}) : super(key: key);

  @override
  State<StorageListenerWidget> createState() => _StorageListenerWidgetState();
}

class _StorageListenerWidgetState extends State<StorageListenerWidget> {

  _listeningCallBack(data) {
    if (mounted && isBuildDone) {
      setState(() {});
    }
  }

  bool isBuildDone = false;
  @override
  void initState() {
    if (widget.storage != null) {
      widget.storage!.listenKey(widget.listenKey, _listeningCallBack);
    } else {
      StorageService.storage.listenKey(widget.listenKey, _listeningCallBack);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isBuildDone = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.storage != null) {
      return widget.builder(StorageService.storage.read(widget.listenKey));
    } else {
      return widget.builder(StorageService.storage.read(widget.listenKey));
    }
  }
}
