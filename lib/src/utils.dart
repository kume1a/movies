import 'package:dartz/dartz.dart';

extension OptionX<A> on Option<A> {
  void foldSome(void Function(A a) ifSome) => fold(() {}, (A a) => ifSome.call(a));
}