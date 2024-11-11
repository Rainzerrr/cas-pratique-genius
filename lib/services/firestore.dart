import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class UserService {
  // récupérer la collection des utilisateurs
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  // CREATE : créer un nouvel utilisateur
  Future<void> createUser({
    required String username,
    required String title,
    required int level,
    required bool isPremium,
    required int leagueRank,
    required int hallOfFameRank,
    required int matchesWon,
    required int totalMatches,
    required int betsWon,
    required int totalBets,
    required int fastBetsWon,
    required int totalFastBets,
  }) async {
    // Pour générer aléatoirement les scores des utilisateurs (de 1000 à 10 000 exclus, pas de raisons particulières pour cette plage)
    int score = Random().nextInt(9000) + 1000;

    // Pour générer aléatoirement la barre de progression du niveau 4 du Genius Pass (qui est de 1000xp à 2000xp)
    int geniusPassXp = Random().nextInt(1000) + 1000;
    try {
      await users.add({
        'username': username,
        'score': score,
        'totalScore': score + Random().nextInt(9000) + 1000,
        'geniusPassXp': geniusPassXp,
        'title': title,
        'level': level,
        'isPremium': isPremium,
        'leagueRank': leagueRank,
        'hallOfFameRank': hallOfFameRank,
        'matchesWon': matchesWon,
        'totalMatches': totalMatches,
        'betsWon': betsWon,
        'totalBets': totalBets,
        'fastBetsWon': fastBetsWon,
        'totalFastBets': totalFastBets,
        'createdAt': Timestamp.now(),
      });
    } catch (e) {}
  }

  // READ : récupérer les utilisateurs par rapport à leur classement.
  Stream<QuerySnapshot> getUsersRanking() {
    final usersRanking = users.orderBy('score', descending: true).snapshots();
    return usersRanking;
  }

  // READ : Récupérer les données de l'utilisateur à partir de son userId
  Future<DocumentSnapshot> getUserData(String userId) async {
    return await users.doc(userId).get();
  }

  // READ : récupérer le classement d'un utilisateur à partir de son userId.
  Future<int?> getUserRank(String userId) async {
    try {
      final QuerySnapshot snapshot =
          await users.orderBy('score', descending: true).get();

      for (int index = 0; index < snapshot.docs.length; index++) {
        if (snapshot.docs[index].id == userId) {
          return index + 1;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
