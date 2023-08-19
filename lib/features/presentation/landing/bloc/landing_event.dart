import 'package:equatable/equatable.dart';

abstract class LandingEvent extends Equatable {}

class LandingIndexEvent extends LandingEvent {
  final int index;

  LandingIndexEvent(this.index);

  @override
  List<Object?> get props => throw UnimplementedError();

}

class ClearLandingEvent extends LandingEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
