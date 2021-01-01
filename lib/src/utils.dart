import 'package:dartz/dartz.dart';

extension OptionX<A> on Option<A> {
  void foldSome(void ifSome(A a)) => fold(() {}, (A a) => ifSome.call(a));
}