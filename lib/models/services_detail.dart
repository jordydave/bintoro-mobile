part of 'models.dart';

class ServiceDetail extends Equatable {
  final String id;
  final String name;
  final String kategori;
  final String image;
  final String items;

  ServiceDetail(
      {@required this.id,
      @required this.name,
      @required this.kategori,
      @required this.image,
      @required this.items});

  factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
      id: json['id'],
      name: json['name'],
      kategori: json['jasa_category'],
      image: json['image'],
      items: json['items']);
  @override
  List<Object> get props => [id, name, kategori, image, items];
}
