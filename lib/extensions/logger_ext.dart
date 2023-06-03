import 'package:cr_logger/cr_logger.dart';

extension LoggerExt on Object? {
  void printD([Object? error, StackTrace? stackTrace]) => log.d(
        this,
        error,
        stackTrace,
      );

  void printI([Object? error, StackTrace? stackTrace]) => log.i(
        this,
        error,
        stackTrace,
      );

  void printE([Object? error, StackTrace? stackTrace]) => log.e(
        this,
        error,
        stackTrace,
      );
}
