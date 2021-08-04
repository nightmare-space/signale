part of signale;

String _ansiCsi = '\x1b[';
String _defaultColor = '${_ansiCsi}0m';
String _verboseSeq = '${_ansiCsi}38;5;244m';

class Logger {
  Logger({this.logDelegate = const DefaultPrint()});
  Logable logDelegate;
  StringBuffer _buffer = StringBuffer();

  StringBuffer get buffer => _buffer;

  String tag = '';

  /// verbose
  void v(Object object, {String? tag}) {
    final String data = '$_verboseSeq$object$_defaultColor';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    logDelegate.log('$_verboseSeq[V] $data');
  }

  void d(Object object, {String? tag}) {
    final String data = '${_ansiCsi}1;34m$object\x1B[0m';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    logDelegate.log('$_verboseSeq[D] $data');
  }

  void i(Object object, {String? tag}) {
    final String data = '${_ansiCsi}1;39m$object\x1B[0m';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    logDelegate.log('$_verboseSeq[I] $data');
  }

  void w(Object object, {String? tag}) {
    final String data = '${_ansiCsi}1;33m$object\x1B[0m';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    logDelegate.log('$_verboseSeq[W] $data');
  }

  void e(Object object, {String? tag}) {
    final String data = '${_ansiCsi}1;31m$object\x1B[0m';
    String suffix = '';
    if (!object.toString().endsWith('\n')) {
      suffix += '\n';
    }
    _buffer.write(data + suffix);
    logDelegate.log('$_verboseSeq[E] $data');
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

    logDelegate.log(
        '$_verboseSeq[$tag] $_ansiCsi$foreTag;5;${foreColor ?? '0'}m$_ansiCsi$backTag;5;${backColor ?? '0'}m$object$_defaultColor');
  }
}
