import 'package:caspratique/services/firestore.dart';
import 'package:caspratique/widgets/ranking_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF1FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                'CLASSEMENT',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF364F6B),
                  height: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                'AMIS',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF364F6B),
                  height: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 9.0),
              child: Text(
                'Compare ton classement avec tes amis et regarde lequel est le meilleur d\'entre vous',
                style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF718397),
                  height: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            StreamBuilder(
                stream: userService.getUsersRanking(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final users = snapshot.data!.docs;
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot document = users[index];

                        final Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;

                        return RankingCard(
                          userId: document.id,
                          rank: index + 1,
                          username: data['username'],
                          imageUrl: 'assets/images/person.png',
                          score: data['score'],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 2.0);
                      },
                    );
                  } else {
                    return const Text("Chargement...");
                  }
                })
          ],
        ),
      ),
    );
  }
}
