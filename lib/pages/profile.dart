import 'package:caspratique/utils/formatters.dart';
import 'package:caspratique/widgets/genius_pass.dart';
import 'package:caspratique/widgets/hexagons_background.dart';
import 'package:caspratique/widgets/profil_stats_card.dart';
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

          return Stack(
            children: [
              Container(
                color: const Color(0xFFECF1FF),
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 21, 25, 73),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              const HexagonsBackground(),
              Positioned.fill(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 30.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 90),
                                  Image.asset(
                                    'assets/images/premium.png',
                                    width: 68,
                                    height: 68,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '92j : 12h : 30 m',
                                    style: TextStyle(
                                      fontSize: 5.5.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        height: 90,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: const CircleAvatar(
                                          radius: 40,
                                          backgroundImage: AssetImage(
                                              'assets/images/person.png'),
                                          backgroundColor: Color.fromARGB(
                                              255, 255, 185, 157),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -4,
                                        right: -8,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 36,
                                              width: 36,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: const Color(0xFF4551AC),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    spreadRadius: 1,
                                                    blurRadius: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 36,
                                              width: 36,
                                              child: CircularProgressIndicator(
                                                value: 0.6,
                                                strokeWidth: 2.5,
                                                backgroundColor: Colors.white,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.green),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(height: 2),
                                                    Text(
                                                      'Niv',
                                                      style: TextStyle(
                                                        fontSize: 7.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                        height: 0.8,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    Text(
                                                      userData['level']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                        height: 0.8,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    userData['username'],
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFFC4D2FF),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 12,
                                              right: 16,
                                              top: 2,
                                              bottom: 2),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFC4D2FF),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            userData['title'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          '#$userRank',
                                          style: TextStyle(
                                              color: const Color(0xFFB4BDFF),
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          formatNumberWithPoints(
                                              userData['score']),
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white)),
                                      const SizedBox(width: 10),
                                      SvgPicture.asset(
                                        'assets/icons/coins.svg',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    children: [
                                      Badge(
                                          textColor: Colors.white,
                                          backgroundColor:
                                              const Color(0xFFDD405D),
                                          smallSize: 14,
                                          alignment: Alignment.topLeft,
                                          offset: const Offset(-1, -1),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(0, 30),
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  const Color(0xFF4551AC),
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/settings.svg',
                                              width: 30,
                                              height: 30,
                                              color: Colors.white,
                                            ),
                                          )),
                                      const SizedBox(height: 6),
                                      Badge(
                                          textColor: Colors.white,
                                          backgroundColor:
                                              const Color(0xFFDD405D),
                                          smallSize: 14,
                                          alignment: Alignment.topLeft,
                                          offset: const Offset(-1, -1),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(0, 30),
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  const Color(0xFF4551AC),
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/trophy.svg',
                                              width: 30,
                                              height: 30,
                                              color: Colors.white,
                                            ),
                                          )),
                                      const SizedBox(height: 6),
                                      Badge(
                                          textColor: Colors.white,
                                          backgroundColor:
                                              const Color(0xFFDD405D),
                                          smallSize: 14,
                                          alignment: Alignment.topLeft,
                                          offset: const Offset(-1, -1),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(0, 30),
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  const Color(0xFF4551AC),
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/card.svg',
                                              width: 28,
                                              height: 30,
                                              color: Colors.white,
                                            ),
                                          )),
                                      const SizedBox(height: 4),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(30, 30),
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              const Color(0xFF4551AC),
                                          padding: const EdgeInsets.all(7.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/icons/share.svg',
                                          width: 24,
                                          height: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(height: 18),
                          GeniusPass(
                            geniusPassXp: userData['geniusPassXp'],
                          ),
                          const SizedBox(height: 40),
                          Column(
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
                                          description:
                                              'Taux de cotes validés')),
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
                          ),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 56,
                left: 24,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 30),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF7584FF),
                    padding: const EdgeInsets.only(
                        left: 4.0, right: 14.0, top: 0.0, bottom: 0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/chevron_left.svg',
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Retour',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
