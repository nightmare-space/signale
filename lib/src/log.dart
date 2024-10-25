part of signale;

Logger defaultLogger = Logger();

class Log {
  /// debug logger
  static Logger defaultLogger = Logger();

  /// log buffer
  static List<LogEntity> buffer = defaultLogger.buffer;

  /// debug log
  static void d(Object? object, {String? tag}) {
    defaultLogger.d(
      object,
      tag: tag,
    );
  }

  /// info log
  static void i(Object? object, {String? tag}) {
    defaultLogger.i(
      object,
      tag: tag,
    );
  }

  /// warning log
  static void w(Object? object, {String? tag}) {
    defaultLogger.w(
      object,
      tag: tag,
    );
  }

  /// verbose log
  static void v(Object? object, {String? tag}) {
    defaultLogger.v(
      object,
      tag: tag,
    );
  }

  /// error log
  static void e(Object? object, {String? tag}) {
    defaultLogger.e(
      object,
      tag: tag,
    );
  }

  /// custom log
  static void custom(
    Object object, {
    /// foreground 0-255
    int foreColor = 0,

    /// background 0-255
    int? backColor,
    String? tag,
  }) {
    defaultLogger.custom(object, foreColor: foreColor, backColor: backColor, tag: tag!);
  }

  static void c(Object object, int color) {
    defaultLogger.custom(object, foreColor: color);
  }

  static void r(Object? object) {
    defaultLogger.custom(object, foreColor: Random().nextInt(231));
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
