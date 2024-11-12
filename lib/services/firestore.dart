import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  // récupérer la collection des utilisateurs
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  // READ : récupérer les utilisateurs par rapport à leur classement.
  Stream<QuerySnapshot> getUsersRanking() {
    final usersRanking = users.orderBy('score', descending: true).snapshots();
    return usersRanking;
  }

  // READ : Récupérer les données de l'utilisateur à partir de son userId
  Future<DocumentSnapshot> getUserData(String userId) async {
    return await users.doc(userId).get();
  }
}
