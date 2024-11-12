import 'package:caspratique/utils/formatters.dart';
import 'package:caspratique/widgets/genius_pass.dart';
import 'package:caspratique/widgets/hexagons_background.dart';
import 'package:caspratique/widgets/profil_stats_card.dart';
import 'package:caspratique/widgets/profile_informations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final userRank = args['userRank'];

    Future<DocumentSnapshot> getUserData() async {
      // On récupère le userId
      final userId = args['userId'];

      // On vérifie si les données sont déjà dans le cache
      final userData =
          await users.doc(userId).get(const GetOptions(source: Source.cache));

      if (userData.exists) {
        return userData;
      } else {
        // Si on ne les trouve pas on effectue la requête
        return await users.doc(userId).get();
      }
    }

    return FutureBuilder<DocumentSnapshot>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('Utilisateur non trouvé'));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;

          var ratePercentageBets =
              '${calculatePercentage(userData['betsWon'], userData['totalBets'])}%';

          var ratePercentageMatches =
              '${calculatePercentage(userData['matchesWon'], userData['totalMatches'])}%';

          var ratePercentageFastPronos =
              '${calculatePercentage(userData['fastBetsWon'], userData['totalFastBets'])}%';

          return Scaffold(
              backgroundColor: const Color(0xFFECF1FF),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileInformations(
                      userData: userData,
                      userRank: userRank,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        child: Column(
                          children: [
                            IntrinsicHeight(
                                child: Row(
                              children: [
                                Expanded(
                                    child: ProfileStatsCard(
                                        iconUrl:
                                            'assets/icons/shield_primary.svg',
                                        title: formatNumberWithSpaces(
                                            userData['leagueRank']),
                                        description: 'Classement Ligue')),
                                Expanded(
                                    child: ProfileStatsCard(
                                        iconUrl:
                                            'assets/icons/crown_primary.svg',
                                        title: formatNumberWithSpaces(
                                            userData['hallOfFameRank']),
                                        description:
                                            'Classement          Hall of Fame')),
                                Expanded(
                                    child: ProfileStatsCard(
                                        iconUrl:
                                            'assets/icons/field_primary.svg',
                                        title: formatNumberWithSpaces(
                                            userData['matchesWon']),
                                        description:
                                            'Nombre de parties gagnées')),
                              ],
                            )),
                            Row(
                              children: [
                                Expanded(
                                    child: ProfileStatsCard(
                                        title: formatNumberWithSpaces(
                                            userData['totalScore']),
                                        titleIcon: 'assets/icons/coins.svg',
                                        description:
                                            'Nombre total de Genius Coins générés')),
                              ],
                            ),
                            IntrinsicHeight(
                                child: Row(
                              children: [
                                Expanded(
                                    child: ProfileStatsCard(
                                        title: ratePercentageBets,
                                        description: 'Taux de cotes validés')),
                                Expanded(
                                    child: ProfileStatsCard(
                                        title: ratePercentageMatches,
                                        description:
                                            'Taux de parties gagnantes')),
                                Expanded(
                                    child: ProfileStatsCard(
                                        title: ratePercentageFastPronos,
                                        description:
                                            'Taux de pronos rapides réussis')),
                              ],
                            )),
                          ],
                        )),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shadowColor: Colors.black.withOpacity(0.8),
                        minimumSize: const Size(0, 30),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 6.0,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Voir toutes les stats',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF364F6B),
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.add_circle_outline,
                            size: 23,
                            color: Color(0xFF7584FF),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ));
        });
  }
}
