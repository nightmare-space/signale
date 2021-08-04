import 'package:signale/src/interface/print_able.dart';

class DefaultPrint implements Logable {
  const DefaultPrint();
  @override
  void log(Object object) {
    print(object);
  }
}
