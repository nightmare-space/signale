import 'package:signale/signale.dart';
import 'package:signale/src/foundation/log_level.dart';

void main() {
  Log.defaultLogger.level = LogLevel.info;
  Log.d('Debug log');
  Log.i('Info log');
  Log.w('Warning log');
  Log.e('Error log');
  Log.v('Verbose log');
  Log.c('Color log', 12);
  Log.c('Color log', 14);
}
