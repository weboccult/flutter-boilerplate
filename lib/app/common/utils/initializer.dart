import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/app/common/services/storage/storage.dart';
import 'package:get_storage/get_storage.dart';
import '../services/http/base_http.dart';
import '../services/log/log.dart';
import 'lifecycle_handler.dart';

/// [Initializer] is a wrapper which wraps the [runApp] method.
///
/// All your initialization files and services can be initialized here.
///
/// You can also add an error builder widget whenever your application crashes here.
///
abstract class Initializer {
  static const initializerTag = 'Initialization';

  /// [init] method wraps the [runApp] method.
  static init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      ///Add Error widget
      return Container();
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        kLog(details.stack.toString(),
            logStatus: LogStatus.ERROR, tag: initializerTag);
      };
      await _initServices();
      runApp();
    }, (error, stack) {
      kLog('runZonedGuarded: ${error.toString()}',
          logStatus: LogStatus.ERROR, tag: initializerTag);
    });
  }

  ///application services initializations.
  ///
  /// also includes application lifecycle handler [Handler].
  ///
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

  /// [BaseHttp] service initialization
  static Future<void> _initBaseHTTPService() async {
    await BaseHttp.initializeAPIServices();
  }

  /// [StorageService] initialization.
  static Future<void> _initStorage() async {
    await GetStorage.init();
  }

  /// screen orientation preferences initialization.
  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
