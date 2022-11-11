import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/common/data/strings/strings.dart';
import '../services/log/log.dart';

class Handler extends WidgetsBindingObserver {
  static const handlerTag = 'Handler';

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      kLog("${Strings.appName} resumed", tag: handlerTag, logStatus: LogStatus.INFO);
    }
    if (state == AppLifecycleState.inactive) {
      kLog("${Strings.appName} inactive", tag: handlerTag, logStatus: LogStatus.INFO);
      kLog("App ");
    }
    if (state == AppLifecycleState.paused) {
      kLog("${Strings.appName} paused", tag: handlerTag, logStatus: LogStatus.INFO);
    }
    if (state == AppLifecycleState.detached) {
      kLog("${Strings.appName} detached", tag: handlerTag, logStatus: LogStatus.INFO);
    }
  }
}
