part of 'services_bloc.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();
}

class FetchServices extends ServicesEvent {
  @override
  List<Object> get props => [];
}