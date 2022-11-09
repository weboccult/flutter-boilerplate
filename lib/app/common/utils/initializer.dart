import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import '../services/http/base_http.dart';
import '../services/log/log.dart';
import 'lifecycle_handler.dart';


abstract class Initializer {
  static init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      //TODO: add error widget
      return Container();
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        kLog( details.stack.toString(),logStatus: LogStatus.ERROR,tag: 'INITIALIZER');
      };

      await _initServices();
      runApp();
    }, (error, stack) {
      kLog('runZonedGuarded: ${error.toString()}',logStatus: LogStatus.ERROR,tag: 'INITIALIZER');
    });
  }

  static Future<void> _initServices() async {
    try {
      await _initBaseHTTPService();
      await _initStorage();
      _initScreenPreference();
      WidgetsBinding.instance.addObserver(Handler());
    } catch (err) {
      rethrow;
    }
  }


  static Future<void> _initBaseHTTPService() async {
    await BaseHttp.initializeAPIServices();
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}




