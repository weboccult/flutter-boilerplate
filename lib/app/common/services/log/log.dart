import 'dart:developer';
import 'package:flutter/foundation.dart';

const LogTypes showLogs = LogTypes.ALL;

/// Log function of application.
///
/// Use this function for logs in your application. you can use it by calling [kLog].
///
/// Logs can also be filtered using [showLogs].
///
/// For better logging always use [tag] & [LogStatus] in [kLog].
///
///
kLog(String message,
    {String tag = "TAG",
    writeLog = false,
    LogStatus logStatus = LogStatus.INFO}) {
  switch (showLogs) {
    case (LogTypes.ALL):
      kIsWeb ? debugPrint("[$tag] :: $message") : log(message, name: tag);
      break;
    case (LogTypes.NONE):
      break;
    case (LogTypes.INFO):
      if (logStatus == LogStatus.INFO)
        kIsWeb ? debugPrint("[$tag] :: $message") : log(message, name: tag);
      break;
    case (LogTypes.WARNING):
      if (logStatus == LogStatus.WARNING)
        kIsWeb ? debugPrint("[$tag] :: $message") : log(message, name: tag);
      break;
    case (LogTypes.ERROR):
      if (logStatus == LogStatus.ERROR)
        kIsWeb ? debugPrint("[$tag] :: $message") : log(message, name: tag);
      break;
    default:
      kIsWeb ? debugPrint("[$tag] :: $message") : log(message, name: tag);
      break;
  }

  if (writeLog) {
    // logService.writeLog("[$tag] :: $message", logStatus);
  }
}

///In Development. Write logs to file functionality.
writeLog(String message, LogStatus tag) {
  // String documentsPath = "/storage/emulated/0/Documents/rymedy_logs";
  // // create documents log directory
  // if(!Directory(documentsPath).existsSync()) {
  //   Directory(documentsPath).createSync(recursive: true);
  // }
}

/// log types
enum LogStatus { INFO, WARNING, ERROR }

enum LogTypes { ALL, INFO, WARNING, ERROR, NONE }
