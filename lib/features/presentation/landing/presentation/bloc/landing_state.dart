import 'package:equatable/equatable.dart';

class LandingState extends Equatable {

  final int index;

  const LandingState(
      {this.index = 0,
      });

  LandingState copyWith(
      {int? index}) {
    return LandingState(
      index: index ?? this.index,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [index];

}