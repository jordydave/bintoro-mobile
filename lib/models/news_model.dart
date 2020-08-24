part of 'models.dart';

class News extends Equatable {
  final String id;
  final String title;
  final String poster;
  final String url;

  News(
      {@required this.id,
      @required this.title,
      @required this.poster,
      @required this.url});

  factory News.fromJson(Map<String, dynamic> json) => News(
      id: json['id'],
      title: json['title'],
      poster: json['image'],
      url: json['url']);

  @override
  List<Object> get props => [id, title, poster, url];
}
