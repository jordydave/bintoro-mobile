part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String noHp;
  final String alamat;

  User(this.id, this.email, {this.name, this.noHp, this.alamat});

  @override
  String toString() {
    return "[$id] - $name $email";
  }

  @override
  List<Object> get props => [id, email, name, noHp, alamat];
}
