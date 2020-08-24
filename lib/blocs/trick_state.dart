part of 'trick_bloc.dart';

abstract class TrickState extends Equatable {
  const TrickState();
}

class TrickInitial extends TrickState {
  @override
  List<Object> get props => [];
}

class  TrickLoaded extends  TrickState {
  final List<Trick> trick;

  TrickLoaded({this.trick});

  @override
  List<Object> get props => [trick];
}
