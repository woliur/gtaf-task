import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../../../core/domain/extensions/callback_status.dart';
import '../../../domain/entity/commit_list_entity.dart';



class CommitState extends Equatable {
  final CallbackStatus? status;
  final List<CommitListEntity>? list;
  final String? errorMessage;

  CommitState(
      {this.list,
        this.errorMessage,
      this.status = CallbackStatus.loading});

  CommitState copyWith(
      {CallbackStatus? status, List<CommitListEntity>? list, String? errorMessage}) {
    return CommitState(
        status: status ?? this.status,
      list: list ?? this.list,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }


  @override
  List<Object?> get props => [status, list, errorMessage];

}