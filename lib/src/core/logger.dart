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
  StringBuffer _buffer = StringBuffer();
  LogLevel level = LogLevel.verbose;
  StreamController<LogEntity> _streamController = StreamController.broadcast();
  Stream<LogEntity> get stream => _streamController.stream;

  List<LogEntity> buffer = [];

  void _print(Object object, String tag, String colorTag, LogLevel level) {
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
    _print(object ?? '', 'V/' + (tag ?? ''), '0', LogLevel.verbose);
  }

  /// debug log
  void d(Object? object, {String? tag}) {
    if (level.index > LogLevel.debug.index) {
      return;
    }
    _print(object ?? '', 'D/' + (tag ?? ''), '34', LogLevel.debug);
  }

  void i(Object? object, {String? tag}) {
    if (level.index > LogLevel.info.index) {
      return;
    }
    _print(object ?? '', 'I/' + (tag ?? ''), '32', LogLevel.info);
  }

  void w(Object? object, {String? tag}) {
    if (level.index > LogLevel.warning.index) {
      return;
    }
    _print(object ?? '', 'W/' + (tag ?? ''), '33', LogLevel.warning);
  }

  void e(Object? object, {String? tag}) {
    if (level.index > LogLevel.error.index) {
      return;
    }
    _print(object ?? '', 'E/' + (tag ?? ''), '31', LogLevel.error);
  }

  void custom(
    Object object, {
    int? foreColor,
    int? backColor,
    String tag = 'custom',
  }) {
    String foreTag = '38';
    String backTag = '48';
    if (foreColor == null) {
      foreTag = '39';
    }
    if (backColor == null) {
      backTag = '49';
    }

    // logDelegate.log(
    //     '$_verboseSeq[$tag] $_ansiCsi$foreTag;5;${foreColor ?? '0'}m$_ansiCsi$backTag;5;${backColor ?? '0'}m$object$_defaultColor');
  }
}
