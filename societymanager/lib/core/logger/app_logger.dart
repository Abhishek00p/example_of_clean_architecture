import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class AppLogger {
  ///trace log
  void t(String message);

  ///debug log
  void d(String message);

  ///info log
  void i(String message);

  ///warning log
  void w(String message);

  ///error log
  void e(String message, {dynamic error});

  ///fatal log
  void f(String message, {dynamic error, StackTrace? stackTrace});
}

@LazySingleton(as: AppLogger)
class AppLoggerImpl implements AppLogger {
  AppLoggerImpl(this._logger);
  final Logger _logger;

  @override
  void t(String message) {
    _logger.t(message);
  }

  @override
  void d(String message) {
    _logger.d(message);
  }

  @override
  void i(String message) {
    _logger.i(message);
  }

  @override
  void w(String message) {
    _logger.w(message);
  }

  @override
  void e(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.e(
      message,
      error: error,
      stackTrace: stackTrace,
      time: time,
    );
  }

  @override
  void f(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.f(
      message,
      error: error,
      stackTrace: stackTrace,
      time: time,
    );
  }
}
