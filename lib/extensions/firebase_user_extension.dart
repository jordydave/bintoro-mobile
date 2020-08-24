part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser(
          {String name = "No Name",
          String noHp = "+62",
          String alamat = "No Address"}) =>
      User(this.uid, this.email, name: name, noHp: noHp, alamat: alamat);

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
