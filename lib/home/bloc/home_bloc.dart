import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../data/counter_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeInitialEvent>(homeInitialEvent);
    on<IncreaseButtonClickEvent>(increaseButtonClickEvent);
    on<DecreaseButtonClickEvent>(decreaseButtonClickEvent);
    on<SubmitButtonNavigateEvent>(submitButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> increaseButtonClickEvent(
      IncreaseButtonClickEvent event, Emitter<HomeState> emit) {
    emit(
      IncreaseTheCountActionState(
        count: CounterData.count++,
      ),
    );
    print('Increase Button Clicked');
  }

  FutureOr<void> decreaseButtonClickEvent(
      DecreaseButtonClickEvent event, Emitter<HomeState> emit) {
    emit(
      DecreaseTheCountActionState(
        count: CounterData.count--,
      ),
    );
    print('Decrease Button Clicked');
  }

  FutureOr<void> submitButtonNavigateEvent(
      SubmitButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToProfilePageActionState(
      name: CounterData.name.text,
    ));

    print('Enter Button Clicked');
  }
}
