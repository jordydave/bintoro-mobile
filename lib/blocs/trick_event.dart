part of 'trick_bloc.dart';

abstract class TrickEvent extends Equatable {
  const TrickEvent();
}

class FetchTrick extends TrickEvent {
  @override
  List<Object> get props => [];
}
