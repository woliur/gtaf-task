import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class GetUserEvent extends UserEvent {

  @override
  List<Object?> get props => throw UnimplementedError();

}

