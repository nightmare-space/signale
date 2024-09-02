part of signale;

String _ansiCsi = '\x1b[';
String _defaultColor = '${_ansiCsi}0m';
String _verboseSeq = '${_ansiCsi}38;5;244m';

class LogEntity {
  LogEntity(this.time, this.data, this.level);
  final DateTime time;
  final String data;
  final LogLevel level;
}

class Logger {
  Logger({this.printer = const DefaultPrinter()});
  Printable printer;
  LogLevel level = LogLevel.verbose;
  StreamController<LogEntity> _streamController = StreamController.broadcast();
  Stream<LogEntity> get stream => _streamController.stream;

  List<LogEntity> buffer = [];

  void _print(Object? object, String tag, String colorTag, LogLevel level) {
    final String data = '$object';
    data.split('\n').forEach((element) {
      final String line = '$_verboseSeq[$tag] ${_ansiCsi}1;${colorTag}m$element$_defaultColor';
      DateTime time = DateTime.now();
      buffer.add(LogEntity(time, line, level));
      printer.print(DateTime.now(), line);
      _streamController.add(LogEntity(time, line, level));
    });
  }

  /// verbose log
  void v(Object? object, {String? tag}) {
    if (level.index > LogLevel.verbose.index) {
      return;
    }
    String t = tag == null ? 'V' : '$tag';
    _print(object, t, '0', LogLevel.verbose);
  }

  /// debug log
  void d(Object? object, {String? tag}) {
    if (level.index > LogLevel.debug.index) {
      return;
    }
    String t = tag == null ? 'D' : '$tag';
    _print(object, t, '34', LogLevel.debug);
  }

  /// info log
  void i(Object? object, {String? tag}) {
    if (level.index > LogLevel.info.index) {
      return;
    }
    String t = tag == null ? 'I' : '$tag';
    _print(object, t, '32', LogLevel.info);
  }

  /// warning log
  void w(Object? object, {String? tag}) {
    if (level.index > LogLevel.warning.index) {
      return;
    }
    String t = tag == null ? 'W' : '$tag';
    _print(object, t, '33', LogLevel.warning);
  }

  /// error log
  void e(Object? object, {String? tag}) {
    if (level.index > LogLevel.error.index) {
      return;
    }
    String t = tag == null ? 'E' : '$tag';
    _print(object, t, '31', LogLevel.error);
  }

  /// custom  log
  void custom(
    Object? object, {
    int foreColor = 0,
    int? backColor,
    String tag = 'custom',
  }) {
    final String data = '$object';
    data.split('\n').forEach((element) {
      int contrastColor = (foreColor < 16 || (foreColor > 231 && foreColor < 244) || ((foreColor - 16) % 36 ~/ 6 > 2)) ? 0 : 15;
      String line = '\x1B[48;5;${foreColor}m\x1B[38;5;${contrastColor}m${element}\x1B[0m c:$foreColor b:$contrastColor';
      DateTime time = DateTime.now();
      buffer.add(LogEntity(time, line, level));
      printer.print(DateTime.now(), line);
      _streamController.add(LogEntity(time, line, level));
    });
  }
}
