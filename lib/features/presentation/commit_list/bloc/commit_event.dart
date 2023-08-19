import 'package:equatable/equatable.dart';

abstract class CommitEvent extends Equatable {}

class GetCommitsEvent extends CommitEvent {

  @override
  List<Object?> get props => throw UnimplementedError();

}
