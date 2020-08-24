part of 'models.dart';

class Services extends Equatable {
  final String id;
  final String name;
  final String icon;
  final String link;

  Services(
      {@required this.id,
      @required this.name,
      @required this.icon,
      @required this.link});

  factory Services.fromJson(Map<String, dynamic> json) => Services(
      id: json['id'],
      name: json['name'],
      icon: json['logo'],
      link: json['url']);

  @override
  List<Object> get props => [id, name, icon, link];
}
