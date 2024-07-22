part of 'opros_bloc.dart';

@immutable
sealed class OprosEvent {}

final class OprosLoad extends OprosEvent {
  final String id;
  OprosLoad({required this.id});
}

final class OprosSingleAnswer extends OprosEvent {
  int index;
  OprosSingleAnswer({required this.index});
}

final class OprosNultiplyAnswer extends OprosEvent {
  int index;
  bool val;
  OprosNultiplyAnswer({required this.index, required this.val});
}

final class OprosNext extends OprosEvent {}

final class OprosBack extends OprosEvent {}

final class OpresFinish extends OprosEvent {}
