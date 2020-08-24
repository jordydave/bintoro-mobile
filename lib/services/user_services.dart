part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'noHp': user.noHp,
      'alamat': user.alamat
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();
    return User(id, snapshot.data['email'],
        name: snapshot.data['name'],
        noHp: snapshot.data['noHp'],
        alamat: snapshot.data['alamat']);
  }
}
