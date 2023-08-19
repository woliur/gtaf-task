import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtaf_assignment/features/domain/repository/repository.dart';


import '../../../../core/domain/error/api_exceptions.dart';
import '../../../../core/domain/extensions/callback_status.dart';

import '../../../domain/entity/commit_list_entity.dart';
import 'commit_event.dart';
import 'commit_state.dart';


class CommitBloc extends Bloc<CommitEvent, CommitState>{
  final Repository? repository;

  CommitBloc({this.repository}) : super(CommitState()){
    on<GetCommitsEvent>(_getCommits);
  }

  void _getCommits(GetCommitsEvent event, Emitter<CommitState> emit) async {
    emit(state.copyWith(status: CallbackStatus.loading));
      try {
        List<CommitListEntity>? list = await repository!.getCommitList();
        emit(state.copyWith(status: CallbackStatus.success, list: list ?? []));
      } on ApiException catch (e) {
        print(e.message);
        emit(state.copyWith(
            status: CallbackStatus.error, errorMessage: e.message.toString()));
      }
    // emit(state.copyWith(
    //     status: CallbackStatus.initial));
  }

}