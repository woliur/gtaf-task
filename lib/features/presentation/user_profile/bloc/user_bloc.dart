import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtaf_assignment/features/domain/entity/user_entity.dart';
import 'package:gtaf_assignment/features/domain/repository/repository.dart';

import '../../../../core/domain/error/api_exceptions.dart';
import '../../../../core/domain/extensions/callback_status.dart';
import 'user_event.dart';
import 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState>{
  final Repository? repository;

  UserBloc({this.repository}) : super(UserState()){
    on<GetUserEvent>(_getUser);
  }

  void _getUser(GetUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: CallbackStatus.loading));
    try {
      UserEntity? userEntity = await repository!.getUserProfile();
      emit(state.copyWith(status: CallbackStatus.success, user: userEntity));
    } on ApiException catch (e) {
      print(e.message);
      emit(state.copyWith(
          status: CallbackStatus.error, errorMessage: e.message.toString()));
    }
    emit(state.copyWith(
        status: CallbackStatus.initial));
  }

}