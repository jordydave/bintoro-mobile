part of 'services_bloc.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();
}

class ServicesInitial extends ServicesState {
  @override
  List<Object> get props => [];
}

class  ServicesLoaded extends  ServicesState {
  final List<Services> services;

  ServicesLoaded({this.services});

  @override
  List<Object> get props => [services];
}