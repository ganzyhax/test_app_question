part of 'opros_bloc.dart';

@immutable
sealed class OprosState {}

final class OprosInitial extends OprosState {}

final class OprosLoaded extends OprosState {
  final data;
  int currentPage = 0;
  var answers;
  OprosLoaded({
    required this.data,
    required this.answers,
    required this.currentPage,
  });
}

final class OprosError extends OprosState {
  final String id;
  OprosError({required this.id});
}

final class OprosFinish extends OprosState {
  final String answer;
  OprosFinish({required this.answer});
}
