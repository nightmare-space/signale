part of signale;

String _ansiCsi = '\x1b[';
String _defaultColor = '${_ansiCsi}0m';
String _verboseSeq = '${_ansiCsi}38;5;244m';

class Logger {
  Logger({this.printer = const DefaultPrinter()});
  Printable printer;
  StringBuffer _buffer = StringBuffer();

  StringBuffer get buffer => _buffer;

  void _print(Object object, String tag, String colorTag) {
    final String data = '$object';
    data.split('\n').forEach((element) {
      final String line =
          '$_verboseSeq[$tag] ${_ansiCsi}1;${colorTag}m$element$_defaultColor';
      _buffer.write(line + '\n');
      printer.print(DateTime.now(), line);
    });
  }

  /// verbose
  void v(Object object, {String? tag}) {
    _print(object, tag ?? 'V', '0');
  }

  void d(Object object, {String? tag}) {
    _print(object, tag ?? 'D', '34');
  }

  void i(Object object, {String? tag}) {
    _print(object, tag ?? 'I', '32');
  }

  void w(Object object, {String? tag}) {
    _print(object, tag ?? 'W', '33');
  }

  void e(Object object, {String? tag}) {
    _print(object, tag ?? 'E', '31');
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
