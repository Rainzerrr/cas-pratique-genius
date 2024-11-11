import 'package:caspratique/services/firestore.dart';
import 'package:caspratique/utils/export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    UserService userService = UserService();
    Map<String, dynamic> userData;
    return FutureBuilder<DocumentSnapshot>(
        future: userService.getUserData(currentUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            userData = {'score': 453, 'title': 'Champion'};
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            userData = {'score': 453, 'title': 'Champion'};
          }

          userData = snapshot.data!.data() as Map<String, dynamic>;

          return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.25), // Couleur de l'ombre avec opacité
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(
                        0, 2), // Ombre décalée vers le bas uniquement
                  ),
                ],
              ),
              child: AppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 1,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/profile',
                                  arguments: {
                                    'userId': currentUserId,
                                    'userRank': 3
                                  }, // Id de l'utilisateur courrant, identique à l'utilisateur en bleu dans la page de classement.
                                );
                              },
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: const CircleAvatar(
                                      radius: 28,
                                      backgroundImage: AssetImage(
                                          'assets/images/person.png'),
                                      backgroundColor: Color(0xFFFACD3A),
                                    )),
                                const SizedBox(
                                    height: 46,
                                    width: 46,
                                    child: CircularProgressIndicator(
                                      value: 0.6,
                                      strokeWidth: 3,
                                      backgroundColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.green),
                                    )),
                              ])),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/coins.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    formatNumberWithSpaces(userData['score']),
                                    style: TextStyle(
                                      color: const Color(0xFF364F6B),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.only(right: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFF7584FF),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 6,
                                        right: 14,
                                        top: 2.5,
                                        bottom: 2.5,
                                      ), // Padding interne
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF6777EE),
                                        borderRadius: BorderRadius.circular(
                                            4), // Coins arrondis
                                      ),
                                      child: Text(
                                        userData['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8.5.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '#3',
                                      style: TextStyle(
                                        color: const Color(0xFF7584FF),
                                        fontSize: 8.5.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Badge(
                        textColor: Colors.white,
                        backgroundColor: const Color(0xFFDD405D),
                        label: const Text('1'),
                        textStyle: TextStyle(fontSize: 6.sp),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 6,
                              bottom: 6), // Padding personnalisé
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFFE601),
                                Color(0xFFFFB444)
                              ], // Dégradé
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/shop.svg',
                                width: 22,
                                height: 22,
                                color: const Color(0xFF364F6B),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Boutique',
                                style: TextStyle(
                                    color: const Color(0xFF364F6B),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    height: 1.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )));
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(62);
}
