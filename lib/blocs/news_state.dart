part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class  NewsLoaded extends  NewsState {
  final List<News> news;

  NewsLoaded({this.news});

  @override
  List<Object> get props => [news];
}