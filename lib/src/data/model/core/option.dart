abstract class Option<A> {
  const Option();

  B fold<B>(B Function() ifNone, B Function(A a) ifSome);

  Option<A> orElse(Option<A> Function() other) => fold(other, (_) => this);
  A getOrElse(A Function() dflt) => fold(dflt, (A a) => a);
  A operator |(A dflt) => getOrElse(() => dflt);
  bool isSome() => fold(() => false, (_) => true);

  @override String toString() => fold(() => 'None', (A a) => 'Some($a)');
}

class Some<A> extends Option<A> {
  const Some(this._a);
  final A _a;
  A get value => _a;
  @override B fold<B>(B Function() ifNone, B Function(A a) ifSome) => ifSome(_a);
  @override bool operator ==(Object other) => other is Some && other._a == _a;
  @override int get hashCode => _a.hashCode;
}

class None<A> extends Option<A> {
  const None();
  @override B fold<B>(B Function() ifNone, B Function(A a) ifSome) => ifNone();
  @override bool operator ==(Object other) => other is None;
  @override int get hashCode => 0;
}

// ignore: always_specify_types
Option<A> none<A>() => const None();
Option<A> some<A>(A a) => Some<A>(a);
// ignore: avoid_positional_boolean_parameters
Option<A> option<A>(bool test, A value) => test ? some(value) : none();
Option<A> optionOf<A>(A? value) => value != null ? some(value) : none();
