import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtaf_assignment/features/presentation/landing/bloc/landing_event.dart';
import 'package:gtaf_assignment/features/presentation/landing/bloc/landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {

  LandingBloc() : super(const LandingState()){
    on<LandingIndexEvent>(_setIndex);
    on<ClearLandingEvent>(_clear);
  }

  void _setIndex(LandingIndexEvent event, Emitter<LandingState> emit) async {
    emit(state.copyWith(index: event.index));
  }

  void _clear(ClearLandingEvent event, Emitter<LandingState> emit) {
    emit(LandingState());
  }
}