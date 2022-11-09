import 'package:flutter/material.dart';
import '../services/log/log.dart';



class Handler extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      kLog("App resumed");
    }
    if (state == AppLifecycleState.inactive) {
      kLog("App inactive");
    }
    if (state == AppLifecycleState.paused) {
      kLog("App pause");
    }
  }
}
