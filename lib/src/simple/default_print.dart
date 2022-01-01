import 'package:signale/src/interface/print_able.dart';
import 'dart:core' as core;
import 'dart:core';

class DefaultPrinter implements Printable {
  const DefaultPrinter();
  @override
  void print(DateTime time,Object object) {
    core.print(object);
  }
}
