import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart' as foundation;

final logger = Logger(
  printer: PrettyPrinter(
      noBoxingByDefault: true,
      methodCount: 2,
      // number of method calls to be displayed
      errorMethodCount: 8,
      // number of method calls if stacktrace is provided
      lineLength: 1000,
      // width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true,
      // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

void mPrint(s) {
  // SmartDialog.showToast('',)
  if (foundation.kDebugMode) {
    logger.i('$s');
  }
}

void mPrintError(s) {
  if (foundation.kDebugMode) {
    logger.e('$s');
  }
}
