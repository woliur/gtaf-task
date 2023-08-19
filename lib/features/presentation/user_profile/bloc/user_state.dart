import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../../../core/domain/extensions/callback_status.dart';
import '../../../domain/entity/user_entity.dart';


class UserState extends Equatable {

  final CallbackStatus? status;
  final UserEntity? user;
  final String? errorMessage;

  UserState(
      {this.user,
        this.errorMessage,
      this.status = CallbackStatus.loading});

  UserState copyWith(
      {CallbackStatus? status, UserEntity? user, String? errorMessage}) {
    return UserState(
        status: status ?? this.status,
      user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }



  @override
  List<Object?> get props => [status, user, errorMessage];

}