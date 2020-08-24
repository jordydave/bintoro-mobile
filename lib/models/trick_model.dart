part of 'models.dart';

class Trick extends Equatable {
  final String id;
  final String title;
  final String poster;
  final String link;

  Trick(
      {@required this.id,
      @required this.title,
      @required this.poster,
      @required this.link});

  factory Trick.fromJson(Map<String, dynamic> json) => Trick(
      id: json['id'],
      title: json['title'],
      poster: json['image'],
      link: json['url']);

  @override
  List<Object> get props => [id, title, poster, link];
}
