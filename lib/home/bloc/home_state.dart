part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class IncreaseTheCountActionState extends HomeActionState {
  int count;
  IncreaseTheCountActionState({
    required this.count,
  });
}

class DecreaseTheCountActionState extends HomeActionState {
  int count;
  DecreaseTheCountActionState({
    required this.count,
  });
}

class HomeNavigateToProfilePageActionState extends HomeActionState {
  String name;
  HomeNavigateToProfilePageActionState({
    required this.name,
  });
}
