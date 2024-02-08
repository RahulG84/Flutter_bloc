part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class IncreaseButtonClickEvent extends HomeEvent {}

class DecreaseButtonClickEvent extends HomeEvent {}

class SubmitButtonNavigateEvent extends HomeEvent {}
