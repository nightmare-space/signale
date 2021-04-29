import 'core/logger.dart';

Logger defaultLogger = Logger();

class Log {
  static void d(Object object) => defaultLogger.d(object);
  static void v(Object object) => defaultLogger.v(object);
  static void i(Object object) => defaultLogger.i(object);
  static void w(Object object) => defaultLogger.w(object);
  static void e(Object object) => defaultLogger.e(object);
  static void custom(
    Object object, {
    int? foreColor,
    int? backColor,
    String? tag,
  }) {
    defaultLogger.custom(
      object,
      foreColor: foreColor,
      backColor: backColor,
      tag: tag,
    );
  }
}

void main() {
  Log.d('Debug log');
  Log.i('Info log');
  Log.w('Warning log');
  Log.e('Error log');
  Log.v('Verbose log');
  Log.custom(
    'Custom log',
    foreColor: 10,
    backColor: 200,
  );
}
