import 'package:logger/logger.dart' show Logger;

/// [Logger]
Logger _logger = Logger();

/// verbose
void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.v(message, error, stackTrace);
}

/// debug
void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.d(message, error, stackTrace);
}

/// info
void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.i(message, error, stackTrace);
}

/// waring
void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.w(message, error, stackTrace);
}

/// error
void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.e(message, error, stackTrace);
}

/// wtf
void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.wtf(message, error, stackTrace);
}
